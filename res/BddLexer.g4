lexer grammar BddLexer;

WS
    :('\t'|' ')+ ->  channel(HIDDEN)
    ;

NEWLINE :
    [\r|\n]+ -> channel(HIDDEN)
    ;

INTEGER : DIGIT+ ;
fragment DIGIT: ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9');


fragment SYMB_NOT_DIGIT:
     ~(':'|'['|']'|'\r'|'\n' |'@' | '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9')
     ;

fragment Stsrt : SYMB_NOT_DIGIT+;

fragment StartText1 : Stsrt;

TEXT:     ((StartText1 *? INTEGER) |  StartText1) +;

fragment DOG: '@';
Repeat
    : DOG [Rr][e][p][e][a][t]
    ;
Send
    : DOG [Ss][e][n][d]
    ;
Receive
    : DOG [Rr][e][c][i][e][v][e]
    ;
Set
    : DOG [Ss][e][t]
    ;
Check
    : DOG [Cc][h][e][c][k]
    ;
Pause
    : DOG [Pp][a][u][s][e]
    ;

TestCase
    :
    DOG [Tt][e][s][t][C][a][s][e]
    ;

LBRACKET
    : '[' ;
RBRACKET
    : ']' ;

