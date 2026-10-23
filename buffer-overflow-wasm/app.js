// app.js — lógica da página de teste do módulo vulnerável.
// Está em arquivo externo (não inline) para que "script-src 'self'" o libere
// como script same-origin, isolando na demonstração de CSP o bloqueio do Wasm.

// IMPORTANTE: "var Module" com o callback precisa existir ANTES de vuln.js
// carregar. A cola do Emscripten lê este objeto e chama onRuntimeInitialized
// quando o .wasm terminou de instanciar. Só então habilitamos os botões.
var Module = {
  onRuntimeInitialized: function () {
    document.getElementById('status').textContent = 'Módulo Wasm pronto.';
    document.getElementById('btnEnviar').disabled = false;
    document.getElementById('btnReset').disabled = false;
  }
};

// Envia a string atual para o módulo e atualiza o painel.
function enviar() {
  var str = document.getElementById('entrada').value;

  // 1) Alocamos espaço na linear memory: tamanho em bytes UTF-8 + 1 (o '\0').
  var tam = Module.lengthBytesUTF8(str) + 1;
  var ptr = Module._malloc(tam);

  // 2) Escrevemos a string (com terminador) no endereço alocado.
  Module.stringToUTF8(str, ptr, tam);

  // 3) Chamamos a função vulnerável: strcpy(buf, input) SEM checar tamanho.
  Module._set_name(ptr);

  // 4) Lemos is_admin de volta e liberamos a memória alocada.
  var admin = Module._get_is_admin();
  Module._free(ptr);

  atualizarPainel(str.length, admin);
}

function resetar() {
  Module._reset();
  document.getElementById('entrada').value = '';
  atualizarPainel(0, Module._get_is_admin());
}

function atualizarPainel(tamanho, admin) {
  document.getElementById('resultado').style.display = 'block';
  document.getElementById('tamanho').textContent = tamanho;
  // >>>0 força interpretação como inteiro sem sinal (o overflow pode gerar valores grandes).
  var adminU = admin >>> 0;
  document.getElementById('valorAdmin').textContent =
    admin + '  (0x' + adminU.toString(16) + ')';

  var painel = document.getElementById('painel');
  var estado = document.getElementById('estado');
  if (admin !== 0) {
    estado.textContent = 'ADMIN! (is_admin foi sobrescrito pelo overflow)';
    painel.className = 'admin-sim';
  } else {
    estado.textContent = 'usuário comum (is_admin = 0)';
    painel.className = 'admin-nao';
  }
}

document.getElementById('btnEnviar').addEventListener('click', enviar);
document.getElementById('btnReset').addEventListener('click', resetar);
document.getElementById('entrada').addEventListener('keydown', function (e) {
  if (e.key === 'Enter') enviar();
});
