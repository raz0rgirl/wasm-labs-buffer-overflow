// app.js (versão corrigida) — mesma lógica da página vulnerável, mas com
// validação de tamanho na camada JS ANTES de chamar o Wasm.

// Capacidade útil de buf: 16 bytes menos 1 para o terminador '\0'.
var MAX_BYTES = 15;

var Module = {
  onRuntimeInitialized: function () {
    document.getElementById('status').textContent = 'Módulo Wasm pronto.';
    document.getElementById('btnEnviar').disabled = false;
    document.getElementById('btnReset').disabled = false;
  }
};

function enviar() {
  var str = document.getElementById('entrada').value;
  var avisoEl = document.getElementById('aviso');

  // DEFESA EM PROFUNDIDADE: validamos aqui, mesmo o C já sendo seguro.
  // Medimos em BYTES UTF-8 (não em caracteres), pois é isso que ocupa buf.
  var bytes = Module.lengthBytesUTF8(str);
  if (bytes > MAX_BYTES) {
    avisoEl.textContent =
      'Entrada rejeitada no JS: ' + bytes + ' bytes (máx. ' + MAX_BYTES + '). Não foi enviada ao Wasm.';
    return;
  }
  avisoEl.textContent = '';

  var tam = bytes + 1;
  var ptr = Module._malloc(tam);
  Module.stringToUTF8(str, ptr, tam);
  Module._set_name(ptr);
  var admin = Module._get_is_admin();
  Module._free(ptr);

  atualizarPainel(str.length, admin);
}

function resetar() {
  Module._reset();
  document.getElementById('entrada').value = '';
  document.getElementById('aviso').textContent = '';
  atualizarPainel(0, Module._get_is_admin());
}

function atualizarPainel(tamanho, admin) {
  document.getElementById('resultado').style.display = 'block';
  document.getElementById('tamanho').textContent = tamanho;
  var adminU = admin >>> 0;
  document.getElementById('valorAdmin').textContent =
    admin + '  (0x' + adminU.toString(16) + ')';

  var painel = document.getElementById('painel');
  var estado = document.getElementById('estado');
  if (admin !== 0) {
    estado.textContent = 'ADMIN! (não deveria acontecer na versão corrigida)';
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
