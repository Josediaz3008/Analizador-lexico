package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%
chuunbes |
xuul |
waa |
tuun |
achak |
ixtak |
COMPARADOR |
OPERADOR |
( |
)|
VARIABLE |
NUMERO |
while {lexeme=yytext(); return Reservadas;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return antal;}
"+" {return +;}
"-" {return -;}
"*" {return *;}
"/" {return /;}
""" {return TEXTO}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}
