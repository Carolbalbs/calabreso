---
title: "Estruturas de Controle"
---
## Condicional

```yotra
se plante (idade >= 18) {
    pegaVisao("Você é maior de idade.");
} sePlante (idade > 12) {
    pegaVisao("Você é adolescente.");
} va nessa {
    pegaVisao("Você é criança.");
}
```

## Laço `paletada` (for)

```yotra
paletada (var inteiro i = 0; i < 5; i++) {
    pegaVisao("Número: " + i);
}
```

## Laço `enquanto` (while)

```yotra
var inteiro tentativas = 0;
enquanto (tentativas < 3) {
    pegaVisao("Tentativa número: " + tentativas);
    tentativas++;
}
```

## Laço `faz...enquanto` (do-while)

```yotra
vareia inteiro j = 0;
faz {
    pegaVisao("Executando pelo menos uma vez.");
    j++;
} enquanto (j < 1);
```