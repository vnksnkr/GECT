Mov R0,#30H
Mov R1,#31H
CJNE @R0,#0H,CUBE
SQUARE :
Mov A,@R1
Mov DPTR,#200H 
MovC A,@A+DPTR
Mov 40H,A
CJNE @R1,#16,STOP
Mov A,@R1
INC A
MovC A,@A+DPTR
Mov 41H,A
SJMP STOP
CUBE :
Mov A,@R1
Mov DPTR,#300H
SUBB A,#7
JNC CUBE_ABOV_6
Mov A,@R1
MovC A,@A+DPTR
MOv 40H,A
SJMP STOP
CUBE_ABOV_6:
Mov A,@R1
SUBB A,#7
Mov B,#2
MUL AB
ADD A,#7
Mov R3,A
Movc A,@A+DPTR
Mov 40H,A
Mov A,R3
INC A
Movc A,@A+DPTR
Mov 41H,A
STOP:SJMP STOP
org 200H
DB 0,1,4,9,16,25,36,49,64,81,100,121,144,169,196,225,1H,0H
org 300H
DB 0,1,8,27,64,125,216,1H,57H,2H,00H,2H,D9H,3H,E8H,5H,33H,6H,C0H,8H,95H,AH,B8H,DH,2FH,10H,00H
