/* ########################################################################

   PICsim - PIC simulator http://sourceforge.net/projects/picsim/

   ########################################################################

   Copyright (c) : 2010  Luis Claudio Gamboa Lopes

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
#include <pic.h>

#include "atraso.h"
#include "lcd.h"
#include "teclado.h"
#include "i2c.h"
#include "eeprom_ext.h"
#include "rtc.h"


__CONFIG(WDTDIS&  UNPROTECT & LVPDIS & BORDIS & MCLREN & PWRTEN & INTCLK);


/*
void isr() interrupt 0 {

}
*/

char* codetxt_to_ramtxt(const char* ctxt)
{
static char txt[45];
char i;
  for(i =0; txt[i] = ctxt[i]; i++);
  return txt;
}


void main() {
  unsigned char i,tmp;

  CMCON=0x07; 
  TRISA=0x30;
  TRISB=0xE7;
  
  PORTA=0;
  PORTB=0;

  lcd_init();

  i2c_init();

//teste lcd
  lcd_cmd(L_CLR); 
  lcd_cmd(L_L1);
  for(i=0;i<16;i++)
  {
    lcd_dat('A'+i);
  }
  lcd_cmd(L_L2);
  for(i=0;i<16;i++)
  {
    lcd_dat('a'+i);
  }

  atraso_ms(200);
  lcd_cmd(L_CLR);
  lcd_cmd(L_L1+3);
  lcd_str(codetxt_to_ramtxt("Teste LCD"));
  
  for(i=32;i<128;i++)
  {
    if((i%16) == 0)lcd_cmd(L_L2);
    lcd_dat(i);
    atraso_ms(50);
  }

  atraso_ms(100);
  lcd_cmd(L_CLR);
  lcd_cmd(L_L1+3);
  lcd_str(codetxt_to_ramtxt("Teste LCD"));
  lcd_cmd(L_L2+7);
  lcd_str(codetxt_to_ramtxt("Ok"));
  atraso_ms(500);

//teste LEDS
  lcd_cmd(L_CLR);
  lcd_cmd(L_L1+1);
  lcd_str(codetxt_to_ramtxt("Teste LEDs"));
 
for(i=0;i<4;i++)
  {
    atraso_ms(100);
    RA1^=1;
    atraso_ms(100);
    RA2^=1;
    atraso_ms(100);
    PORTA^=0x40; //RA6=1;
    atraso_ms(100);
    PORTA^=0x80; //RA7=1;
    atraso_ms(100);
  }


//teste Teclado
  lcd_cmd(L_CLR);
  lcd_cmd(L_L1+2);
  lcd_str(codetxt_to_ramtxt("Teste Teclado"));

  lcd_cmd(L_L2+1);

  i=0;
  while(i<14)
  {
    lcd_dat(tc_tecla(1500)+0x30);
    i++;
  }

//teste EEPROM EXT
  lcd_cmd(L_CLR);
  lcd_cmd(L_L1);
  lcd_str(codetxt_to_ramtxt("Teste EEPROM EXT"));
// testar ? 
  lcd_cmd(L_L2);
  lcd_str(codetxt_to_ramtxt("Testar (1/0) ?"));
 
  if(tc_tecla(1500) == 1)
  {
    tmp=e2pext_r(10);
    lcd_dat(tmp);

    e2pext_w(10,0xA5);
    e2pext_w(10,0x5A);
    i=e2pext_r(10);

    e2pext_w(10,tmp);

    lcd_cmd(L_CLR);
    lcd_cmd(L_L1);
    lcd_str(codetxt_to_ramtxt("Teste EEPROM EXT"));
    lcd_cmd(L_L2);
    if(i == 0x5A) 
      lcd_str(codetxt_to_ramtxt("     OK"));
    else
      lcd_str(codetxt_to_ramtxt("     ERRO"));

    atraso_ms(1000);
  }


//teste RTC
  lcd_cmd(L_CLR);
  lcd_cmd(L_L1);
  lcd_str(codetxt_to_ramtxt("Teste RTC"));
  
//ajuste  rtc_w();

//  rtc_w();

  rtc_r();
  lcd_cmd(L_L2);
  lcd_str(date);
   atraso_ms(1500);
  for(i=0;i<16;i++)
  {
    rtc_r();
    lcd_cmd(L_L2);;
    lcd_str(time);
    atraso_ms(500); 
  }

//fim teste 
  lcd_cmd(L_CLR);
  lcd_cmd(L_L1+4);
  lcd_str(codetxt_to_ramtxt("Fim"));
  lcd_cmd(L_L2+1);
  lcd_str(codetxt_to_ramtxt("Pressione RST"));

  while(1);


}
