# Lab: Buffer Overflow em WebAssembly + CSP `wasm-unsafe-eval`

Montei este lab local (só `localhost`) para entender na prática, antes de uma
entrevista de Web Security Engineer, três coisas: a **linear memory** de um
módulo Wasm, um **buffer overflow** dentro dela e o efeito da **CSP** sobre a
compilação de WebAssembly.

## O que construí

- **`vuln/vuln.c`** — módulo propositalmente vulnerável. Uma struct global
  `{ char buf[16]; int is_admin; }` (campos vizinhos na memória) e um
  `set_name` que copia a entrada com `strcpy`, sem checar tamanho.
- **`fixed/fixed.c`** — a mesma coisa, corrigida: `strncpy` com limite +
  terminador `'\0'` garantido.
- **`index.html` + `app.js`** — página que envia a string para a linear memory
  (via `_malloc`/`stringToUTF8`), chama `set_name` e mostra `is_admin`.
- **`fixed/index.html` + `fixed/app.js`** — versão corrigida, com validação de
  tamanho também no JS (defesa em profundidade).
- **`server.py`** — servidor estático sem dependências, com CSP configurável.
- **`analysis/`** — saídas de `wasm-objdump -x` e `wasm2wat`.

## Como rodar

```bash
# 1) Compilar o módulo vulnerável
cd vuln
emcc vuln.c -O0 -o vuln.js \
  -sEXPORTED_FUNCTIONS='["_set_name","_get_is_admin","_reset","_malloc","_free"]' \
  -sEXPORTED_RUNTIME_METHODS='["ccall","stringToUTF8","lengthBytesUTF8","HEAPU8"]'
cd ..

# 2) Compilar a versão corrigida
cd fixed
emcc fixed.c -O0 -o fixed.js \
  -sEXPORTED_FUNCTIONS='["_set_name","_get_is_admin","_reset","_malloc","_free"]' \
  -sEXPORTED_RUNTIME_METHODS='["ccall","stringToUTF8","lengthBytesUTF8","HEAPU8"]'
cd ..

# 3) Servir (escolha o modo de CSP: none | self | wasm)
python3 server.py none 8000
# Abrir http://127.0.0.1:8000/         (vulnerável)
#        http://127.0.0.1:8000/fixed/  (corrigida)
```

## O que observei

### Overflow (Etapa 1–2)
Com `buf[16]` e `is_admin` adjacentes, digitar **17 ou mais** caracteres faz o
`strcpy` transbordar de `buf` e sobrescrever `is_admin`:

- `"alice"` (5) → `is_admin = 0`.
- 16 chars exatos → `is_admin = 0` (o `'\0'` cai no 1º byte, que já era 0).
- 17 chars terminando em `B` → `is_admin = 66` (`0x42`): 1 byte vazou.
- 20 × `A` → `is_admin = 1094795585` (`0x41414141`): overflow cheio.

### CSP (Etapa 3)
- **`none`** e **`wasm`** (`script-src 'self' 'wasm-unsafe-eval'`) → o módulo
  carrega e o overflow funciona.
- **`self`** (`script-src 'self'`) → o navegador **recusa compilar** o Wasm
  (`CompileError` / "Refused to compile ... WebAssembly"). O `.wasm` ainda
  baixa (200 na aba Network); o bloqueio é na **compilação**, não no download.
  Por isso movi o JS para `app.js` externo: assim `'self'` libera o JS
  same-origin e isola o bloqueio no Wasm.

### Inspeção do binário (Etapa 4)
- **Imports:** só `env.emscripten_resize_heap`. A superfície de contato com o
  host é mínima.
- **Exports:** `memory` + `set_name`, `get_is_admin`, `reset`, `malloc`, `free`.
- **Memory:** `pages: initial=258 max=258` — um único `ArrayBuffer` linear.
  `buf` e `is_admin` são offsets vizinhos nele; daí o overflow.
- **A cópia:** em `set_name`, um `call` para a rotina de `strcpy` — um loop
  `i32.load8_u`/`i32.store8` que só para no byte zero, **sem checagem de
  limite**. A vulnerabilidade aparece no próprio bytecode.

### Correção (Etapa 5)
Com `strncpy` limitado a 15 bytes + `'\0'`, a mesma entrada de 20 chars deixa
`is_admin = 0`. O JS ainda rejeita entradas > 15 bytes antes de chamar o Wasm.

## O que aprendi

A sandbox do WebAssembly protege o **host**: o módulo não escapa da sua linear
memory nem acessa o SO fora do que é importado. Mas ela **não protege a lógica
interna** do módulo — um overflow dentro da linear memory corrompe as próprias
estruturas (aqui, `is_admin`) exatamente como em C nativo. Segurança de memória
continua sendo responsabilidade do código. E a CSP com `wasm-unsafe-eval` é um
controle de **carregamento** (deixa ou não o Wasm compilar), não uma proteção
contra bugs de memória do módulo já carregado.

## Limitações

Isto é um **lab educativo**. Não cobre:

- exploração de bugs da **engine** Wasm do navegador (só do módulo);
- mitigações como **CFI**, stack canaries, ASLR ou memory tagging;
- cenários realistas de exploit (aqui só sobrescrevo uma flag adjacente);
- hardening de produção (o `-O0` e a ausência de sanitizers são propositais
  para tornar o overflow observável).
