// vuln.c — Módulo WebAssembly PROPOSITALMENTE vulnerável (lab educativo).
//
// Objetivo: demonstrar um buffer overflow dentro da linear memory de um
// módulo Wasm. A ideia é que "buf" e "is_admin" fiquem lado a lado na
// memória, de modo que escrever além dos 16 bytes de "buf" acabe
// sobrescrevendo "is_admin".

#include <string.h>   // strcpy, memset
#include <emscripten.h>  // macro EMSCRIPTEN_KEEPALIVE (impede o linker de descartar as funções)

// Struct GLOBAL. Em C, os membros ficam em memória na ORDEM de declaração.
// Como "buf" tem 16 bytes e "is_admin" é um int (4 bytes, já alinhado no
// offset 16), não há padding entre eles: is_admin fica IMEDIATAMENTE após buf.
//
// Layout esperado na linear memory (offsets relativos ao início da struct):
//   [ 0 .. 15]  buf       (16 bytes)
//   [16 .. 19]  is_admin  (4 bytes)
struct estado {
    char buf[16];
    int  is_admin;
};

// Instância global única. Fica na região de dados do módulo.
static struct estado st;

// set_name: copia "input" para st.buf usando strcpy.
// strcpy NÃO checa o tamanho de destino: copia byte a byte até encontrar o
// '\0' de "input". Se input tiver mais de 16 bytes, os bytes excedentes
// "vazam" de buf e caem sobre is_admin (e além). Essa é a vulnerabilidade.
EMSCRIPTEN_KEEPALIVE
void set_name(const char *input) {
    strcpy(st.buf, input);   // <-- cópia sem limite: ponto vulnerável
}

// get_is_admin: apenas devolve o valor atual de is_admin, para observarmos
// se o overflow o alterou.
EMSCRIPTEN_KEEPALIVE
int get_is_admin(void) {
    return st.is_admin;
}

// reset: zera toda a struct, voltando is_admin para 0 e limpando buf.
EMSCRIPTEN_KEEPALIVE
void reset(void) {
    memset(&st, 0, sizeof(st));
}
