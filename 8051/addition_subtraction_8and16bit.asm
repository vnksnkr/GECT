;value at 50H = 1 if result negative
Mov R0,10H;10H contains Address of first number
Mov R1,11H;11H contains Address of second number
Mov R2,12H;bit size(8 or 16)
Mov R3,13H;Operation Type(0 if addition 1 if Subtraction)
Mov A,R2
Mov B,#8H;
DIV AB;A = 2 if 16 bit else A=1 if 8 bit 
Mov R4,A
Mov R5,#53H;Location of result
CLR C

CHOOSE_OP:	
CJNE R3,#0H,CHECK_SUB;Check if Op is ADDITION else check for subtraction
Mov A,@R0
ADDC A,@R1
Mov R6,PSW
CJNE R2,#10H,STORE
CJNE R4,#1H,STORE
Mov PSW,R6
JNC STORE
Mov 51H,#1H
SJMP STORE

CHECK_SUB:CJNE R3,#1H,STOP
CJNE R2,#10H,SUBTRACT
CJNE R4,#1H,SUBTRACT
Mov PSW,R6
SUBTRACT:
Mov A,@R0
SUBB A,@R1
Mov R6,PSW
JC COMPLEMENT
SJMP STORE

UPDATE: DEC R0;move to next byte
DEC R1
DEC R5
SJMP CHOOSE_OP

COMPLEMENT : CJNE R4,#1H,STORE
CPL A
INC A
Mov 50H,#1H



STORE:CJNE R5,#53H,STORE_52H
Mov 53H,A
DJNZ R4,UPDATE
STOP: SJMP STOP
STORE_52H:Mov 52H,A
SJMP STOP

