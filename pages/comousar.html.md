---
title: "Analisador Léxico"
---
:::{layout="[300,30]"}
## ⚙️ Como Executar o Analisador Léxico
![](./images/yotraPixel.png){fig-align="center" }
:::
1. **Compile o projeto:**

```bash
flex scanner_britolang.l
```

2. **Execute o analisador com um arquivo `.yotra`:**

```bash
gcc lex.yy.c -o scanner_britolang.l
```

```bash
./scanner_britolang.l
```
A saída será uma lista dos **tokens reconhecidos**, com sua **categoria** e valor identificado.

---

## 📌 Observações Finais

- O projeto foi desenvolvido com **Flex (Lex)**.
- Os padrões léxicos estão definidos no arquivo `scanner_britolang.l`.
- A linguagem é uma ferramenta **educacional**, com o objetivo de tornar o estudo de análise léxica mais leve, divertido e regionalizado.

---

