java -jar jflex-full-1.7.0.jar Lexico.flex 

#{ printf 'package main;\n'; printf 'import jflex.sym;\n'; cat Lexico.java; } > Lexico.new

#mv Lexico.new Lexico.java

mv Lexico.java ../tpi-teoi/src/main/java/com/tpi/teoi/
