// fixed.c — versão CORRIGIDA do módulo. Mesma struct, mas a cópia agora
// respeita o tamanho do destino e sempre termina a string com '\0'.

#include <string.h>       // strncpy, memset
#include <emscripten.h>

// Mesma struct da versão vulnerável: buf[16] seguido de is_admin.
struct estado {
    char buf[16];
    int  is_admin;
};

static struct estado st;

// set_name CORRIGIDO.
// Correção: copiamos no MÁXIMO sizeof(buf)-1 bytes e garantimos o terminador
// '\0' na última posição. Assim, mesmo que "input" seja gigante, jamais
// escrevemos além de buf[15] — is_admin (offset 16) fica intocado.
//
// Detalhe: strncpy NÃO garante terminação se a origem for >= n; por isso
// forçamos buf[15] = '\0' manualmente. Esse é o par idiomático seguro.
EMSCRIPTEN_KEEPALIVE
void set_name(const char *input) {
    strncpy(st.buf, input, sizeof(st.buf) - 1);  // no máx. 15 bytes
    st.buf[sizeof(st.buf) - 1] = '\0';           // termina a string sempre
}

EMSCRIPTEN_KEEPALIVE
int get_is_admin(void) {
    return st.is_admin;
}

EMSCRIPTEN_KEEPALIVE
void reset(void) {
    memset(&st, 0, sizeof(st));
}
