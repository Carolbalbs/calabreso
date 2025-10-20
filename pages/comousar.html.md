---
title: "Analisador Léxico"
---
:::{layout="[300,30]"}
## ⚙️ Como Executar o Analisador Léxico
![](./images/yotraPixel.png){fig-align="center" }
:::
1. **Compile o projeto:**

```bash
make
```

2. **Execute o analisador com um arquivo `.yotra`:**

```bash
./lexer input/exemplo-input.txt
```

A saída será uma lista dos **tokens reconhecidos**, com sua **categoria** e valor identificado.
```bash
<T_BARRIL, 'barril'> <T_BROCOU, 'brocou'> <T_LPAREN, '('> <T_RPAREN, ')'> <T_COLON, ':'> <T_NADA, 'nada'> <T_ LBRACE, '{'> <T_PEGAVISAO, 'pegaVisao'> <T_LPAREN, '('> <T_STRING_LITERAL, '"Olá, Mundo!"'> <T_RPAREN, ')'> <T_SEMICOLON, ';'> <T_RBRACE, '}'> 
```

---

## 📌 Observações Finais

- O projeto foi desenvolvido com **Flex (Lex)**.
- Os padrões léxicos estão definidos no arquivo `calabreso_lexer.l`.
- A linguagem é uma ferramenta **educacional**, com o objetivo de tornar o estudo de análise léxica mais leve, divertido e regionalizado.

---

