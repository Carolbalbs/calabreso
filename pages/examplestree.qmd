---
title: "Casos de teste"
---
## Casos de Teste para Análise Sintática

Aqui estão alguns exemplos de casos de teste para validar a geração da árvore sintática utilizando Bison e Flex:

::: {.callout-note}
### Exemplo 1: Precedência aritmética
:::
#### Entrada:
```bash
1 + 2 * 3;
```

#### Árvore esperada (S-expr):
```bash
(+ 1 (* 2 3))
```


::: {.callout-note}
### Exemplo 2: Parênteses alterando precedência
:::
#### Entrada:
```bash
(1 + 2) * 3;
```

#### Árvore esperada (S-expr):
```bash
(* (+ 1 2) 3)
```


::: {.callout-note}
### Exemplo 3: Declaração e atribuição
:::
#### Entrada:
```bash
var inteiro x malocar 5;
```

#### Árvore esperada (S-expr):
```bash
(declaration var inteiro x (assign 5))
```

::: {.callout-note}
### Exemplo 4: Atribuição com expressão
:::
#### Entrada:
```bash
notasAlunos[1] malocar (nota1 + nota2) / 2.0;
```

#### Árvore esperada (S-expr):
```bash
(assign (index notasAlunos 1) (/ (+ nota1 nota2) 2.0))
```
:::

::: {.callout-note}
### Exemplo 5: Definição de função simples
:::
#### Entrada:
```bash
deGue inteiro soma(inteiro a, inteiro b) {
	devolva a + b;
}
```

#### Árvore esperada (S-expr):
```bash
(function-decl inteiro soma ((param inteiro a) (param inteiro b)) (return (+ a b)))
```


::: {.callout-note}
### Exemplo 6: Condicional (if / elif / else)
:::
#### Entrada:
```bash
se_ligue (x > 0) {
	oPrai("positivo");
} yotra (x == 0) {
	oPrai("zero");
} nada_ve {
	oPrai("negativo");
}
```

#### Árvore esperada (S-expr):
```bash
(if (> x 0) (call oPrai ("positivo")) (elif (= x 0) (call oPrai ("zero"))) (else (call oPrai ("negativo"))))
```


::: {.callout-note}
### Exemplo 7: Laço for (`dinovo`) com break (`calma_calabreso`)
:::
#### Entrada:
```bash
dinovo (var inteiro i malocar 0; i < 5; i += 1) {
	se_ligue (i == 3) {
		calma_calabreso;
	}
}
```

#### Árvore esperada (S-expr):
```bash
(for (declaration var inteiro i (assign 0)) (< i 5) (assign i (+= i 1)) (block (if (= i 3) (break))))
```


::: {.callout-note}
### Exemplo 8: While (`ensonha`) e Do-while (`dorme-ensonha`)
:::
#### Entrada:
```bash
var inteiro c malocar 0;
ensonha (c < 2) {
	c += 1;
}
```
```bash
var inteiro t malocar 0;
dorme-ensonha {
	t += 1;
} enquanto (t < 2);
```

#### Árvore esperada (S-expr):
```bash
(block (declaration var inteiro c (assign 0)) (while (< c 2) (assign c (+= c 1))) (declaration var inteiro t (assign 0)) (do-while (assign t (+= t 1)) (< t 2)))
```

::: {.callout-note}
### Exemplo 9: Expressão aninhada (testa associatividade)
:::
#### Entrada:
```bash
a + (b * (c + d));
```

#### Árvore esperada (S-expr):
```bash
(+ a (* b (+ c d)))
```

::: {.callout-note}
### Exemplo 10: Caso de erro — falta de ponto-e-vírgula
:::
#### Entrada:
```bash
var inteiro x malocar 5
```
Resultado esperado: parse error indicando token `;` esperado (ou mensagem equivalente do analisador).