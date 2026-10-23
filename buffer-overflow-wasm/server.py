#!/usr/bin/env python3
# server.py — servidor estático mínimo com CSP configurável (sem dependências).
#
# Uso:
#   python3 server.py [modo] [porta]
#
# modo:
#   none  -> não envia nenhum header Content-Security-Policy (padrão)
#   self  -> Content-Security-Policy: script-src 'self'
#            (deve BLOQUEAR o Wasm: navegadores exigem 'wasm-unsafe-eval'
#             para compilar/instanciar WebAssembly quando há CSP ativa)
#   wasm  -> Content-Security-Policy: script-src 'self' 'wasm-unsafe-eval'
#            (deve FUNCIONAR: libera scripts same-origin e a compilação do Wasm)
#
# porta: padrão 8000

import sys
import http.server
import socketserver

# Mapa dos modos para o valor do header (None = não enviar o header).
POLICIES = {
    "none": None,
    "self": "script-src 'self'",
    "wasm": "script-src 'self' 'wasm-unsafe-eval'",
}

# Lê os argumentos de linha de comando.
modo = sys.argv[1] if len(sys.argv) > 1 else "none"
porta = int(sys.argv[2]) if len(sys.argv) > 2 else 8000

if modo not in POLICIES:
    print(f"Modo inválido: {modo!r}. Use um de: {', '.join(POLICIES)}")
    sys.exit(1)

csp = POLICIES[modo]


class Handler(http.server.SimpleHTTPRequestHandler):
    # Garante o MIME correto para .wasm; sem isso a instanciação por streaming
    # do navegador pode falhar por motivo alheio ao que queremos observar.
    extensions_map = {
        **http.server.SimpleHTTPRequestHandler.extensions_map,
        ".wasm": "application/wasm",
        ".js": "text/javascript",
    }

    # Injeta o header CSP (quando houver) em toda resposta.
    def end_headers(self):
        if csp is not None:
            self.send_header("Content-Security-Policy", csp)
        # Evita cache do navegador atrapalhar os testes entre modos.
        self.send_header("Cache-Control", "no-store")
        super().end_headers()


# allow_reuse_address evita "Address already in use" ao reiniciar rápido.
socketserver.TCPServer.allow_reuse_address = True

with socketserver.TCPServer(("127.0.0.1", porta), Handler) as httpd:
    print(f"Servindo em http://127.0.0.1:{porta}  (modo CSP: {modo})")
    if csp is not None:
        print(f"  Content-Security-Policy: {csp}")
    else:
        print("  (sem header Content-Security-Policy)")
    print("Ctrl+C para parar.")
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\nEncerrado.")
