parser grammar BddParser;

options { tokenVocab=BddLexer;
}

specification
    : testcases = testcase+ EOF;

testcase: TestCase TEXT NEWLINE scenario ;

scenario
    :instr
    |left = scenario instr //right = instr
    ;

instr
    :
    instruction NEWLINE
    ;

instruction
    : Send  instrText     #send
    | Receive instrText   #recieve
    | Set instrText       #set
    | Check instrText     #check
    | Pause time  TEXT?   #pause
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




