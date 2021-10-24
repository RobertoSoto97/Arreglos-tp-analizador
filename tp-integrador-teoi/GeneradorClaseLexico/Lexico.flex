package com.tpi.teoi;
import java_cup.runtime.Symbol;
import java_cup.runtime.*;
import java.util.*;
import jflex.sym;

%%

/*%cupsym Simbolo*/
%cup
%public
%class Lexico
%line
%column
%char

/* Declaraciones basicas */

LETRA                 = [a-zA-Z]
DIGITO                = [0-9]
PRIMER_NUMERO         = {DIGITO}|({SIG_MENOS}{DIGITO})
CARACTERES_ESPECIALES = {PUNTO}|{COMA}|{SIG_MENOS}
ID                    = {LETRA}({LETRA}|{DIGITO}|_)*
EspacioBlanco         = [ \t\f\r\n]
COMMENT_BEG           = "//*"
COMMENT_END           = "*//"
COMMENT               = {COMMENT_BEG}({LETRA}|{DIGITO}|{CARACTERES_ESPECIALES}|{EspacioBlanco})*{COMMENT_END}
/* */


/* Constantes y Tipos de datos */

CONST_INT    = ({PRIMER_NUMERO}{DIGITO}*)
CONST_STRING = {COM}({LETRA}|{DIGITO}|{EspacioBlanco}|{CARACTERES_ESPECIALES})*{COM}
CONST_FLOAT  = ({PRIMER_NUMERO}{DIGITO}*{PUNTO}{DIGITO}+)

TYPE_INT     = INT | int
TYPE_STRING  = STRING | string
TYPE_FLOAT   = FLOAT | float
/* */


/* Comparaciones */

AND      = and | AND
OR       = or | OR
MAYOR    = ">"
MAYOR_I  = ">="
MENOR    = "<"
MENOR_I  = "<="
IGUAL    = "==" | "="
DISTINTO = "<>"
/* */


/* Palabras reservadas */

DEC      = declare.section | DECLARE.SECTION
ENDDEC   = enddeclare.section | ENDDECLARE.SECTION
START    = program.section | PROGRAM.SECTION
FINALIZE = endprogram.section | ENDPROGRAM.SECTION
IF       = (I|i)(F|f)
WHILE    = (W|w)(H|h)(i|i)(L|l)(e|e)
TAKE     = (T|t)(A|a)(K|k)(E|e)
EXIT     = (W|w)(R|r)(I|i)(T|t)(E|e)
ELSE     = (E|e)(L|l)(S|s)(E|e)
/* */


/* Simbolos */

SIG_MENOS          = "-"
SIG_MAS            = "+"
SIG_DIV            = "/"
SIG_MUL            = "*"
COMA               = ","
PUNTO              = "."
PUNTO_Y_COMA       = ";"
COM                = \"
SQR_BRACKET_OPEN   = "["
SQR_BRACKET_CLOSE  = "]"
BRACKET_OPEN       = "("
BRACKET_CLOSE      = ")"
KEY_OPEN           = "{"
KEY_CLOSE          = "}"
OP_ASSIGN          = "::="
OP_DECLARE         = ":="
/* */

/* Bloque de inicializacion */
%{
	MatchProcessor mp = new MatchProcessor();
%}
/* */

/* Bloque de finalizacion */
%{
	public ArrayList<com.tpi.teoi.Symbol> get_result(){
	    return mp.get_result();
	}

	public ArrayList<String> get_rejected(){
    	    return mp.get_rejected();
    	}
%}
/* */

%%

<YYINITIAL> {

{COMMENT}               {/* IGNORE */}

/* Constantes y Tipos de datos */

{CONST_INT}		        {mp.process_match("CONST_INT", yytext());}

{CONST_STRING}          {mp.process_match("CONST_STRING", yytext());}

{CONST_FLOAT}           {mp.process_match("CONST_FLOAT", yytext());}

{TYPE_INT}              {mp.process_match("TYPE_INT", yytext());}

{TYPE_STRING}           {mp.process_match("TYPE_STRING", yytext());}

{TYPE_FLOAT}            {mp.process_match("TYPE_FLOAT", yytext());}

/*  */

/* Comparaciones */

{AND}                   {mp.process_match("AND", yytext());}

{OR}                    {mp.process_match("OR", yytext());}

{MAYOR}                 {mp.process_match("MAYOR", yytext());}

{MAYOR_I}               {mp.process_match("MAYOR_I", yytext());}

{MENOR}                 {mp.process_match("MENOR", yytext());}

{MENOR_I}               {mp.process_match("MENOR_I", yytext());}

{IGUAL}                 {mp.process_match("IGUAL", yytext());}

{DISTINTO}              {mp.process_match("DISTINTO", yytext());}

/*  */

/* Palabras reservadas */

{DEC}		            {mp.process_match("DEC", yytext());}

{ENDDEC}	        	{mp.process_match("ENDDEC", yytext());}

{START}	            	{mp.process_match("START", yytext());}

{FINALIZE}	        	{mp.process_match("FINALIZE", yytext());}

{IF}	            	{mp.process_match("IF", yytext());}

{WHILE}	            	{mp.process_match("WHILE", yytext());}

{TAKE}		            {mp.process_match("TAKE", yytext());}

{EXIT}                  {mp.process_match("EXIT", yytext());}

{ELSE}                  {mp.process_match("ELSE", yytext());}

/*  */

/* Simbolos */

{SQR_BRACKET_OPEN}		{mp.process_match("SQR_BRACKET_OPEN", yytext());}

{SQR_BRACKET_CLOSE}     {mp.process_match("SQR_BRACKET_CLOSE", yytext());}

{BRACKET_OPEN}		    {mp.process_match("BRACKET_OPEN", yytext());}

{BRACKET_CLOSE}         {mp.process_match("BRACKET_CLOSE", yytext());}

{KEY_OPEN}		        {mp.process_match("KEY_OPEN", yytext());}

{KEY_CLOSE}             {mp.process_match("KEY_CLOSE", yytext());}

{OP_ASSIGN}	        	{mp.process_match("OP_ASSIGN", yytext());}

{OP_DECLARE}	       	{mp.process_match("OP_DECLARE", yytext());}

{COMA}                  {mp.process_match("COMA", yytext());}

{PUNTO_Y_COMA}          {mp.process_match("PUNTO_Y_COMA", yytext());}

{EspacioBlanco}			{ /* ignore */ }

{SIG_MENOS}             {mp.process_match("SIG_MENOS", yytext());}

{SIG_MAS}               {mp.process_match("SIG_MAS", yytext());}

{SIG_DIV}               {mp.process_match("SIG_DIV", yytext());}

{SIG_MUL}               {mp.process_match("SIG_MUL", yytext());}

/*  */

{ID}	            	{mp.process_match("ID", yytext());}

}

[^]		{ mp.process_unmatch(yytext(), String.valueOf(yyline)); }

