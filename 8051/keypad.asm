Mov P0,#112
POLL : MOV A,P0
ANL A,#70H
CJNE A,#70H,SCAN_I
SJMP POLL
SCAN_I :
CLR C
RLC A
MOV R0,#0
SCAN :
INC R0
RLC A
JC SCAN
Mov P0,#0Fh
Mov A, P0
clr c
mov r2,#5
rot_5:RLC A
djnz r2,rot_5
jnc check
SCAN_R:
Mov R3,#3h
incr_3:INC R0
DJNZ R3,incr_3
RLC A
jc scan_r
check : 
star : cjne r0,#0Ah,zero
Mov R0,#2Ah
sjmp stop
zero : cjne r0,#0bh,hash
Mov R0,#0h
sjmp stop
hash : cjne R0,#0ch,stop
Mov R0,#23h
stop : sjmp stop