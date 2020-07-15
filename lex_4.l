%{
#include<stdio.h>
int a=0,c=0,d,e=0;
int keywords=0,identifier=0,numbers=0,operators=0,symbols=0;	
%}

%%

"/*" {if(e==0){e++;fprintf(yyout, "");}}
"*/" {if(e==1){e=0;c++;fprintf(yyout, "");}}
"//".* {if(e==0){a++;fprintf(yyout, "");}}
auto|else|case|double|enum|char|extern|const|float|continue|for|default|goto|do|if|int|long|switch|register|typedef|return|union|short|unsigned|signed|void|sizeof|volatile|static|while {if(e==0){keywords++;fprintf(yyout, "%s", yytext);}}
[0-9]+[0-9]* {if(e==0){numbers++;fprintf(yyout, "%s", yytext);}}
[-+/=*%] {if(e==0){operators++;fprintf(yyout, "%s", yytext);}}
[!@#$%^&;,(){}"<>] {if(e==0){symbols++;printf("%s\n",yytext);fprintf(yyout, "%s", yytext);}}
[_a-zA-Z]+[0-9a-zA-Z_]* {if(e==0){identifier++;fprintf(yyout, "%s", yytext);}}
. {if(e==0){fprintf(yyout, "%s", yytext);}}

%%

int yywrap(){}

int main()
{
	yyin=fopen("sample.c","r");
	yyout=fopen("sample2.c","w");
	yylex();
	printf("single line comment:%d\nmultiline comment:%d\n",a,c);
	printf("Identifiers:%d\nkeywords:%d\nnumbers:%d\nsymbols:%d\noperators:%d\n",identifier,keywords,numbers,symbols,operators);

}