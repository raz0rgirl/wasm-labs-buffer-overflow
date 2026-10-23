// sdk.c — núcleo do mini-SDK compilado para WebAssembly.
//
// Expõe gerar_token(nonce, sinais): calcula um token determinístico a partir
// do nonce (vindo do servidor) e de uma string de "sinais" do navegador.
//
// O hash é DIDÁTICO (FNV-1a de 32 bits), NÃO é criptografia. Só precisa ser
// reproduzível: o servidor recalcula o mesmo valor para conferir.
//
// Como é um Wasm "standalone" (sem runtime Emscripten), o JS escreve as strings
// diretamente na linear memory (exportada) e passa ponteiro + tamanho.

#include <stdint.h>

// Mistura um bloco de bytes no acumulador FNV-1a.
static uint32_t fnv1a(uint32_t h, const unsigned char *dados, int n) {
    for (int i = 0; i < n; i++) {
        h ^= dados[i];        // XOR com o byte
        h *= 16777619u;       // multiplica pelo primo FNV (wrap em 32 bits)
    }
    return h;
}

// gerar_token: hash de (nonce || sinais).
// Recebe ponteiros para dentro da linear memory e os comprimentos em bytes.
__attribute__((export_name("gerar_token")))
uint32_t gerar_token(const unsigned char *nonce, int nlen,
                     const unsigned char *sinais, int slen) {
    uint32_t h = 2166136261u;          // offset basis do FNV-1a
    h = fnv1a(h, nonce, nlen);
    h = fnv1a(h, sinais, slen);
    return h;
}
