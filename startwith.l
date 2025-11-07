%{
    #include<stdio.h>
    #include<string.h>

    int count=0;
    char op[1000] = "";
%}

%%

[aA][a-zA-Z0-9]+ {
    count++;
    strcat(op, yytext);
    strcat(op, " ");
}

[a-zA-Z0-9]+ ;  // Skip words not starting with 'a' or 'A'

[ \t\n]+ ;  // Skip whitespace

. ;  // Skip any other character

%%

int main(){
    printf("Enter Input\n");
    yylex();

    printf("Number of words starting with a = %d\n", count);
    printf("Words starting with a = %s\n", op);

    return 0;
}

int yywrap(){   
    return 1;
}