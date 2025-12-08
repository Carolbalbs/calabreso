---
title: "Regras de Produção"
---

## Por que é necessário uso das regras de produção? 🤔

As regras de produção são essenciais para garantir a consistência e a qualidade dos processos. Elas definem padrões claros que devem ser seguidos, minimizando erros e otimizando os resultados. Além disso, ajudam na padronização e na comunicação entre equipes, promovendo eficiência e alinhamento.

## Regras de produção da linguagem Calabresso++

As regras de produção usadas para a construção do nosso analisador sintático foram:

1. **Regra 1**: `<expr> ::= <term> "+" <expr> | <term>`
2. **Regra 2**: `<term> ::= <factor> "*" <term> | <factor>`
3. **Regra 3**: `<factor> ::= "(" <expr> ")" | <id>`
4. **Regra 4**: `<id> ::= "a" | "b" | "c" | ... | "z"`