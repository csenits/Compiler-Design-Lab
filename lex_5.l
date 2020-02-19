%{ 
    #include <stdio.h>
    int vcount=0,ccount=0;

%}   
%% 
[aeiouAEIOU] {vcount++;} 
[a-zA-Z] {ccount++;} 

%% 
  
int yywrap(){} 
int main()  
{ 

    //printf("Enter the string of vowels and consonents:"); 
    yylex(); 
    printf("Number of vowels are:  %d\n", vcount); 
    printf("Number of consonants are:  %d\n", ccount); 
    return 0; 
  
} 

