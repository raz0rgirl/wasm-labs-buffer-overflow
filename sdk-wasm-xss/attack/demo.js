// demo.js — reproduz no terminal o que cada payload de XSS faria contra o
// servidor, e imprime o veredito. Assim você vê aprovado/suspeito/rejeitado
// sem precisar abrir o navegador. (No navegador, use attack/payloads.md.)
//
// Uso: node attack/demo.js            -> ataques contra a v1
//      node attack/demo.js v2         -> ataques contra a v2 (com flags)
//
// Rode o servidor antes:  node server.js 8000

const fs = require('fs');
const path = require('path');

const BASE = 'http://127.0.0.1:8000';
const ALVO = process.argv[2] === 'v2' ? 'v2' : 'v1';

// Carrega o Wasm (o mesmo que o SDK usa) para calcular tokens como o atacante.
const wasmPath = ALVO === 'v2'
  ? path.join(__dirname, '..', 'sdk-v2', 'sdk.wasm')
  : path.join(__dirname, '..', 'sdk', 'sdk.wasm');

let ex, mem;
const enc = new TextEncoder();
function token(nonce, sinais) {
  const bn = enc.encode(nonce), bs = enc.encode(sinais);
  mem.set(bn, 0x10000); mem.set(bs, 0x20000);
  return ex.gerar_token(0x10000, bn.length, 0x20000, bs.length) >>> 0;
}
async function nonce() { return (await fetch(BASE + '/nonce')).text(); }
async function verificar(corpo) {
  const r = await fetch(BASE + '/verificar', {
    method: 'POST', headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(corpo),
  });
  return r.json();
}
function linha(nome, v) {
  console.log(`  [${nome}] -> ${v.resultado.toUpperCase().padEnd(9)} motivo: ${v.motivo}`);
}

(async () => {
  const bytes = fs.readFileSync(wasmPath);
  const { instance } = await WebAssembly.instantiate(bytes, {});
  ex = instance.exports;
  mem = new Uint8Array(ex.memory.buffer);

  // Na v2 o SDK manda flags de adulteração. Aqui simulamos as flags que o
  // ambiente adulterado de cada ataque produziria (true = detectado).
  const flagsV2 = (f) => (ALVO === 'v2' ? f : undefined);

  console.log(`\n=== Ataques contra ${ALVO.toUpperCase()} ===\n`);

  // (a) Usar o SDK/algoritmo para forjar uma submissão com entradas arbitrárias.
  // Na v1 isso é via window.sdk; na v2 o atacante reimplementa o hash (ele é
  // didático e conhecido). Sinais plausíveis e consistentes.
  {
    const s = JSON.stringify({ userAgent: 'Mozilla/5.0 (Windows NT 10.0)', platform: 'Win32' });
    const n = await nonce();
    const v = await verificar({ nonce: n, sinais: s, token: token(n, s), flags: flagsV2({}) });
    linha('a) entradas arbitrárias', v);
  }

  // (b1) Monkey patch DESLEIXADO: troca só o userAgent para iPhone, esquece o platform.
  {
    const s = JSON.stringify({ userAgent: 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X)', platform: 'Win32' });
    const n = await nonce();
    const v = await verificar({ nonce: n, sinais: s, token: token(n, s), flags: flagsV2({ navigatorPropPropria: true }) });
    linha('b1) spoof só UA (desleixado)', v);
  }

  // (b2) Monkey patch CUIDADOSO: troca userAgent E platform coerentemente.
  {
    const s = JSON.stringify({ userAgent: 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X)', platform: 'iPhone' });
    const n = await nonce();
    // Na v2, adulterar navigator deixa rastro (propriedade própria / descriptor).
    const v = await verificar({ nonce: n, sinais: s, token: token(n, s), flags: flagsV2({ navigatorPropPropria: true, navigatorDescritor: true }) });
    linha('b2) spoof UA+platform (coerente)', v);
  }

  // (c) Hook de WebAssembly.instantiate: captura exports/memória. O atacante
  // ainda forja um token válido (tem o módulo). Na v2, o hook é detectável.
  {
    const s = JSON.stringify({ userAgent: 'Mozilla/5.0 (Windows NT 10.0)', platform: 'Win32' });
    const n = await nonce();
    const v = await verificar({ nonce: n, sinais: s, token: token(n, s), flags: flagsV2({ instantiateHookado: true, toStringAdulterado: false }) });
    linha('c) hook instantiate', v);
  }

  // (d) Replay: pega UM nonce, usa (aprovado) e tenta reusar o MESMO nonce.
  {
    const s = JSON.stringify({ userAgent: 'Mozilla/5.0 (Windows NT 10.0)', platform: 'Win32' });
    const n = await nonce();
    const t = token(n, s);
    const v1 = await verificar({ nonce: n, sinais: s, token: t, flags: flagsV2({}) });
    const v2 = await verificar({ nonce: n, sinais: s, token: t, flags: flagsV2({}) }); // mesmo nonce de novo
    linha('d) 1o envio', v1);
    linha('d) replay (mesmo nonce)', v2);
  }

  console.log('');
})();
