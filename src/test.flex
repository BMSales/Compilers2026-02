%%
%standalone

Digit = [0-9]
Letter = [a-zA-Z]
Digits = {Digit}+
Number = [\+|\-]{Digits}\.{Digits}

Initial_Char = {Letter}|\+|\-|\*|\/|\=|\<|\>|\!|\?
Symbol_Char = {Initial_Char}|{Digit}

%%

{Digits} {System.out.print("DIGITS: " + yytext() + "\n");}
{Number} {System.out.print("NUMBER: " + yytext() + "\n");}
{Symbol_Char} {System.out.print("SYMBOL CHAR: " + yytext() + "\n");}
