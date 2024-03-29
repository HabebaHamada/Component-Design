/* ########################################################################

   PICsim - PIC simulator http://sourceforge.net/projects/picsim/

   ########################################################################

   Copyright (c) : 2010  Luis Claudio Gambôa Lopes

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

unsigned char display7s(unsigned char v)
{
  switch(v)
  {
    case 0:
      return 0xEE;
      break;
    case 1:
      return 0x28;
      break;
    case 2:
      return 0xCD;
      break;
    case 3:
      return 0x6D;
      break;
    case 4:
      return 0x2B;
      break;
    case 5:
      return 0x67;
      break;
    case 6:
      return 0xE7;
      break;
    case 7:
      return 0x2C;
      break;
    case 8:
      return 0xEF;
      break;
    case 9:
      return 0x6F;
      break;
    case 10:
      return 0xAF;
      break;
    case 11:
      return 0xE3;
      break;
    case 12:
      return 0xC6;
      break;
    case 13:
      return 0xE9;
      break;
    case 14:
      return 0xC7;
      break;
    case 15:
      return 0x87;
      break;
    default:
      return 0;
      break;
  }

}


