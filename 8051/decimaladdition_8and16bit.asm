Mov R0,10H;10H contains Address of first number
Mov R1,11H;11H contains Address of second number
Mov R2,12H;bit size(8 or 16)
Mov A,R2
Mov B,#8H;
DIV AB;A = 2 if 16 bit else A=1 if 8 bit 
Mov R4,A
Mov R5,#52H;Location of result
CLR C

ADDITION:
Mov A,@R0
ADDC A,@R1
DA A
Mov R6,PSW
CJNE R2,#10H,STORE
CJNE R4,#1H,STORE
Mov PSW,R6
JNC STORE
Mov 50H,#1H
SJMP STORE

UPDATE: DEC R0;move to next byte
DEC R1
DEC R5
SJMP ADDITION

STORE:CJNE R5,#52H,STORE_51H
Mov 52H,A
DJNZ R4,UPDATE
STOP: SJMP STOP
STORE_51H:Mov 51H,A
SJMP STOP
