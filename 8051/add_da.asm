Mov R0,10H;contains Address of first number
Mov R1,11H;contains Address of second number
Mov R2,#30H;address of result 
Mov A,@R0
ADD A,@R1
DA A
Mov R3,A
Mov A,R2
Mov R0,A
Mov A,R3
Mov @R0,A