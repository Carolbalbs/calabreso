---
title: ""
---

## ⚙️ Como Compilar e Usar o Analisador Sintático ⚙️


Para compilar e usar este parser, você precisará ter o GCC, Flex (Lex) e o Bison (Yacc) instalados em seu sistema. Os passos gerais são:

1. **Buildar o analisador_sintatico**: Execute o comando make abaixo a partir da pasta raiz.
    ```bash
    make
    ````
    
2. **Executar o compilador**: Execute o binário gerado, passando o código fonte da linguagem 'Calabreso++' como entrada.

   ```bash
   ./arvore_sintatica < input/exemplo-input.txt
   ```