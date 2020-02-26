%{
	#include<stdio.h>
	int count1=0, flag=0, m=0;
%}

%%
((\/)(\/).*"\n") {count1++;}
("/*")(.*|("\n")*) {flag=1;}
("*/") {if(flag==1){count1++, flag=0;}}
([pP][rR][Ii][Nn][Tt][Ff][(].*((\/)(\/)).*) {m++;}
([pP][rR][Ii][Nn][Tt][Ff][(].*((\/)(\*)).*((\*)(\/))) {m++;}
%%
  
int yywrap(){} 
int main()  
{
	yyin=fopen("sample.c","r");
	yyout=fopen("sample2.c","w");
	yylex();
	printf("no of comments=%d m=%d \n",count1,m);
}