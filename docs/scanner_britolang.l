/* Seção de Definições em C */
%{
#include <stdio.h>
#include <string.h>

/* Enumeração de Tokens Refinada */
typedef enum {
    T_EOF = 0,

    // Palavras-chave BritoLang
    T_SE_LIGUE = 258, T_YOTRA, T_NADA_VE, T_ENSONHA, T_DORME_ENSONHA,
    T_DINOVO, T_MALOCAR, T_FUN, T_DEGUE, T_DEVOLVA,
    T_OPRAI, T_CALMA_CALABRESO,

    // Tipos da linguagem
    T_INTEIRO, T_FLUTUANTE, T_LETRINHA, T_TEXTAO, T_SEM_VOLTA,

    // Identificadores e Literais
    T_ID, T_INTEGER, T_FLOAT, T_STRING, T_LITERAL_CHAR,

    // Operadores
    T_OP_IGUALDADE, T_OP_DIFERENTE, T_OP_MENOR, T_OP_MAIOR,
    T_OP_MENOR_IGUAL, T_OP_MAIOR_IGUAL, T_OP_SOMA, T_OP_SUB,
    T_OP_MULT, T_OP_DIV, T_OP_ATRIBUICAO,

    // Separadores
    T_PONTO_VIRGULA, T_VIRGULA, T_PARENTESES_ESQ, T_PARENTESES_DIR,
    T_CHAVES_ESQ, T_CHAVES_DIR,

    // Erro
    T_UNKNOWN
    
} TokenType;

int yylval;

#define MAX_SYMBOLS 100
char *symbol_table[MAX_SYMBOLS];
int symbol_count = 0;

int get_symbol_position(const char *id) {
    for (int i = 0; i < symbol_count; i++) {
        if (strcmp(symbol_table[i], id) == 0) {
            return i;
        }
    }
    if (symbol_count < MAX_SYMBOLS) {
        symbol_table[symbol_count] = strdup(id);
        return symbol_count++;
    } else {
        fprintf(stderr, "Erro: Tabela de símbolos cheia!\n");
        return -1;
    }
}
%}

%option noyywrap

/* Definições de Expressões Regulares */
DIGITO         [0-9]
LETRA          [a-zA-Z_]
ID             {LETRA}({LETRA}|{DIGITO})*
INTEIRO        {DIGITO}+
FLOAT          {DIGITO}+\.{DIGITO}*
COMENTARIO_LINHA \/\/[^\n]*
COMENTARIO_BLOCO \/\*([^*]|\*+[^*/])*\*+\/
STRING_LITERAL \"[^"]*\"
CHAR_LITERAL   '[^']'

/* Seção de Regras */
%%
[ \t]+         { /* Ignorar espaços e tabulações */ }
\n             { /* Ignorar nova linha */ }
{COMENTARIO_LINHA} { /* Ignora comentário de linha */ }
{COMENTARIO_BLOCO} { /* Ignora comentário de bloco */ }

/* Palavras Chave britolang*/
"se_ligue"           { return T_SE_LIGUE; }        //if
"yotra"              { return T_YOTRA; }           //elif
"nada_ve"            { return T_NADA_VE; }         //else
"ensonha"            { return T_ENSONHA; }         //while
"dorme_ensonha"      { return T_DORME_ENSONHA; }   //do-while
"dinovo"             { return T_DINOVO; }          //for
"malocar"            { return T_MALOCAR; }         //declaração com tipo
"fun"                { return T_FUN; }             //função
"deGue"              { return T_DEGUE; }           //início de função
"devolva"            { return T_DEVOLVA; }         //return
"oPrai"              { return T_OPRAI; }           //print
"calma_calabreso"    { return T_CALMA_CALABRESO; } //break

/* Tipos de dado */
"inteiro"            { return T_INTEIRO; }
"flutuante"          { return T_FLUTUANTE; }
"letrinha"           { return T_LETRINHA; }
"textao"    { return T_TEXTAO; }     
"sem_volta"          { return T_SEM_VOLTA; }

/* Literais e identificadores */
{INTEIRO}            { yylval = atoi(yytext); return T_INTEGER; }
{FLOAT}              { return T_FLOAT; }
{STRING_LITERAL}     { return T_STRING; }
{CHAR_LITERAL}       { return T_LITERAL_CHAR; }
{ID}                 { yylval = get_symbol_position(yytext);
                       if (yylval != -1) return T_ID; }

/* Operadores e Separadores */
"=="                 { return T_OP_IGUALDADE; }
"!="                 { return T_OP_DIFERENTE; }
"<="                 { return T_OP_MENOR_IGUAL; }
">="                 { return T_OP_MAIOR_IGUAL; }
"<"                  { return T_OP_MENOR; }
">"                  { return T_OP_MAIOR; }
"+"                  { return T_OP_SOMA; }
"-"                  { return T_OP_SUB; }
"*"                  { return T_OP_MULT; }
"/"                  { return T_OP_DIV; }
"="                  { return T_OP_ATRIBUICAO; }

";"                  { return T_PONTO_VIRGULA; }
","                  { return T_VIRGULA; }
"("                  { return T_PARENTESES_ESQ; }
")"                  { return T_PARENTESES_DIR; }
"{"                  { return T_CHAVES_ESQ; }
"}"                  { return T_CHAVES_DIR; }

.                    {
                       fprintf(stderr,
                               "Erro Léxico na linha %d: Caractere inesperado '%s'\n",
                               yylineno, yytext);
                       return T_UNKNOWN;
                    }

%%

/* Seção de Código do Usuário */
int main(int argc, char **argv) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            perror(argv[1]);
            return 1;
        }
    } else {
        yyin = stdin;
    }

    int token_id;
    while ((token_id = yylex())) {
        switch (token_id) {
            // Palavras-chave
            case T_SE_LIGUE:        printf("Token: %d (T_SE_LIGUE)        | Lexema: %s\n", token_id, yytext); break;
            case T_YOTRA:           printf("Token: %d (T_YOTRA)           | Lexema: %s\n", token_id, yytext); break;
            case T_NADA_VE:         printf("Token: %d (T_NADA_VE)         | Lexema: %s\n", token_id, yytext); break;
            case T_ENSONHA:         printf("Token: %d (T_ENSONHA)         | Lexema: %s\n", token_id, yytext); break;
            case T_DORME_ENSONHA:   printf("Token: %d (T_DORME_ENSONHA)   | Lexema: %s\n", token_id, yytext); break;
            case T_DINOVO:          printf("Token: %d (T_DINOVO)          | Lexema: %s\n", token_id, yytext); break;
            case T_MALOCAR:         printf("Token: %d (T_MALOCAR)         | Lexema: %s\n", token_id, yytext); break;
            case T_FUN:             printf("Token: %d (T_FUN)             | Lexema: %s\n", token_id, yytext); break;
            case T_DEGUE:           printf("Token: %d (T_DEGUE)           | Lexema: %s\n", token_id, yytext); break;
            case T_DEVOLVA:         printf("Token: %d (T_DEVOLVA)         | Lexema: %s\n", token_id, yytext); break;
            case T_OPRAI:           printf("Token: %d (T_OPRAI)           | Lexema: %s\n", token_id, yytext); break;
            case T_CALMA_CALABRESO: printf("Token: %d (T_CALMA_CALABRESO) | Lexema: %s\n", token_id, yytext); break;

            // Tipos
            case T_INTEIRO:         printf("Token: %d (T_INTEIRO)         | Lexema: %s\n", token_id, yytext); break;
            case T_FLUTUANTE:       printf("Token: %d (T_FLUTUANTE)       | Lexema: %s\n", token_id, yytext); break;
            case T_LETRINHA:        printf("Token: %d (T_LETRINHA)        | Lexema: %s\n", token_id, yytext); break;
            case T_TEXTAO:          printf("Token: %d (T_TEXTAO)          | Lexema: %s\n", token_id, yytext); break;
            case T_SEM_VOLTA:       printf("Token: %d (T_SEM_VOLTA)       | Lexema: %s\n", token_id, yytext); break;

            // Literais e Identificadores
            case T_ID:              printf("Token: %d (T_ID)              | Posição: %d, Lexema: %s\n",
                                             token_id, yylval, symbol_table[yylval]); break;
            case T_INTEGER:         printf("Token: %d (T_INTEGER)         | Valor: %d\n", token_id, yylval); break;
            case T_FLOAT:           printf("Token: %d (T_FLOAT)           | Lexema: %s\n", token_id, yytext); break;
            case T_STRING:          printf("Token: %d (T_STRING)          | Lexema: %s\n", token_id, yytext); break;
            case T_LITERAL_CHAR:    printf("Token: %d (T_LITERAL_CHAR)    | Lexema: %s\n", token_id, yytext); break;

            // Operadores e separadores (mantidos)
            default:
                printf("Token: %d | Lexema: %s\n", token_id, yytext);
                break;
        }
    }

    printf("\n--- Tabela de Símbolos Final ---\n");
    printf("Posição | Identificador\n");
    printf("-----------------------------\n");
    for (int i = 0; i < symbol_count; i++) {
        printf("%-7d | %s\n", i, symbol_table[i]);
    }
    printf("-----------------------------\n\n");

    for (int i = 0; i < symbol_count; i++) {
        free(symbol_table[i]);
    }
    if (yyin != stdin) fclose(yyin);
    return 0;
}

