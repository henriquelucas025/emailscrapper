%{
#include <stdio.h>
#include <string.h>

int aux = 0;
%}

FINAL ([0-9]*[a-zA-Z]*)+
BASE ([_]*[-]*[.]*[0-9a-zA-Z]+)+ 



%%


{BASE}{FINAL}[@]{BASE}{FINAL}[.]*  { aux = strlen(yytext) - 1;
				     if(yytext[aux] != '.') { printf("%s\n",yytext);  }
				     else { yytext[aux] = '\0';
					    printf("%s\n",yytext);
					  }
				    }

[[:space:]]+ ;
[[:^space:]]+ ;


%%

int main() {
  yylex();
  return 0;
}

