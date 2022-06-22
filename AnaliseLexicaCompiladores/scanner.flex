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

";"			{return new Symbol(Tokens.SEMI, yytext());}
"="			{return new Symbol(Tokens.ATRIB, yytext());}
"-"			{return new Symbol(Tokens.MENOS, yytext());}
"+"			{return new Symbol(Tokens.MAIS, yytext());}
"*"			{return new Symbol(Tokens.VEZES, yytext());}
"("			{return new Symbol(Tokens.LPAREN, yytext());}
")"			{return new Symbol(Tokens.RPAREN, yytext());}
{id}		{return new Symbol(Tokens.ID, yytext());}
{digito}+	{return new Symbol(Tokens.NUMERO, new Integer(yytext()));}
{espaco}	{}
.           { System.out.println("Caracter ilegal: " + yytext()); }
