Mov R5,#0H
Mov R6,#0H
Mov R4,#0H
Mov R3,30H
Mov R2,#0H
Mov DPTR,#200H
SUM_ELEMENT : Mov A,R2
MOVC A,@A+DPTR
ADDC A,R4
Mov R4,A
Mov A,R5
ADDC A,#0H
Mov R5,A
Mov A,R6
ADDC A,#0H
Mov R6,A
Mov A,R7
ADDC A,#0H
Mov R7,A
INC R2
DJNZ R3,SUM_ELEMENT
Mov 43H,R4
Mov 42H,R5
Mov 41H,R6
Mov 40H,R7
ORG 200H
DB FFH,FFH,FFH,FFH,FFH,FFH,FFH,FFH
