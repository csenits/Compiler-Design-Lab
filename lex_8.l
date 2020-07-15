%{
	#include<stdio.h>
%}

%%

auto|else|case|double|enum|char|extern|const|float|continue|for|default|goto|do|if|int|long|switch|register|typedef|return|union|short|unsigned|signed|void|sizeof|volatile|static|while {printf("%s is a keyword\n",yytext);}
[0-9]+[0-9]* {printf("%s is a number\n",yytext);}
[-+/=*%] {printf("%s OPERATOR\n",yytext);}
[!@#$%^&;.(){}"<>] {printf("%s is a symbol\n",yytext);}
[_a-zA-Z]+[0-9a-zA-Z_]* {printf("%s is an identifier\n",yytext);}
%%

int yywrap(){
	return 1;
}
int main()
{
	yyin=fopen("sample.c","r");
	yylex();
}
