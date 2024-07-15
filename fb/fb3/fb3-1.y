/* Example 3-2. Bison parser for AST calculator
 * calculator with AST 
 */

%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "fb3-1.h"
%}

%union {
    struct ast *a;
    double d; /* cpu acumulator regiser 2배 ALU 2번 돈다 */
}

/* declare tokens */
%token <d> NUMBER   /* templete factor 처럼 */
%token EOL

%type <a> exp factor term

%%
calclist:/*nothing */
| calclist exp EOL{
    printf("= %4.4g\n", eval($2));
    treefree($2);
    printf("> ");
}
| calclist EOL { printf("> ");} /* blank line or a comment */
;

exp : factor
    |exp '+' factor { $$ = newast('+', $1, $3); } /* 구조체 ast의 주소값 반환 */
    |exp '-' factor { $$ = newast('-', $1, $3); }
    ;
factor : term
    |factor '*' term { $$ = newast('*', $1, $3); }
    |factor '/' term { $$ = newast('/', $1, $3); }
    ;
term: NUMBER { $$ = newnum($1); }
    | '|' term { $$ = newast('|', $2, NULL); }
    | '(' exp ')' { $$ = $2; }
    | '-' term { $$ = newast('M', $2, NULL); }
    ;
%%

