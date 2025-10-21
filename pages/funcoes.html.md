---
title: "Funções"
---
### Função com retorno

```js
deGue calcularMedia(nota1: flutuante, nota2: flutuante): flutuante {
    devolva (nota1 + nota2) / 2;
}
```

### Função sem retorno

```js
deGue exibirBemVindo(): sem_volta {
    oPrai("=== Sistema Calabreso++ ===");
    oPrai("Bem-vindo ao programa!");
}
```

### Chamadas de função

```js
malocar flutuante mediaFinal = calcularMedia(8.5, 7.0);
oPrai("Média do aluno: " + mediaFinal);     
```

---

## 📄 Exemplo de Código `calculadora.yotra` 

```js
deGue_calculadora(): sem_volta {
    // Declaração e inicialização de variáveis
    malocar flutuante preco = 150.0, desconto = 20.0;

    // Cálculo do valor final com desconto
    malocar flutuante valorFinal = preco - (preco * desconto / 100);

    // Impressão do resultado
    oPrai("Preço original: R$ " + preco);
    oPrai("Desconto: " + desconto + "%");
    oPrai("Valor final: R$ " + valorFinal)
    }
```

