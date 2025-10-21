%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef enum {
    T_EOF = 0,

    //Palavras-chave
    T_SE_LIGUE = 258, T_YOTRA, T_NADA_VE, T_ENSONHA, T_DORME_ENSONHA,
    T_DINOVO, T_MALOCAR, T_FUN, T_DEGUE, T_DEVOLVA,
    T_OPRAI, T_CALMA_CALABRESO,

    //Tipos
    T_INTEIRO, T_FLUTUANTE, T_LETRINHA, T_TEXTAO, T_SEM_VOLTA,

    //Identificadores e Literais
    T_ID, T_INTEGER, T_FLOAT, T_STRING, T_LITERAL_CHAR,

    //Operadores
    T_OP_IGUALDADE, T_OP_DIFERENTE, T_OP_MENOR, T_OP_MAIOR,
    T_OP_MENOR_IGUAL, T_OP_MAIOR_IGUAL, T_OP_SOMA, T_OP_SUB,
    T_OP_MULT, T_OP_DIV, T_OP_ATRIBUICAO,

    //Separadores
    T_PONTO_VIRGULA, T_VIRGULA, T_PARENTESES_ESQ, T_PARENTESES_DIR,
    T_CHAVES_ESQ, T_CHAVES_DIR,

    //Erro
    T_UNKNOWN
} TokenType;

int yylval;

#define MAX_SYMBOLS 100
char *symbol_table[MAX_SYMBOLS];
int symbol_count = 0;

int get_symbol_position(const char *id) {
    for (int i = 0; i < symbol_count; i++) {
        if (strcmp(symbol_table[i], id) == 0)
            return i;
    }
    if (symbol_count < MAX_SYMBOLS) {
        symbol_table[symbol_count] = strdup(id);
        return symbol_count++;
    } else {
        fprintf(stderr, "Erro: Tabela de simbolos cheia!\n");
        return -1;
    }
}
%}

%option noyywrap

DIGITO              [0-9]
LETRA               [a-zA-Z_]
ID                  {LETRA}({LETRA}|{DIGITO})*
INTEIRO             {DIGITO}+
FLOAT               {DIGITO}+"."{DIGITO}+
COMENTARIO_LINHA    "//".*
COMENTARIO_BLOCO    "/*"([^*]|\*+[^*/])*\*+"/"
STRING_LITERAL       \"[^\"]*\"
CHAR_LITERAL         \'[^\']\'

%%
[ \t\r]+            { /*ignora espaços, tabs e CR*/ }
\n                  { /*ignora nova linha*/ }

{COMENTARIO_LINHA}  { /*ignora comentário de linha*/ }
{COMENTARIO_BLOCO}  { /*ignora comentário de bloco*/ }

"se_ligue"          { return T_SE_LIGUE; }
"yotra"             { return T_YOTRA; }
"nada_ve"           { return T_NADA_VE; }
"ensonha"           { return T_ENSONHA; }
"dorme_ensonha"     { return T_DORME_ENSONHA; }
"dinovo"            { return T_DINOVO; }
"malocar"           { return T_MALOCAR; }
"fun"               { return T_FUN; }
"deGue"             { return T_DEGUE; }
"devolva"           { return T_DEVOLVA; }
"oPrai"             { return T_OPRAI; }
"calma_calabreso"   { return T_CALMA_CALABRESO; }

"inteiro"           { return T_INTEIRO; }
"flutuante"         { return T_FLUTUANTE; }
"letrinha"          { return T_LETRINHA; }
"textao"            { return T_TEXTAO; }
"sem_volta"         { return T_SEM_VOLTA; }

{INTEIRO}           { yylval = atoi(yytext); return T_INTEGER; }
{FLOAT}             { return T_FLOAT; }
{STRING_LITERAL}    { return T_STRING; }
{CHAR_LITERAL}      { return T_LITERAL_CHAR; }

{ID}                { yylval = get_symbol_position(yytext);
                      if (yylval != -1) return T_ID; }

"=="                { return T_OP_IGUALDADE; }
"!="                { return T_OP_DIFERENTE; }
"<="                { return T_OP_MENOR_IGUAL; }
">="                { return T_OP_MAIOR_IGUAL; }
"<"                 { return T_OP_MENOR; }
">"                 { return T_OP_MAIOR; }
"+"                 { return T_OP_SOMA; }
"-"                 { return T_OP_SUB; }
"*"                 { return T_OP_MULT; }
"/"                 { return T_OP_DIV; }
"="                 { return T_OP_ATRIBUICAO; }

";"                 { return T_PONTO_VIRGULA; }
","                 { return T_VIRGULA; }
"("                 { return T_PARENTESES_ESQ; }
")"                 { return T_PARENTESES_DIR; }
"{"                 { return T_CHAVES_ESQ; }
"}"                 { return T_CHAVES_DIR; }

.                   {
                      fprintf(stderr,
                              "Erro Lexico na linha %d: caractere inesperado '%s'\n",
                              yylineno, yytext);
                      return T_UNKNOWN;
                    }
%%

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
        printf("Token: %d | Lexema: %s\n", token_id, yytext);
    }

    printf("\n--- Tabela de Simbolos ---\n");
    for (int i = 0; i < symbol_count; i++)
        printf("[%d] %s\n", i, symbol_table[i]);

    for (int i = 0; i < symbol_count; i++)
        free(symbol_table[i]);

    if (yyin != stdin) fclose(yyin);
    return 0;
}

