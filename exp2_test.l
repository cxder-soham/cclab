%{
#include <stdio.h>
#include <stdlib.h>
/* Counters */
int lowercase_count = 0;
int uppercase_count = 0;
int digit_count = 0;
int whitespace_count = 0; /* spaces only */
int tab_count = 0;
int special_count = 0;
int line_count = 0;
/* Allow reading from a file if provided on the command line */
FILE *yyin;
%}
/* Rules */
%%
[a-z] { lowercase_count++; }
[A-Z] { uppercase_count++; }
[0-9] { digit_count++; }
" " { whitespace_count++; }
"\t" { tab_count++; }
"\n" { line_count++; }
. { special_count++; }
%%
int main(int argc, char **argv) {
 if (argc > 1) {
 yyin = fopen(argv[1], "r");
 if (!yyin) {
 perror(argv[1]);
 exit(1);
 }
 }
 /* Run the scanner */
 yylex();
 /* Print results */
 printf("Lowercase letters: %d\n", lowercase_count);
 printf("Uppercase letters: %d\n", uppercase_count);
 printf("Digits: %d\n", digit_count);
 printf("Whitespace (spaces): %d\n", whitespace_count);
 printf("Tabs: %d\n", tab_count);
 printf("Special characters: %d\n", special_count);
 printf("Lines: %d\n", line_count);
 return 0;
}
/* Required by Flex if not using an external yywrap() */
int yywrap(void) {
 return 1;
}