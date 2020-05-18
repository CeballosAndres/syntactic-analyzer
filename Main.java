/* Código para enlazar el analizador léxico (jflex) y el analizador 
sintáctico (CUP) */

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