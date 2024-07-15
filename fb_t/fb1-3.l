%%
"+" {printf("PLUS\n"); }
"-" {printf("MINUS\n"); }
"*" {printf("TIMES\n"); }
"/" {printf("DIVEDE\n"); }
"|" {printf("ABS\n"); }
[0-9]+ {printf("NUMBER %s\n", yytext); }
\n  {printf("NEWLINE\n"); }
[ \t]   {}
.   {printf("Mymstery character %s\n", yytext); }
%%
