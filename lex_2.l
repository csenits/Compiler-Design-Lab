%{
#include<stdio.h>
%}



%%


auto|double|int|struct|break|else|long|switchcase|enum|register|typedef|char|extern|returnunion|continue|for|signed|void|do|if|static|while|default|goto|sizeof|volatile|const|float|short {printf("\nKEYWORD\n");} 						
[+-/=*%]   {printf("\tOPERATOR\n");}						
([a-zA-Z][0-9])+|[a-zA-Z]* {printf("\tIdentifier\n");}    
[0-9]* {printf("\tNumbers\n");}    														
.+ {printf("\tSymbols\n");}    														
%%
int yywrap()								
{
return 1;
}
int main(void)
{
yylex();
return 0;
}
