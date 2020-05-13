%{
#include <stdio.h>

%}

FINAL ([0-9]*[A-Z]*[a-z]*)+ 
BASE ([0-9]*[A-Z]*[-]*[_]*[.]*[a-z]*)+ 
HEADER ({FINAL}{BASE}{FINAL})



%%


{HEADER}[@]{HEADER}  { 
printf("%s\n",yytext); }

[[:space:]]+ ;
[[:^space:]]+ ;


%%

int main() {
  yylex();
  return 0;
}

