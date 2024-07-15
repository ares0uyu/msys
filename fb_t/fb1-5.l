%{
#include "fb1-5.tab.h"
%}

%%
"+" {return ADD;}
"-" {return SUB;}
"*" {return MUL;}
"/" {return DIV;}
"|" {return ABS;}
[0-9]+ { yylval = atoi(yytext); return NUMBER;}
\n {return EOL;}
[ \t] {}
. {printf("Mymstery character %c\n", *yytext);}
%%

/*
void main(int argc, char **argv)
{
    int tok;
    while(tok = yylex()){
        printf("%d", tok);
        if(tok == NUMBER) printf(" = %d\n", yylval);
        else printf("\n");
    }
}
*/