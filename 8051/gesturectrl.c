#include<reg51.h>

sbit opin = P2^0;
void delay(unsigned int delaycount){

	unsigned int i;
    for(i=0;i<delaycount;i++){
        ;
    }

}


// int servoctrl(char movptrection){

//     if(movptrection == 'L')
//     return 2;

//     else if(movptrection == 'R')
//     return 4;

//     return 3;
// }


void main()
{

    
    unsigned char pan,tilt;
    char * movptr = &pan; 
    
    
    SCON = 0x50; // configure to 8 bit UART with variable baud rate
    TMOD = 0x20; // set timer 1 to 8 bit auto reload mode
    TH1 = 0xfd; // set baud rate to 9600
    TR1 = 1;
    

    while(1){

        while (RI == 0) //wait for all 8 bits recieved
        {
            opin = 1;
			P1 = 0x01;
            delay(pan);
            opin = 0;
			delay(2160);
        }

		P1 = 0x0;
        RI = 0;
    
        

        if (SBUF == 'P')
        {
            movptr = &pan;
        }
        

        else if (SBUF == 'T')
        {
            movptr = &tilt;
        }

        else
        {
            *(movptr) = SBUF;
        }


    }

}
