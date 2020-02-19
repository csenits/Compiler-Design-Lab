%{ 
#include <stdio.h> 
%}

%% 

[a - z, A-Z] {printf("Valid Identifier");}
.+ {printf("Invalid Identifier");} 

%%

int yywrap(){}
int main() 
{ 
	yylex(); 
} 
