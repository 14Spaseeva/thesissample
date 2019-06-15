parser grammar BddParser;

options { tokenVocab=BddLexer; }

specification
    : testcases = testcase+ EOF;

testcase
	: TestCase TEXT eoi scenario ;

scenario
    : instructions = instruction (eoi instruction)* eoi*
    ;

instruction
    : Send  annotationText     #send
    | Receive annotationText   #recieve
    | Set annotationText       #set
    | Check annotationText     #check
    | Pause time  TEXT?        #pause
    ;

time
    : LBRACKET value=INTEGER RBRACKET
    ;

customParameter
    : LBRACKET (paramText = (INTEGER| TEXT))? RBRACKET
    ;


annotationText
    : text
    ;

text
    : left = text customParameter (right = TEXT)? #lr
    | TEXT                                    #phrase
    ;

eoi : NEWLINE;
