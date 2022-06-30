import java_cup.runtime.Symbol;

/*
Directivas:
public: classe publica
cup: compatibilidade com cup
full: estende o alfabeto com todos os valores de 8 bits
linha: adicionar a variável int yyline, para indicar a linha do lexema
char: adicionar a variável int yychar, para indicar o índice do primeiro caractere do lexema
ignorecase: validar, independentemente de a letra ser maiúscula ou minúscula
eofval: especifica um valor de retorno no final do arquivo
*/

%%

%class Scanner
%cup
%full
%line
%char
%eofval{
	return new Symbol(Tokens.EOF,new String("Fim do arquivo"));
%eofval}

digito = [0-9]
letra = [a-zA-Z]
id = {letra}({letra}|{digito}|"_")*
espaco = \t|\f|" "|\r|\n

%%
"#"			{return new Symbol(Tokens.HASH, yytext());}
"include"	{return new Symbol(Tokens.INCLUDE, yytext());}
"<stdio.h>"	{return new Symbol(Tokens.LIB, yytext());}
"define"	{return new Symbol(Tokens.CONST, yytext());}
"int"		{return new Symbol(Tokens.INTEIRO, yytext());}
"float"		{return new Symbol(Tokens.REAL, yytext());}
"double"	{return new Symbol(Tokens.DREAL, yytext());}
"char"		{return new Symbol(Tokens.CARACTER, yytext());}
"main"		{return new Symbol(Tokens.PRINCIPAL, yytext());}
"("			{return new Symbol(Tokens.ABREP, yytext());}
")"			{return new Symbol(Tokens.FECHAP, yytext());}
"{"			{return new Symbol(Tokens.ABRECHA, yytext());}
"}"			{return new Symbol(Tokens.FECHACHA, yytext());}
"["			{return new Symbol(Tokens.ABRECOL, yytext());}
"]"			{return new Symbol(Tokens.FECHACOL, yytext());}
"return"	{return new Symbol(Tokens.RETURN, yytext());}
";"			{return new Symbol(Tokens.PV, yytext());}
"="			{return new Symbol(Tokens.IGUAL, yytext());}
"-"			{return new Symbol(Tokens.MENOS, yytext());}
"+"			{return new Symbol(Tokens.MAIS, yytext());}
"*"			{return new Symbol(Tokens.VEZES, yytext());}
"/"			{return new Symbol(Tokens.DIVIDIR, yytext());}
"%"			{return new Symbol(Tokens.MOD, yytext());}
">"			{return new Symbol(Tokens.MAIOR, yytext());}
"<"			{return new Symbol(Tokens.MENOR, yytext());}
"!"			{return new Symbol(Tokens.NEGACAO, yytext());}
"&&"		{return new Symbol(Tokens.E, yytext());}
"||"		{return new Symbol(Tokens.OU, yytext());}
"while"		{return new Symbol(Tokens.ENQUANTO, yytext());}
"for"		{return new Symbol(Tokens.PARA, yytext());}
"\+\+"		{return new Symbol(Tokens.MAISMAIS, yytext());}
"\-\-"		{return new Symbol(Tokens.MENOSMENOS, yytext());}
","			{return new Symbol(Tokens.VIRGULA, yytext());}
"'"			{return new Symbol(Tokens.ABREASPASS, yytext());}
"\""		{return new Symbol(Tokens.ABREASPASD, yytext());}
"if"		{return new Symbol(Tokens.SE, yytext());}
"else"		{return new Symbol(Tokens.SENAO, yytext());}
"scanf"		{return new Symbol(Tokens.INPUT, yytext());}
"printf"	{return new Symbol(Tokens.OUTPUT, yytext());}
"."			{return new Symbol(Tokens.PONTO, yytext());}


{id}		{return new Symbol(Tokens.ID, yytext());}
{digito}+	{return new Symbol(Tokens.NUMEROyytext());}
{espaco}	{}
.           { System.out.println("Caracter ilegal: " + yytext()); }
