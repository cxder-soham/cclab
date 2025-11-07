%{
    #include<stdio.h>
    #include<string.h>

    char output[1000] = "";
    int k=0;
%}

%%

. {
    for(int i=0; i<strlen(yytext); i++){
        if(yytext[i] >= 'a' && yytext[i] <= 'z'){
            output[k] = yytext[i] - ('a' - 'A');
        }
        else if(yytext[i] >= 'A' && yytext[i] <= 'Z'){
            output[k] = yytext[i] + ('a' - 'A');
        }
        else{
            output[k] = yytext[i];
        }
        k++;
    }
}

\n

%%

int main(){
    printf("Enter Input\n");
    yylex();
    //output[k] = '\0';

    printf("Uppercase output:\n %s", output);
}

int yywrap(){
    return 1;
}
