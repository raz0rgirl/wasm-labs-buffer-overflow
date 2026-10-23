// bypass-v2.js — prova, rodando de verdade no Node, o primitivo central que
// derrota as checagens da v2: falsificar Function.prototype.toString para que
// um WebAssembly.instantiate HOOKADO volte a "parecer nativo".
//
// É exatamente a checagem que a v2 faz: ehNativa(fn) testa se o toString de fn
// contém "[native code]". Se o atacante controla o toString, ele mente.
//
// Uso: node attack/bypass-v2.js

// Mesma lógica de ehNativa da v2, usando o toString ATUAL (como a v2 faria ao
// carregar DEPOIS do atacante).
function ehNativa(fn) {
  try { return /\[native code\]/.test(Function.prototype.toString.call(fn)); }
  catch (e) { return true; }
}

console.log('1) ambiente limpo');
console.log('   instantiate parece nativa?', ehNativa(WebAssembly.instantiate), '(esperado: true)');

console.log('\n2) atacante HOOKA WebAssembly.instantiate');
const origInstantiate = WebAssembly.instantiate;
WebAssembly.instantiate = function (...args) { return origInstantiate.apply(this, args); };
console.log('   v2 detectaria o hook?', !ehNativa(WebAssembly.instantiate), '(esperado: true -> PEGOU)');

console.log('\n3) atacante FALSIFICA Function.prototype.toString (Proxy que mente)');
const realToString = Function.prototype.toString;
const mentiras = new WeakSet([WebAssembly.instantiate]);
const proxyToString = new Proxy(realToString, {
  apply(target, thisArg, args) {
    // Mente para a função plantada e para o próprio toString (auto-ocultação).
    if (mentiras.has(thisArg) || thisArg === proxyToString) {
      return 'function () { [native code] }';
    }
    return Reflect.apply(target, thisArg, args);
  },
});
mentiras.add(proxyToString);
Function.prototype.toString = proxyToString;

console.log('   v2 detectaria o hook agora?', !ehNativa(WebAssembly.instantiate), '(esperado: false -> ESCAPOU)');
console.log('   v2 detectaria o toString adulterado?', !ehNativa(Function.prototype.toString), '(esperado: false -> ESCAPOU)');

console.log('\nConclusão: quem roda ANTES e controla o toString apaga as próprias');
console.log('pegadas. A detecção no cliente é corrida de gato e rato.');
