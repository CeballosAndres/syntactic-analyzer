/* Analizador léxico */
import java_cup.runtime.*; 

%%
%class Lexer
%standalone
%unicode 
%line 
%column 

%cup
%{
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

LineTerminator = \r|\n|\r\n
WhiteSpace = {LineTerminator} | [ \t\f]
dec_int_lit = 0 | [1-9][0-9]*
dec_int_id = [A-Za-z_][A-Za-z_0-9]*

%%
<YYINITIAL> {
    ";"             { System.out.println(" ; "); return symbol(sym.SEMI); }
    "+"             { System.out.print(" + "); return symbol(sym.SUM); }
    "-"             { System.out.print(" - "); return symbol(sym.RES); }
    "*"             { System.out.print(" * "); return symbol(sym.MUL); }
    "/"             { System.out.print(" / "); return symbol(sym.DIV); }
    "("             { System.out.print(" ( "); return symbol(sym.LP); }
    ")"             { System.out.print(" ) "); return symbol(sym.RP); }
    {dec_int_lit}   { System.out.print(yytext());
                        return symbol(sym.NUM, new Integer(yytext())); }
    {dec_int_id}    { System.out.print(yytext());
                        return symbol(sym.ID, new Integer(1));}
    {WhiteSpace}    { /* omite lo que se encontró, no haga nada */ }
}
[^]             { throw new Error("Caracter Ilegal <"+yytext()+">"); }