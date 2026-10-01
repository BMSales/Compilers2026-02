jflex -d output/ test.flex
javac output/Yylex.java
cd output/ && java Yylex test.lisp
rm Yylex.java Yylex.class
