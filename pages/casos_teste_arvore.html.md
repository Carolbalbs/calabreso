---
title: "Casos de teste 📊"
---
## Resumo dos Casos de Teste

| Exemplo | Categoria | Valida |
|---------|-----------|--------|
| 1 | Expressões | Precedência de operadores |
| 2 | Expressões | Parênteses e precedência |
| 3 | Declarações | Declaração com atribuição |
| 4 | Expressões | Array indexing e operações |
| 5 | Funções | Declaração de função |
| 6 | Controle | Condicional completo (if/elif/else) |
| 7 | Controle | Laço for com break |
| 8 | Controle | While e do-while |
| 9 | Expressões | Aninhamento e associatividade |
| 10 | Erros | Detecção de erro sintático |

---


## Notas de Implementação

### Símbolos da Árvore:
- `├──` : Nó intermediário
- `└──` : Último nó de um nível
- `│` : Continuação vertical

---
## Casos de Teste para Análise Sintática

Aqui estão alguns exemplos de casos de teste para validar a geração da árvore sintática utilizando Bison e Flex:

::: {.callout-note}
### Exemplo 1: Precedência aritmética
:::
#### **Entrada**:
```bash
1 + 2 * 3;
```

#### **Saída de árvore esperada**:
```bash
EXPR
├── NUM (1)
├── OP (+)
└── EXPR
    ├── NUM (2)
    ├── OP (*)
    └── NUM (3)
```


::: {.callout-note}
### Exemplo 2: Parênteses alterando precedência
:::
#### **Entrada**:
```bash
(1 + 2) * 3;
```

#### **Saida de árvore esperada**:
```bash
EXPR
├── EXPR
│   ├── NUM (1)
│   ├── OP (+)
│   └── NUM (2)
├── OP (*)
└── NUM (3)
```


::: {.callout-note}
### Exemplo 3: Declaração e atribuição
:::
#### **Entrada**:
```bash
var inteiro x malocar 5;
```

#### **Saida de árvore esperada**:
```bash
DECL
├── VAR
├── TYPE (inteiro)
├── ID (x)
└── ASSIGN
    └── NUM (5)
```

::: {.callout-note}
### Exemplo 4: Atribuição com expressão
:::
#### **Entrada**:
```bash
notasAlunos[1] malocar (nota1 + nota2) / 2.0;
```

#### **Saida de árvore esperada**:
```bash
ASSIGN
├── ARRAY_ACCESS
│   ├── ID (notasAlunos)
│   └── INDEX
│       └── NUM (1)
└── EXPR
    ├── EXPR
    │   ├── ID (nota1)
    │   ├── OP (+)
    │   └── ID (nota2)
    ├── OP (/)
    └── NUM (2.0)
```
:::

::: {.callout-note}
### Exemplo 5: Definição de função simples
:::
#### **Entrada**:
```bash
deGue inteiro soma(inteiro a, inteiro b) {
	devolva a + b;
}
```

#### **Saida de árvore esperada**:
```bash
FUNC_DECL
├── RETURN_TYPE (inteiro)
├── ID (soma)
├── PARAM_LIST
│   ├── PARAM
│   │   ├── TYPE (inteiro)
│   │   └── ID (a)
│   └── PARAM
│       ├── TYPE (inteiro)
│       └── ID (b)
└── BODY
    └── BLOCK
        └── RETURN
            └── EXPR
                ├── ID (a)
                ├── OP (+)
                └── ID (b)
```


::: {.callout-note}
### Exemplo 6: Condicional (if / elif / else)
:::
#### **Entrada**:
```bash
se_ligue (x > 0) {
	oPrai("positivo");
} yotra (x == 0) {
	oPrai("zero");
} nada_ve {
	oPrai("negativo");
}
```

#### **Saida de árvore esperada**:
```bash
IF_STMT
├── CONDITION
│   ├── ID (x)
│   ├── OP (>)
│   └── NUM (0)
├── THEN
│   └── BLOCK
│       └── CALL
│           ├── ID (oPrai)
│           └── ARG_LIST
│               └── STRING ("positivo")
├── ELIF
│   ├── CONDITION
│   │   ├── ID (x)
│   │   ├── OP (==)
│   │   └── NUM (0)
│   └── THEN
│       └── BLOCK
│           └── CALL
│               ├── ID (oPrai)
│               └── ARG_LIST
│                   └── STRING ("zero")
└── ELSE
    └── BLOCK
        └── CALL
            ├── ID (oPrai)
            └── ARG_LIST
                └── STRING ("negativo")
```


::: {.callout-note}
### Exemplo 7: Laço for (`dinovo`) com break (`calma_calabreso`)
:::
#### **Entrada**:
```bash
dinovo (var inteiro i malocar 0; i < 5; i += 1) {
	se_ligue (i == 3) {
		calma_calabreso;
	}
}
```

#### **Saida de árvore esperada**:
```bash
FOR_STMT
├── INIT
│   └── DECL
│       ├── VAR
│       ├── TYPE (inteiro)
│       ├── ID (i)
│       └── ASSIGN
│           └── NUM (0)
├── CONDITION
│   ├── ID (i)
│   ├── OP (<)
│   └── NUM (5)
├── INCREMENT
│   ├── ID (i)
│   ├── OP (+=)
│   └── NUM (1)
└── BODY
    └── BLOCK
        └── IF_STMT
            ├── CONDITION
            │   ├── ID (i)
            │   ├── OP (==)
            │   └── NUM (3)
            └── THEN
                └── BLOCK
                    └── BREAK
```


::: {.callout-note}
### Exemplo 8: While (`ensonha`) e Do-while (`dorme-ensonha`)
:::
#### **Entrada**:
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

#### **Saida de árvore esperada**:
```bash
STMT_LIST
├── DECL
│   ├── VAR
│   ├── TYPE (inteiro)
│   ├── ID (c)
│   └── ASSIGN
│       └── NUM (0)
├── WHILE_STMT
│   ├── CONDITION
│   │   ├── ID (c)
│   │   ├── OP (<)
│   │   └── NUM (2)
│   └── BODY
│       └── BLOCK
│           └── ASSIGN
│               ├── ID (c)
│               ├── OP (+=)
│               └── NUM (1)
├── DECL
│   ├── VAR
│   ├── TYPE (inteiro)
│   ├── ID (t)
│   └── ASSIGN
│       └── NUM (0)
└── DO_WHILE_STMT
    ├── BODY
    │   └── BLOCK
    │       └── ASSIGN
    │           ├── ID (t)
    │           ├── OP (+=)
    │           └── NUM (1)
    └── CONDITION
        ├── ID (t)
        ├── OP (<)
        └── NUM (2)
```

::: {.callout-note}
### Exemplo 9: Expressão aninhada (testa associatividade)
:::
#### **Entrada**:
```bash
a + (b * (c + d));
```

#### **Saida de árvore esperada**:
```bash
EXPR
├── ID (a)
├── OP (+)
└── EXPR
    ├── ID (b)
    ├── OP (*)
    └── EXPR
        ├── ID (c)
        ├── OP (+)
        └── ID (d)
```

::: {.callout-note}
### Exemplo 10: Caso de erro — falta de ponto-e-vírgula
:::
#### **Entrada**:
```bash
var inteiro x malocar 5
```
#### **Saida de árvore esperada**:
```bash
syntax error, unexpected $end, expecting ';'
Error at line 1, column 24
```


