Mov R0,10H;contains Address of first number
Mov R1,11H;contains Address of second number
Mov R2,12H;bit size(8 or 16)
Mov R3,13H;Operation Type(0 if addition 1 if Subtraction)
Mov A,R2
Mov B,#8H;
DIV AB;A = 2 if 16 bit else A=1 if 8 bit 
Mov R4,A
Mov R5,#51H;Location of result
CLR C

CHOOSE_OP:	
CJNE R3,#0H,CHECK_SUB;Check if Op is ADDITION else check for subtraction
Mov A,@R0
ADDC A,@R1
SJMP STORE

CHECK_SUB:CJNE R3,#1H,STOP
Mov A,@R0
SUBB A,@R1
JC COMPLEMENT
SJMP STORE

UPDATE: INC R0;move to next byte
INC R1
INC R5
SJMP CHOOSE_OP

COMPLEMENT : CPL A
INC A
Mov 50H,#1H

STORE:CJNE R5,#51H,STORE_52H
Mov 51H,A
DJNZ R4,UPDATE
STOP: SJMP STOP
STORE_52H:Mov 52H,A
SJMP STOP
