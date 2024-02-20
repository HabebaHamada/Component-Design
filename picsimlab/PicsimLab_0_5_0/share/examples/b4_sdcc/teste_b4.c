/* ########################################################################

   PICsim - PIC simulator http://sourceforge.net/projects/picsim/

   ########################################################################

   Copyright (c) : 2011  Luis Claudio Gambôa Lopes

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

   For e-mail suggestions :  lcgamboa@yahoo.com
   ######################################################################## */

/* ----------------------------------------------------------------------- */
/* Template source file generated by piklab */
#include <pic18f452.h>

#include "atraso.h"
#include "lcd.h"
#include "display7s.h"
#include "i2c.h"
#include "serial.h"
#include "eeprom.h"
#include "eeprom_ext.h"
#include "adc.h"
#include "itoa.h"

/* ----------------------------------------------------------------------- */
/* Configuration bits: adapt to your setup and needs */
code char at __CONFIG1H CONFIG1H = _OSC_HS_1H & _OSCS_OFF_1H;
code char at __CONFIG2L CONFIG2L = _PUT_OFF_2L & _BODEN_OFF_2L & _BODENV_2_0V_2L;
code char at __CONFIG2H CONFIG2H = _WDT_OFF_2H & _WDTPS_1_128_2H;
code char at __CONFIG3H CONFIG3H = _CCP2MUX_RC1_3H;
code char at __CONFIG4L CONFIG4L = _STVR_OFF_4L & _LVP_OFF_4L & _BACKBUG_OFF_4L;
code char at __CONFIG5L CONFIG5L = _CP_0_OFF_5L & _CP_1_OFF_5L & _CP_2_OFF_5L & _CP_3_OFF_5L;
code char at __CONFIG5H CONFIG5H = _CPB_OFF_5H & _CPD_OFF_5H;
code char at __CONFIG6L CONFIG6L = _WRT_0_OFF_6L & _WRT_1_OFF_6L & _WRT_2_OFF_6L & _WRT_3_OFF_6L;
code char at __CONFIG6H CONFIG6H = _WRTC_OFF_6H & _WRTB_OFF_6H & _WRTD_OFF_6H;
code char at __CONFIG7L CONFIG7L = _EBTR_0_OFF_7L & _EBTR_1_OFF_7L & _EBTR_2_OFF_7L & _EBTR_3_OFF_7L;
code char at __CONFIG7H CONFIG7H = _EBTRB_OFF_7H;




unsigned char cnt;
unsigned int t1cont;

void isrh() interrupt 1 {                                                                                                   /* interrupt service routine */
  cnt--; 
  if(!cnt)
  {
//executada a cada 1 segundo
     T1CONbits.TMR1ON=0;
     t1cont=(((unsigned int)TMR1H<<8)|(TMR1L))/7; //ventilador com 7 p�s
     cnt=125; 
     TMR1H=0;
     TMR1L=0;
     T1CONbits.TMR1ON=1;
  }
  INTCONbits.T0IF=0;
  TMR0H=0;
  TMR0L=6; //250
}

void isrl() interrupt 2 {
} 


void main() 
{
  unsigned char i;
  unsigned char tmp;
  unsigned int tmpi;

  char str[6];

  ADCON1=0x06;
  TRISA=0xFF;
  TRISB=0x00;
  TRISC=0x01;
  TRISD=0x00;
  TRISE=0x00;

  lcd_init();
  i2c_init();
  serial_init();
  adc_init();

//testa caracter especial
  lcd_cmd(L_CLR);
  lcd_cmd(L_L1);
  lcd_str("   Teste LCD");

  lcd_cmd(0x40);//endere�o

  lcd_dat(0x11);
  lcd_dat(0x19);
  lcd_dat(0x15);
  lcd_dat(0x13);
  lcd_dat(0x13);
  lcd_dat(0x15);
  lcd_dat(0x19);
  lcd_dat(0x11);

  lcd_dat(0x0E);
  lcd_dat(0x11);
  lcd_dat(0x0E);
  lcd_dat(0x05);
  lcd_dat(0x0E);
  lcd_dat(0x14);
  lcd_dat(0x0A);
  lcd_dat(0x11);


  lcd_cmd(L_L2);

  for(i=0;i<16;i++)
  {
    lcd_dat(i%2);
    atraso_ms(100);
  }

//teste lcd
  lcd_cmd(L_CLR);
  lcd_cmd(L_L1);
  lcd_str("   Teste LCD");
  
  for(i=32;i<128;i++)
  {
    if((i%16) == 0)lcd_cmd(L_L2);
    lcd_dat(i);
    atraso_ms(50);
  }

  atraso_ms(100);
  lcd_cmd(L_CLR);
  lcd_cmd(L_L1);
  lcd_str("   Teste LCD");
  lcd_cmd(L_L2);
  lcd_str("       Ok");
  atraso_ms(500);




//testa display 7s

  lcd_cmd(L_CLR);
  lcd_cmd(L_L1);
  lcd_str("   Teste 7 Seg");


    PORTBbits.RB7=1;
    for(i=0;i<4;i++)
    {
      PORTB=0x10<<i;  
      for(tmp=0;tmp<16;tmp++)
      {
        PORTD=display7s(tmp);	 
        atraso_ms(200);	
      }
    }

  PORTD=0;

//testa LEDs

  lcd_cmd(L_CLR);
  lcd_cmd(L_L1+3);
  lcd_str("Teste LEDs");

  for(tmp=0;tmp<3;tmp++)
    {
      for(i=1;i < 16;i=i*2)
      { 
        PORTB=i;
        atraso_ms(200);  
      }
    }
  PORTB=0;
  for(i=0;i<4;i++)
  {
    PORTB^=0x0F;
    atraso_ms(200);
  }  

//testa chaves


  lcd_cmd(L_CLR);
  lcd_cmd(L_L1);
  lcd_str("  Teste Chaves");

  tmp=0;

  while((tmp & 0x0F) != 0x0F)
  {
    TRISB=0x0F;

    if(PORTBbits.RB0 == 0)
    {
      tmp|=0x01;
    }
    if(PORTBbits.RB1 == 0)
    {
      tmp|=0x02;
    }
    if(PORTBbits.RB2 == 0)
    {
      tmp|=0x04;
    }
    if(PORTBbits.RB3 == 0)
    {
      tmp|=0x08;
    }
    
    TRISB=0x00;
    PORTB=tmp;
    atraso_ms(10);
  }
  PORTB=0; 


//teste EEPROM INT
  lcd_cmd(L_CLR);
  lcd_cmd(L_L1);
  lcd_str("Teste EEPROM INT");
// testar ? 
  lcd_cmd(L_L2);
  lcd_str(" (s=S1 n=S2) ?");

  TRISB=0x03;

  while(PORTBbits.RB0 && PORTBbits.RB1);

  if(PORTBbits.RB0 == 0)
  {
    tmp=e2prom_r(10);
    lcd_dat(tmp);

    e2prom_w(10,0xA5);
    e2prom_w(10,0x5A);
    i=e2prom_r(10);

    e2prom_w(10,tmp);

    lcd_cmd(L_CLR);
    lcd_cmd(L_L1);
    lcd_str("Teste EEPROM INT");
    lcd_cmd(L_L2);
    if(i == 0x5A) 
      lcd_str("       OK");
    else
      lcd_str("      ERRO");

    atraso_ms(1000);
  }
  else
  {
    while(PORTBbits.RB1 == 0);
  }

  TRISB=0x00;
  PORTB=0;

//teste EEPROM EXT
  lcd_cmd(L_CLR);
  lcd_cmd(L_L1);
  lcd_str("Teste EEPROM EXT");
// testar ? 
  lcd_cmd(L_L2);
  lcd_str(" (s=S1 n=S2) ?");

  TRISB=0x03;

  while(PORTBbits.RB0 && PORTBbits.RB1);

  if(PORTBbits.RB0 == 0)
  {
    tmp=e2pext_r(10);
    lcd_dat(tmp);

    e2pext_w(10,0xA5);
    e2pext_w(10,0x5A);
    i=e2pext_r(10);

    e2pext_w(10,tmp);

    lcd_cmd(L_CLR);
    lcd_cmd(L_L1);
    lcd_str("Teste EEPROM EXT");
    lcd_cmd(L_L2);
    if(i == 0x5A) 
      lcd_str("       OK");
    else
      lcd_str("      ERRO");

    atraso_ms(1000);
  }
  else
  {
    while(PORTBbits.RB1 == 0);
  }

  TRISB=0x00;
  PORTB=0;

//teste serial
  lcd_cmd(L_CLR);
  lcd_cmd(L_L1);
  lcd_str("Teste Serial TX");
  lcd_cmd(L_L2+4);
  lcd_str("9600 8N1");

  serial_tx_str("\r\n Picsimlab\r\n Teste Serial TX\r\n");

  for(i=0;i<4;i++)
  {
    serial_tx(i+0x30);
    serial_tx_str(" PicsimLab\r\n");
  }
  atraso_ms(1000);

  lcd_cmd(L_CLR);
  lcd_cmd(L_L1);
  lcd_str("Teste Serial RX");
  serial_tx_str(" Digite!\r\n");
  for(i=0;i<32;i++)
  {
    if(!(i%16))
    {
       lcd_cmd(L_L2);
       serial_tx_str("\r\n");
    }
    tmp=serial_rx(2000);
    lcd_dat(tmp);
    serial_tx(tmp);
  }
  atraso_ms(100);


//teste ADC
  lcd_cmd(L_CLR);
  lcd_cmd(L_L1);
  lcd_str(" Teste ADC (P2)");

  for(i=0; i< 200; i++)
  {
    tmp=((unsigned int)adc_amostra(1)*10)/204;
    lcd_cmd(L_L2+6);
    itoa(tmp,str);
    lcd_dat(str[3]);
    lcd_dat(',');
    lcd_dat(str[4]);
    lcd_dat('V');
    atraso_ms(10);
  }



//teste TEMP
  lcd_cmd(L_CLR);
  lcd_cmd(L_L1);
  lcd_str("   Teste TEMP");

  for(i=0; i< 100; i++)
  {
    tmpi=((unsigned int) adc_amostra(0)*81)/100;
    lcd_cmd(L_L2+5);
    itoa(tmpi,str);
    lcd_dat(str[2]);
    lcd_dat(str[3]);
    lcd_dat(',');
    lcd_dat(str[4]);
    lcd_dat('C');
    atraso_ms(10);
  }


//teste Aquecimento
  lcd_cmd(L_CLR);
  lcd_cmd(L_L1);
  lcd_str("   Teste AQUEC");
  PORTCbits.RC2=1;
  for(i=0; i< 100; i++)
  {
    tmpi=((unsigned int) adc_amostra(0)*81)/100;
    lcd_cmd(L_L2+5);
    itoa(tmpi,str);
    lcd_dat(str[2]);
    lcd_dat(str[3]);
    lcd_dat(',');
    lcd_dat(str[4]);
    lcd_dat('C');
    atraso_ms(10);
  }
  PORTCbits.RC2=0;


//teste Resfriamento
  lcd_cmd(L_CLR);
  lcd_cmd(L_L1);
  lcd_str("   Teste RESFR");

//timer0 temporizador

 T0CONbits.T0CS=0;
 T0CONbits.PSA=0;
 T0CONbits.T08BIT=1;
 T0CONbits.T0PS0=0; // divide por 32
 T0CONbits.T0PS1=0;
 T0CONbits.T0PS2=1;
 T0CONbits.TMR0ON=1;

 INTCONbits.T0IE=1;

//T = 32x250x125 = 1segundo;

//timer1 contador
 T1CONbits.TMR1CS=1;
 T1CONbits.T1CKPS1=0;
 T1CONbits.T1CKPS0=0;


 INTCONbits.T0IF=0;
 TMR0H=0;
 TMR0L=6; //250
 cnt=125; 
 INTCONbits.GIE=1;

 TMR1H=0;
 TMR1L=0;
 T1CONbits.TMR1ON=1;

  PORTCbits.RC1=1;
  for(i=0; i< 150; i++)
  {
    tmpi=((unsigned int) adc_amostra(0)*81)/100;
    lcd_cmd(L_L2+2);
    itoa(tmpi,str);
    lcd_dat(str[2]);
    lcd_dat(str[3]);
    lcd_dat(',');
    lcd_dat(str[4]);
    lcd_dat('C');

    lcd_cmd(L_L2+8);
    itoa(t1cont,str);
    lcd_dat(str[1]);
    lcd_dat(str[2]);
    lcd_dat(str[3]);
    lcd_dat(str[4]);
    lcd_dat('R');
    lcd_dat('P');
    lcd_dat('S');

    atraso_ms(10);
  }

  INTCONbits.GIE=0;
  PORTCbits.RC1=0;

//fim teste 
  lcd_cmd(L_CLR);
  lcd_cmd(L_L1);
  lcd_str("      Fim");
  lcd_cmd(L_L2);
  lcd_str(" Pressione RST");

  serial_tx_str("\r\n FIM!\r\n");


   while(1);

}
