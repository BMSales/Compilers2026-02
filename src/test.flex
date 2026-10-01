%%
%standalone

Digit = [0-9]
Letter = [a-zA-Z]
Character = [a-zA-Z0-9\s]
Digits = {Digit}+
Number = [\+|\-]?{Digits}(\.{Digits})?
Whitespace = [ \t\r\n]+

Initial_Char = {Letter}|\+|\-|\*|\/|\=|\<|\>|\!|\?
Symbol_Char = {Initial_Char}|{Digit}
Symbol_Chars = {Symbol_Char}*
Symbol = {Initial_Char}{Symbol_Chars}

String = \"{Character}*\"
Boolean = T|NIL|#t|#f

Operator = \( | \)
Atom = {Number} | {Symbol} | {String} | {Boolean}
%%

{Whitespace} {}

{Number} {System.out.print("NUMBER: " + yytext() + "\n");}
{Symbol} {System.out.print("SYMBOL: " + yytext() + "\n");}
{String} {System.out.print("STRING: " + yytext() + "\n");}
{Boolean} {System.out.print("BOOLEAN: " + yytext() + "\n");}
{Operator} {System.out.print("OPERATOR: " + yytext() + "\n");}
