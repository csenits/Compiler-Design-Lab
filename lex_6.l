%{ 
    #include <stdio.h>
    int lc=0, sc=0, wc=0, c_letters=0, s_letters=0, num=0;

%}   
%% 
\n lc++; //line counter  //lines, words, special characters and letters
[\t ' '] {wc++; }
[A-Z] {c_letters++;}
[a-z] {s_letters++;}
[0-9] {num++;}
. {sc++;}     //characters counter 

%% 
  
int yywrap(){} 
int main()  
{ 

    printf("Enter the string:"); 
    yylex(); 
    printf("Number of lines are:  %d\n", lc); 
    printf("Number of words are:  %d\n", wc); 
    printf("Number of special characters are:  %d\n", sc); 
    printf("Number of letters are:  %d\n", s_letters + c_letters); 
    return 0; 
  
} 

