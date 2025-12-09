--- 
title: "Tabela de Símbolos"
---
Durante o processo de análise léxica, a **Calabreso++** utiliza uma **Tabela de Símbolos** para armazenar e rastrear todos os identificadores encontrados no código fonte.

Essa tabela é essencial para garantir que variáveis, funções e outros símbolos sejam reconhecidos corretamente ao longo da análise e fases posteriores da compilação.

## Como funciona?

A Tabela de Símbolos é implementada como uma estrutura simples baseada em arrays. Cada identificador único é armazenado na tabela à medida que aparece no código. Quando o mesmo identificador reaparece, sua posição é reutilizada — evitando duplicação.

## Estrutura:

```c
#define MAX_SYMBOLS 100000
#define MAX_ID_LENGTH 256

char symbol_table[MAX_SYMBOLS][MAX_ID_LENGTH];
int symbol_count = 0;
```

- `MAX_SYMBOLS`: Número máximo de símbolos que a tabela pode armazenar.
- `MAX_ID_LENGTH`: Tamanho máximo de cada identificador.
- `symbol_table`: Array que guarda os nomes dos identificadores.
- `symbol_count`: Quantidade atual de símbolos armazenados.

### Função Principal: `get_symbol_position`

```c
int get_symbol_position(const char* id);
```

Essa função é responsável por:

- **Buscar** um identificador já existente na tabela.
- **Adicionar** um novo identificador se ele ainda não estiver registrado.
- **Retornar** a posição do identificador na tabela.
- **Retornar -1** caso a tabela esteja cheia.

Exemplo de uso dentro do analisador:

```c
void print_identifier(const char* yytext_val) {
    printf("ID");
    int pos = get_symbol_position(yytext_val);
    if (pos != -1){
        printf(", %d", pos);
    }
}
```

Essa impressão ajuda a visualizar não apenas que o token é um identificador, mas **qual a sua posição na tabela de símbolos**, facilitando o rastreamento e testes.