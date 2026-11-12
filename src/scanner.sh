jflex -d bin/ test.flex
javac bin/Yylex.java
cd bin/ && java Yylex ../example.lisp >../output/output.txt
rm Yylex.java Yylex.class
