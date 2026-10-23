# Lab: XSS × SDK web protegido com WebAssembly

Montei este lab local (só `localhost`) para entender, antes de uma entrevista de
Web Security Frontend Engineer, três coisas: (1) o que um XSS na página de um
integrador consegue fazer contra um SDK com Wasm; (2) como o SDK pode detectar
adulteração de APIs do navegador — e os limites disso; (3) por que o **nonce de
uso único no servidor** é a fonte da verdade.

## O que construí

- **`sdk/sdk.c`** — núcleo em Wasm: `gerar_token(nonce, sinais)`, um hash
  didático FNV-1a (não é cripto).
- **`sdk/sdk.js`** — loader **v1 ingênuo**: expõe tudo em `window.sdk` (exports
  e memória), sem checar ambiente.
- **`sdk-v2/sdk.js`** — loader **v2 endurecido**: IIFE sem globais, detecta
  adulteração (`toString`, `instantiate`, `navigator`) e envia flags.
- **`server.js`** — Node sem dependências: `/nonce` (uso único, TTL 30 s) e
  `/verificar` (recalcula token, barra replay, checa consistência, score de risco).
- **`integrador.html` / `integrador-v2.html`** — páginas do integrador com um
  **XSS refletido proposital** (`?msg=` via `innerHTML`).
- **`attack/`** — `payloads.md` (payloads de URL), `demo.js` (reproduz a–d no
  terminal) e `bypass-v2.js` (prova o bypass da detecção).

## Como rodar

```bash
cd sdk-wasm-xss
# (se precisar recompilar o Wasm)
emcc sdk/sdk.c -O0 --no-entry -o sdk/sdk.wasm -sSTANDALONE_WASM \
  -sEXPORTED_FUNCTIONS='["_gerar_token"]' -sERROR_ON_UNDEFINED_SYMBOLS=0
cp sdk/sdk.wasm sdk-v2/sdk.wasm

node server.js 8000            # terminal 1
# Navegador:  http://127.0.0.1:8000/integrador.html   (v1)
#             http://127.0.0.1:8000/integrador-v2.html (v2)
node attack/demo.js            # terminal 2: ataques contra v1
node attack/demo.js v2         # ataques contra v2
node attack/bypass-v2.js       # prova do bypass da detecção
```

## Tabela v1 vs v2

| Ataque | v1 | v2 | Por quê |
|---|---|---|---|
| a) entradas arbitrárias via SDK | aprovado | aprovado | fechar o global não impede reimplementar o hash; sem adulteração, sem flag |
| b1) spoof só `userAgent` | suspeito | rejeitado | consistência UA×platform + propriedade própria em `navigator` |
| b2) spoof `userAgent`+`platform` | aprovado | rejeitado | `defineProperty` deixa rastro (descriptor/own-prop) |
| c) hook `WebAssembly.instantiate` | aprovado | suspeito | v2 vê `instantiate` sem `[native code]` |
| d) replay do nonce | rejeitado | rejeitado | barreira do servidor; não muda entre SDKs |
| e) bypass (falsifica `toString`) | — | aprovado | atacante roda antes e mente no `toString`: flags voltam limpas |

## O que observei em cada ataque

- **a)** Com `window.sdk` exposto, o XSS vira o próprio SDK: calcula token
  válido e envia. O servidor aprova porque, do lado dele, parece legítimo.
- **b)** A checagem de consistência pega o atacante desleixado; o cuidadoso
  passa na v1. A v2 detecta o ato de adulterar `navigator` (rastro no objeto).
- **c)** Hookar `instantiate` captura exports e memória. A v1 não percebe; a v2
  percebe pelo `toString`.
- **d)** Replay sempre barra no servidor: nonce é de uso único.
- **e)** Falsificando `toString` antes do SDK, a v2 reporta flags limpas e o
  ambiente adulterado é aprovado — mas o replay continua barrado.

## O que aprendi

Detecção de adulteração no cliente é uma **corrida de gato e rato**: tudo que o
SDK usa para checar o ambiente (`toString`, descriptors, `instantiate`) é
código que roda no mesmo contexto que o atacante pode ter adulterado **antes**.
Dá para encarecer o ataque, não para prová-lo. O que sobra de proteção **real**
é o que o atacante não controla: o **nonce de uso único** (mata replay), a
**consistência entre sinais** e o **score no servidor**. Confiança mora no
servidor; o cliente só fornece sinais, nunca garantias.

## Limitações

Lab educativo. O hash é **didático** (FNV-1a), não criptografia — num SDK real
usaria assinatura/HMAC com segredo no servidor e atestação adequada. Não cobre
bugs de **engine** Wasm, ofuscação/anti-tamper de verdade, nem canais como
iframes isolados, Trusted Types ou atestação de dispositivo. O "ataque" roda só
contra o meu próprio lab, em `localhost`.
