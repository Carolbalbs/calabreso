---
title: "Funções"
---
### Função com retorno

```yotra
barril soma(a: inteiro, b: inteiro): inteiro {
    sePique a + b;
}
```

### Função sem retorno

```yotra
barril cumprimenta(): nada {
    pegaVisao("E aí, beleza?");
}
```

### Chamadas de função

```yotra
var inteiro resultado = soma(5, 7);
pegaVisao("Resultado: " + resultado);
```

---

## 📄 Exemplo de Código `soma.yotra` 

```yotra
barril soma(): nada {
    // Declaração e inicialização de variáveis inteiras
    var inteiro a = 10, b = 4;

    // Operação de divisão inteira armazenada em um flutuante
    var flutuante c = a / b;

    // Impressão do resultado
    pegaVisao(c);
}
```

---
