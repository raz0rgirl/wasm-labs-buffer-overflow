// server.js — servidor do lab, sem dependências (só módulos nativos do Node).
// Serve os arquivos estáticos e expõe /nonce e /verificar.
//
// Uso: node server.js [porta]   (padrão 8000)

const http = require('http');
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

const PORTA = parseInt(process.argv[2] || '8000', 10);
const RAIZ = __dirname;
const TTL_MS = 30 * 1000; // 30 segundos de vida do nonce

// ---------------------------------------------------------------------------
// Hash didático: PRECISA ser idêntico ao do sdk.c (FNV-1a 32 bits).
// É assim que o servidor é a fonte da verdade: ele RECALCULA o token.
// ---------------------------------------------------------------------------
function fnv1a(h, buf) {
  for (let i = 0; i < buf.length; i++) {
    h ^= buf[i];                     // XOR com o byte
    h = Math.imul(h, 16777619) >>> 0; // multiplica pelo primo (uint32)
  }
  return h >>> 0;
}
function gerarToken(nonce, sinais) {
  let h = 2166136261 >>> 0;           // offset basis
  h = fnv1a(h, Buffer.from(nonce, 'utf8'));
  h = fnv1a(h, Buffer.from(sinais, 'utf8'));
  return h >>> 0;
}

// ---------------------------------------------------------------------------
// Store de nonces em memória: nonce -> { expira, usado }.
// Uso único (usado=true após consumir) e vida curta (expira).
// ---------------------------------------------------------------------------
const nonces = new Map();
function emitirNonce() {
  const nonce = crypto.randomBytes(16).toString('hex');
  nonces.set(nonce, { expira: Date.now() + TTL_MS, usado: false });
  return nonce;
}

// ---------------------------------------------------------------------------
// Consistência entre sinais: userAgent x platform.
// Um atacante desleixado troca só o userAgent e esquece o platform.
// ---------------------------------------------------------------------------
function familiaUA(ua) {
  if (/iPhone|iPad|iPod/.test(ua)) return 'ios';
  if (/Android/.test(ua)) return 'android';
  if (/Windows/.test(ua)) return 'windows';
  if (/Macintosh|Mac OS X/.test(ua)) return 'mac';
  if (/Linux/.test(ua)) return 'linux';
  return 'desconhecido';
}
function familiaPlatform(p) {
  if (/iPhone|iPad|iPod/.test(p)) return 'ios';
  if (/Android/.test(p)) return 'android';
  if (/Win/.test(p)) return 'windows';
  if (/Mac/.test(p)) return 'mac';
  if (/Linux/.test(p)) return 'linux';
  return 'desconhecido';
}
function sinaisConsistentes(sinaisStr) {
  try {
    const s = JSON.parse(sinaisStr);
    const fa = familiaUA(s.userAgent || '');
    const fp = familiaPlatform(s.platform || '');
    if (fa === 'desconhecido' || fp === 'desconhecido') return true; // não acusa sem base
    return fa === fp;
  } catch (e) {
    return false; // sinais ilegíveis já são suspeitos
  }
}

// ---------------------------------------------------------------------------
// Decisão: monta um SCORE de risco. Nonce e token são barreiras duras
// (rejeição imediata). Consistência e flags de adulteração somam risco.
// ---------------------------------------------------------------------------
function verificar(corpo) {
  const { nonce, sinais, token, flags } = corpo;

  // Barreira 1: nonce precisa existir, não ter expirado e não ter sido usado.
  const reg = nonces.get(nonce);
  if (!reg) return { resultado: 'rejeitado', motivo: 'nonce inexistente ou já consumido (replay)' };
  if (reg.usado) return { resultado: 'rejeitado', motivo: 'nonce já usado (replay)' };
  if (Date.now() > reg.expira) {
    nonces.delete(nonce);
    return { resultado: 'rejeitado', motivo: 'nonce expirado' };
  }
  // Consome o nonce AGORA (uso único), mesmo que o resto falhe.
  reg.usado = true;

  // Barreira 2: o token tem que bater com o recálculo do servidor.
  const esperado = gerarToken(nonce, sinais);
  if ((token >>> 0) !== esperado) {
    return { resultado: 'rejeitado', motivo: 'token inválido (não confere com o recálculo)' };
  }

  // Score de risco (sinais moles).
  let score = 0;
  const motivos = [];
  if (!sinaisConsistentes(sinais)) { score += 2; motivos.push('sinais inconsistentes (UA x platform)'); }

  // Flags de adulteração enviadas pela v2 do SDK (a v1 não manda nenhuma).
  const f = flags || {};
  if (f.toStringAdulterado)   { score += 2; motivos.push('Function.prototype.toString adulterado'); }
  if (f.navigatorDescritor)   { score += 2; motivos.push('descriptor anômalo em navigator'); }
  if (f.navigatorPropPropria) { score += 1; motivos.push('propriedade própria suspeita em navigator'); }
  if (f.instantiateHookado)   { score += 2; motivos.push('WebAssembly.instantiate hookado'); }

  let resultado;
  if (score === 0) resultado = 'aprovado';
  else if (score <= 2) resultado = 'suspeito';
  else resultado = 'rejeitado';

  return { resultado, motivo: motivos.join('; ') || 'ok', score };
}

// ---------------------------------------------------------------------------
// HTTP
// ---------------------------------------------------------------------------
const MIME = {
  '.html': 'text/html; charset=utf-8',
  '.js': 'text/javascript; charset=utf-8',
  '.wasm': 'application/wasm',
  '.json': 'application/json; charset=utf-8',
  '.css': 'text/css; charset=utf-8',
};

function servirEstatico(req, res) {
  // Normaliza o caminho e impede path traversal para fora da raiz.
  let rel = decodeURIComponent(req.url.split('?')[0]);
  if (rel === '/') rel = '/integrador.html';
  const alvo = path.normalize(path.join(RAIZ, rel));
  if (!alvo.startsWith(RAIZ)) { res.writeHead(403); return res.end('proibido'); }
  fs.readFile(alvo, (err, dados) => {
    if (err) { res.writeHead(404); return res.end('não encontrado'); }
    res.writeHead(200, {
      'Content-Type': MIME[path.extname(alvo)] || 'application/octet-stream',
      'Cache-Control': 'no-store',
    });
    res.end(dados);
  });
}

const servidor = http.createServer((req, res) => {
  const url = req.url.split('?')[0];

  if (req.method === 'GET' && url === '/nonce') {
    const nonce = emitirNonce();
    res.writeHead(200, { 'Content-Type': 'text/plain', 'Cache-Control': 'no-store' });
    return res.end(nonce);
  }

  if (req.method === 'POST' && url === '/verificar') {
    let body = '';
    req.on('data', (c) => { body += c; if (body.length > 1e6) req.destroy(); });
    req.on('end', () => {
      let veredito;
      try { veredito = verificar(JSON.parse(body)); }
      catch (e) { veredito = { resultado: 'rejeitado', motivo: 'corpo inválido' }; }
      // Log no terminal para você observar cada ataque.
      console.log(`[/verificar] -> ${veredito.resultado.toUpperCase()} (${veredito.motivo})`);
      res.writeHead(200, { 'Content-Type': 'application/json' });
      res.end(JSON.stringify(veredito));
    });
    return;
  }

  return servirEstatico(req, res);
});

servidor.listen(PORTA, '127.0.0.1', () => {
  console.log(`Servidor do lab em http://127.0.0.1:${PORTA}  (nonce TTL ${TTL_MS / 1000}s)`);
  console.log('Páginas: /integrador.html (v1)  e  /integrador-v2.html (v2)');
});
