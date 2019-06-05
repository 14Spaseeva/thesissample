parser grammar BddParser;

options { tokenVocab=BddLexer; }


scenario
    : instructions = instruction (eoi instruction)* eoi* EOF
    ;


instruction
    : Send  annotationText     #send
    | Recieve annotationText   #recieve
    | Set annotationText       #set
    | Check annotationText     #check
    | Pause time  TEXT?        #pause
    ;

time: LBRACKET value=INTEGER RBRACKET;

customParameter
    : LBRACKET (paramText = (INTEGER| TEXT))? RBRACKET
    ;


annotationText  : text;

text
             : left = text customParameter (right = TEXT)? #lr
             | TEXT                                        #startPhrase
             ;

eoi : NEWLINE;


