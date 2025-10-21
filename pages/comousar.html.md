---
title: "Analisador Léxico"
---

## ⚙️ Como Executar o Analisador Léxico
::: {layout="[40,300]"}

:::
![](/images/yotraPixel.png){fig-align="center" width="20%"}

1. **Compile o projeto, dentro da pasta docs, siga os passos abaixo:**

**1.1**
```bash
flex scanner_britolang.l
```
**1.2**
```bash
gcc lex.yy.c -o scanner
```
2. **Execute o analisador com o arquivo scanner de exemplo**

```bash
 ./scanner_britolang exemplo_britolang.lang
```
3. **Para verificar os erros, executeo scanner em um arquivo com erros**
```bash
  ./scanner_britolang erros_britolang.lang
```

A saída será uma lista dos **tokens reconhecidos**, com sua **categoria** e valor identificado.

---

## 📌 Observações Finais

- O projeto foi desenvolvido com **Flex (Lex)**.
- Os padrões léxicos estão definidos no arquivo `scanner_britolang.l`.
- A linguagem é uma ferramenta **educacional**, com o objetivo de tornar o estudo de análise léxica mais leve, divertido e regionalizado.

---

