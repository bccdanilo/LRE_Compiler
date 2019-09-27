%{

#include "node.h"
#include "bison.hpp"

extern void unescape(char *s);

%}

%option yylineno
%x COMMENT

%%

[ \t\n\r]				{ /* espaços */ }
"/*"					{ yymore(); BEGIN COMMENT; }
<COMMENT>[^*]			{ yymore(); }
<COMMENT>"*"/[^/]		{ yymore(); }
<COMMENT>"*/"			{ BEGIN(INITIAL); }

"//".*$					{ fprintf(stderr, "Comentario: %s\n", yytext); /* comentario de linha */}

"exiba"					{ return(TOK_PRINT); }

"entrada"[0-9]+				{ yylval.port = strndup(yytext+7, yyleng-7);
						  return(TOK_IN);
						}

"saida"[0-9]+				{ yylval.port = strndup(yytext+5, yyleng-5);
						  return(TOK_OUT);
						}


"porta"[0-9]+				{ yylval.nint = atoi(strndup(yytext+5, yyleng-5));
						  return(TOK_INTEIRO);
						}
"stepper"[0-2]+			{ yylval.nint = atoi(strndup(yytext+7, yyleng-7));
						  return(TOK_STEPPER);
						}

"servo"					{ return(TOK_SERVO); }

"quando"                		{ return(TOK_QUANDO); }
"esta"                  		{ return(TOK_ESTA); }
"a"					{ return(TOK_A); }
"cada"					{ return(TOK_CADA); }
"segundos"				{ return(TOK_SEGUNDOS); }


"baixo"				{ yylval.nint = atoi("0"); return(TOK_INTEIRO); /* Alterado */}
"alterado"			{ yylval.nint = atoi("1"); return(TOK_INTEIRO); /* Alterado */}
"caindo"			{ yylval.nint = atoi("2"); return(TOK_INTEIRO); /* Liberado */}
"crescendo"			{ yylval.nint = atoi("3"); return(TOK_INTEIRO); /* Pressionado */}




"espera"				{ return(TOK_DELAY); }
"se"					{ return(TOK_IF); }
"senao"					{ return(TOK_ELSE); }
"enquanto"				{ return(TOK_WHILE); }
"=="					{ return(EQ_OP); }
"!="					{ return(NE_OP); }
"<="					{ return(LE_OP); }
">="					{ return(GE_OP); }
">"						{ return(GT_OP); }
"<"						{ return(LT_OP); }
"&&"					{ return(TOK_AND); }
"||"					{ return(TOK_OR); }
"funcao"				{ return(TOK_FUNC); }
"retorna"				{ return(TOK_RETURN); }

[a-zA-Z_][a-zA-Z0-9_]*	{ yylval.ident = strndup(yytext, yyleng); 
						  return(TOK_IDENT); }

"("						{ return('('); }
")"						{ return(')'); }
"{"						{ return('{'); }
"}"						{ return('}'); }

-?[0-9]+\.[0-9]+		{ yylval.nfloat = atof(yytext); 
						  return(TOK_FLOAT); }

-?[0-9]+				{ yylval.nint = atoi(yytext);
						  return(TOK_INTEIRO); }

"*"						{ return('*'); }
"/"						{ return('/'); }
"+"						{ return('+'); }
"-"						{ return('-'); }
"%"						{ return('%'); }
"="						{ return('='); }
";"						{ return(';'); }

\"([^\\\"]|\\.)*\"		{ yylval.str = strndup(yytext+1, yyleng-2);
						  unescape(yylval.str);
						  return(TOK_STRING); }

 /* deixar por último. Caractere não reconhecido pelo alfabeto. */
.						{ yyerror("lexical error, caractere nao pertence ao alfabeto da linguagem:"); }

%%


