parser grammar BddParser;

options { tokenVocab=BddLexer;
}

specification
    : testcases = testcase+ EOF;

testcase: TestCase TEXT scenario ;

scenario
    :(repeatPart|instruction)
    |left = scenario scenario
    ;


instruction
    : Send  instrText     #send
    | Receive instrText   #recieve
    | Set instrText       #set
    | Check instrText     #check
    | Pause time  TEXT?   #pause
    ;

repeatPart
    : Repeat time LBRACKET repeatScen=scenario RBRACKET
    ;

time
    : LBRACKET value=INTEGER RBRACKET
    ;

customParam
    : LBRACKET param RBRACKET
    ;

param
    :(INTEGER| TEXT)?
    ;

instrText
    : text
    ;

text
    :TEXT
    |left = text customParam (right = text)?
    ;




