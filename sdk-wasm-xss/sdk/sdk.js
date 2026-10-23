// sdk.js — Loader do mini-SDK, VERSÃO 1 (INGÊNUA / propositalmente fraca).
//
// Fraquezas didáticas desta v1:
//   - expõe TUDO em window.sdk: exports do Wasm, a memória e gerar_token;
//   - não faz nenhuma checagem de ambiente (não detecta monkey patch);
//   - instancia o Wasm com WebAssembly.instantiate "cru" (hookável).
//
// Fluxo honesto: pega nonce no servidor -> coleta sinais do navegador ->
// calcula token no Wasm -> envia {nonce, sinais, token} para /verificar.

window.sdk = (function () {
  // Offsets de scratch na linear memory, ACIMA do stack pointer (65536),
  // em região de heap não usada. Aqui o JS escreve as strings.
  var OFF_NONCE = 0x10000;   // 65536
  var OFF_SINAIS = 0x20000;  // 131072

  var _exports = null;
  var _memory = null;
  var enc = new TextEncoder();

  // Instancia o Wasm. Lazy: só roda quando init() é chamado (pelo botão),
  // o que dá tempo de um eventual atacante hookar WebAssembly.instantiate antes.
  async function init() {
    var resp = await fetch('/sdk/sdk.wasm');
    var bytes = await resp.arrayBuffer();
    // Instanciação "crua" — este ponto é exatamente o que o ataque (c) hooka.
    var result = await WebAssembly.instantiate(bytes, {});
    _exports = result.instance.exports;
    _memory = _exports.memory;
    // v1 INGÊNUA: publica exports e memória no global. Qualquer script da página
    // (inclusive um XSS) passa a poder chamar o Wasm e ler/escrever a memória.
    window.sdk._exports = _exports;
    window.sdk._memory = _memory;
  }

  // Escreve uma string UTF-8 num offset da memória e devolve [ptr, len].
  function escrever(str, off) {
    var mem = new Uint8Array(_memory.buffer);
    var bytes = enc.encode(str);
    mem.set(bytes, off);
    return [off, bytes.length];
  }

  // Wrapper público de gerar_token: aceita strings, cuida da memória.
  function gerar_token(nonceStr, sinaisStr) {
    var n = escrever(nonceStr, OFF_NONCE);
    var s = escrever(sinaisStr, OFF_SINAIS);
    // >>> 0 para interpretar como uint32 (o C devolve inteiro sem sinal).
    return _exports.gerar_token(n[0], n[1], s[0], s[1]) >>> 0;
  }

  // Monta a string de sinais a partir do navegador. É ESTA string exata que
  // vai no hash e no corpo da requisição (o servidor recalcula sobre ela).
  function coletarSinais() {
    return JSON.stringify({
      userAgent: navigator.userAgent,
      platform: navigator.platform,
    });
  }

  // Fluxo completo e honesto do SDK.
  async function rodar() {
    if (!_exports) await init();

    // 1) Nonce do servidor (fonte da verdade).
    var nonce = await (await fetch('/nonce')).text();

    // 2) Sinais do navegador.
    var sinais = coletarSinais();

    // 3) Token calculado no Wasm.
    var token = gerar_token(nonce, sinais);

    // 4) Envia para verificação.
    var resp = await fetch('/verificar', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ nonce: nonce, sinais: sinais, token: token }),
    });
    var veredito = await resp.json();
    mostrar(veredito, { nonce: nonce, sinais: sinais, token: token });
    return veredito;
  }

  // Mostra o resultado na página (apenas para observação no lab).
  function mostrar(veredito, enviado) {
    var el = document.getElementById('resultado-sdk');
    if (!el) return;
    el.textContent =
      'Resultado: ' + veredito.resultado +
      '  | motivo: ' + veredito.motivo +
      '\nenviado: ' + JSON.stringify(enviado);
  }

  // v1 expõe tudo publicamente.
  return { init: init, rodar: rodar, gerar_token: gerar_token, coletarSinais: coletarSinais };
})();
