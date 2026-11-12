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
Boolean = T|NIL|#t|#f|nil|t|f

Open_Parantheses = \(
Close_Parantheses = \)
Atom = {Number} | {Symbol} | {String} | {Boolean}
%%

{Whitespace} {}

{Atom} {System.out.print("ATOM" + "\n");}
{Open_Parantheses} {System.out.print("OPEN_PARENTHESES" + "\n");}
{Close_Parantheses} {System.out.print("CLOSE_PARENTHESES" + "\n");}
