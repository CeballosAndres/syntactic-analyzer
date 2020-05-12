/*
    Tomado del artículo corto en Linux Gazette por Richard A. Sevenich y
    Christopher Lopes, titulado "Compiler Construction Tools". Algunas modificaciones por Gerwin Klein
    Nombre del archivo: Main.java Para Crearlo:
    Después de crear el escaner lcalc.flex y el parser ycalc.cup, ejecutar
    > javac Main.java Para correrlo:
    > java Main test.txt
    donde test.txt es un archivo de entrada para la calculadora. 
*/
import java.io.*;
public class Main {
        static public void main(String argv[]) {
        /* Inicia el parser */ 
        try {
            parser p = new parser(new Lexer(new FileReader(argv[0])));
            Object result = p.parse().value;
        } catch (Exception e) {
            /* hace limpieza aquí - posiblemente volver a lanzar e */
            e.printStackTrace(); 
        }
    } 
}