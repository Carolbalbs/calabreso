---
title: "Estruturas de Controle"
---
## Condicional

```js
se_ligue (nota >= 7.0) {
    oPrai("Aprovado com sucesso!");
} yotra (nota >= 5.0) {
    oPrai("Recuperação necessária.");
} nada_ve {
    oPrai("Reprovado.");
}
```

## Laço `dinovo` (for)

```js
dinovo (var inteiro contador = 1; contador <= 10; contador++) {
    oPrai("Tabuada do 5: 5 x " + contador + " = " + (5 * contador));

}
```

## Laço `ensonha` (while)

```js
var inteiro senha = 0;
ensonha (senha != 1234) {
    oPrai("Digite a senha correta:");
    // senha = leitura();
}
oPrai("Acesso liberado!");
```

## Laço `dorme...ensonha` (do-while)

```js
var inteiro opcao = 0;
dorme {
    oPrai("Menu: 1-Jogar | 2-Sair");
    oPrai("Escolha uma opção:");
    opcao++;
} ensonha (opcao < 2);
```