#include<reg51.h>


void delay(int delaycount){

    for(int i=0;i<delaycount;i++){
        
        for(int j = 0;j<637;j++);

    }

}


int servoctrl(char direction){

    if(direction == 'L')
    return 2;

    else if(direction == 'R')
    return 4;

    return 3;
}


void main()
{

    char direction;
    int delaycount = 3;
    SCON = 0x50; // configure to 8 bit UART with variable baud rate
    TMOD = 0x20; // set timer 1 to 8 bit auto reload mode
    TH1 = 0xfd; // set baud rate to 9600
    TR1 = 1;
    

    while(1){

        while (RI == 0) //wait for all 8 bits recieved
        {
            P2 = 0x01;
            delay(delaycount);
            P2 = 0x00;
            delay(40);
        }

        RI = 0;
    
        direction = SBUF; //send recieved char to servo controls 
        delaycount = servoctrl(direction); //change pwn value

    }

}