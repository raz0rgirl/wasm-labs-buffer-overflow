// sdk.js — Loader do mini-SDK, VERSÃO 2 (ENDURECIDA).
//
// Diferenças em relação à v1:
//   - IIFE: NADA é publicado em window. Sem exports e sem memória globais.
//   - captura referências nativas no carregamento e DETECTA adulteração;
//   - envia flags de adulteração no payload; o servidor as usa no score.
//   - vincula o botão internamente (não expõe função global).
//
// IMPORTANTE (ver Etapa 6): estas checagens são heurísticas de CLIENTE.
// Um atacante que roda ANTES e falsifica toString/usa Proxy pode enganá-las.
// Elevam o custo do ataque; não são prova.

(function () {
  'use strict';

  var OFF_NONCE = 0x10000;
  var OFF_SINAIS = 0x20000;
  var enc = new TextEncoder();

  // Referência nativa guardada ANTES de qualquer uso. Usada para testar se
  // outras funções ainda "parecem" nativas.
  var nativeToString = Function.prototype.toString;

  function ehNativa(fn) {
    try { return /\[native code\]/.test(nativeToString.call(fn)); }
    catch (e) { return true; } // se nem dá para inspecionar, não acusa
  }

  // Coleta as flags de adulteração do ambiente.
  function detectarAdulteracao() {
    var flags = {};

    // 1) Function.prototype.toString foi trocado por uma função JS?
    //    (se não for nativa, alguém mexeu — base de muitos anti-detecção)
    flags.toStringAdulterado = !ehNativa(Function.prototype.toString);

    // 2) WebAssembly.instantiate foi hookado?
    flags.instantiateHookado = !ehNativa(WebAssembly.instantiate);

    // 3) navigator ganhou PROPRIEDADE PRÓPRIA (defineProperty no objeto)?
    //    Num navegador limpo, userAgent/platform vivem no protótipo, não no
    //    próprio navigator.
    var ownUA = Object.getOwnPropertyDescriptor(navigator, 'userAgent');
    var ownPlat = Object.getOwnPropertyDescriptor(navigator, 'platform');
    flags.navigatorPropPropria = !!(ownUA || ownPlat);

    // 4) O getter no PROTÓTIPO (Navigator.prototype) deixou de ser nativo?
    //    (defineProperty no protótipo, ou getter próprio não-nativo)
    var proto = Object.getPrototypeOf(navigator);
    var dProto = Object.getOwnPropertyDescriptor(proto, 'userAgent');
    var getterProtoSuspeito = !!(dProto && dProto.get && !ehNativa(dProto.get));
    var getterProprioSuspeito = !!(ownUA && ownUA.get && !ehNativa(ownUA.get));
    flags.navigatorDescritor = getterProtoSuspeito || getterProprioSuspeito;

    return flags;
  }

  // Instancia o Wasm em escopo FECHADO. exports e memory ficam locais.
  var _exports = null, _memory = null;
  async function init() {
    var resp = await fetch('/sdk-v2/sdk.wasm');
    var bytes = await resp.arrayBuffer();
    var result = await WebAssembly.instantiate(bytes, {});
    _exports = result.instance.exports;
    _memory = _exports.memory;
    // NÃO publicamos nada em window.
  }

  function gerar_token(nonceStr, sinaisStr) {
    var mem = new Uint8Array(_memory.buffer);
    var bn = enc.encode(nonceStr), bs = enc.encode(sinaisStr);
    mem.set(bn, OFF_NONCE); mem.set(bs, OFF_SINAIS);
    return _exports.gerar_token(OFF_NONCE, bn.length, OFF_SINAIS, bs.length) >>> 0;
  }

  function coletarSinais() {
    return JSON.stringify({
      userAgent: navigator.userAgent,
      platform: navigator.platform,
    });
  }

  async function rodar() {
    if (!_exports) await init();

    var nonce = await (await fetch('/nonce')).text();
    var sinais = coletarSinais();
    var token = gerar_token(nonce, sinais);
    var flags = detectarAdulteracao();   // <- diferencial da v2

    var resp = await fetch('/verificar', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ nonce: nonce, sinais: sinais, token: token, flags: flags }),
    });
    var veredito = await resp.json();
    mostrar(veredito, flags);
    return veredito;
  }

  function mostrar(veredito, flags) {
    var el = document.getElementById('resultado-sdk');
    if (!el) return;
    el.textContent =
      'Resultado: ' + veredito.resultado +
      '  | motivo: ' + veredito.motivo +
      '\nflags enviadas: ' + JSON.stringify(flags);
  }

  // Vincula ao botão SEM expor nada em window.
  function ligarBotao() {
    var b = document.getElementById('btn');
    if (b) b.addEventListener('click', rodar);
  }
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', ligarBotao);
  } else {
    ligarBotao();
  }
})();
