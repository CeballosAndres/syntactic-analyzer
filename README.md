
# Ejemplo de analizador sintactico LALR

## Con jFlex y Cup

jflex Lexico.flex && java java_cup.Main < Sintactico.cup && javac Main.java && java Main pasa_prueba.txt && java Main falla_prueba.txt
