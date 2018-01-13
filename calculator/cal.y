%{
	#include <stdio.h>
	int yylex(void);
	void yyerror(char *);
%}
%token	INTEGER
%token 	VARIABLE
%left '+' '-'
%left '*' '/'

%%
program	: 
	program expr '\n'	{printf("%d\n",$2);}
	|
	;
expr	:
	INTEGER			{$$ = $1;}
	| expr '+' expr		{$$ = $1+$2;}
	| expr '-' expr		{$$ = $1-$2;}
	;

%%

void yyerror(char *s){
	fprintf(stderr,"%s\n",s);
}

int main(void){
	yyparse();
	return 0;
}
