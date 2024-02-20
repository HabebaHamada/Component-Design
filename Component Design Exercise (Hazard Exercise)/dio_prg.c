/******************************************************************************/
/*                                                                            */
/* !Layer           : Micro-Controller Abstraction Layer (MCAL)               */
/*                                                                            */
/* !Component       : DIO                                                     */
/* !Description     : Digital I/O driver module                               */
/*                                                                            */
/* !Module          : DIO                                                     */
/* !Description     : DIO Module interface                                    */
/*                                                                            */
/* !File            : dio_int.h                                               */
/*                                                                            */
/* !Scope           : Public                                                  */
/*                                                                            */
/* !Coding language : C                                                       */
/*                                                                            */
/* !Project         : Induction training exercise project                     */
/*                                                                            */
/* !Target          : PIC 16F877A                                             */
/*                                                                            */
/* !Compiler        : SDCC V3.5                                               */
/*                                                                            */
/* !COPYRIGHT 2015 Valeo Egypt                                                */
/*  all rights reserved                                                       */
/*                                                                            */
/******************************************************************************/
/* MODIFICATION LOG :                                                         */
/******************************************************************************/
/*                                                                            */
/* !Designed by     : Ahmed ASSAF                      !Date : JULY 19, 2015  */
/* !Coded by        : Ahmed ASSAF                      !Date : JULY 19, 2015  */
/*                                                                            */
/* Rev 1.0   JULY 19, 2015     Initial release                                */
/******************************************************************************/

/******************************************************************************/
/*! \par
*   Internals of the module DIO. \n
*   This file contains the internals of the module DIO.                       */
/******************************************************************************/

/******************************************************************************/
/*! \defgroup  DIO Digital I/O (DIO) Component
* Abstract Digital I/O pins.
* \{                                                                          */

/*! \defgroup DIOINT DIO module
* This is the grouping of DIO module members.
* \{                                                                          */
/******************************************************************************/

/*! Include Basic types header                                                */
/*! \Trace_To																  */
#include "BTY_int.h"

/*! Include the module interface header                                       */
/*! \Trace_To                                                                 */
#include "DIO_int.h"

/*! Include the Microcontroller register file                                 */
/*! \Trace_To                                                                 */
#include "pic16f877a.h"

/******************************************************************************/
/*! \Description Read the value to a certain micro-controller channel         */
/*! \param[in]   enuChannelId  ID of the channel to read \n
    \Range       0..DIO_CHANNEL_NUMBER \n
    \Unit        N/A                                                          */
/*! \return      Aquired value from the I/O channel (HIGH or LOW)             */
/*! \Trace_To                                                                 */
/******************************************************************************/
uint8 DIO_u8ReadChannel(DIO_tenuChannelId enuChannelId)
{

    /*! <B>Service Detailed Description:</B> \n                               */

    /*! Define a variable to hold the return value                            */
    uint8 u8Return;
    /*! Define a variable to hold the pin number                              */
    uint8 u8PinNumber;

    /*! Check if the channel is within range                                  */
    if(enuChannelId < DIO_CHANNEL_NUMBER)
    {
	  /* PORT A */
      if(enuChannelId < DIO_PORTB_CHANNEL_0)
	  {
	    u8PinNumber = enuChannelId;
	    u8Return = PORTA >> u8PinNumber ;
	  }

	  /* PORT B */
	  else if (enuChannelId < DIO_PORTC_CHANNEL_0 )
	  {
	    u8PinNumber = enuChannelId - 6 /* Number of PortA channels */;
	    u8Return = PORTB >> u8PinNumber ;
	  }

	  /* PORT C */
	  else if (enuChannelId < DIO_PORTD_CHANNEL_0 )
	  {
	    u8PinNumber = enuChannelId - 14 /* Number of Port A&B channels */;
	    u8Return = PORTC >> u8PinNumber ;
	  }

	  /* PORT D */
      else if (enuChannelId < DIO_PORTE_CHANNEL_0 )
	  {
	    u8PinNumber = enuChannelId - 22;
	    u8Return = PORTD >> u8PinNumber ;
	  }
	  /* PORT E */
      else
	  {
	    u8PinNumber = enuChannelId - 30;
	    u8Return = PORTE >> u8PinNumber ;
	  }

      u8Return &= 0x01;
    }
    else
    {
        /*! If the channel ID is out of defined range, return zero            */
        u8Return = BTY_u8ZERO;
    }



    /*! Return the acquired value                                             */
    return(u8Return);
}

/******************************************************************************/
/*! \Description Write a value to a certain micro-controller channel          */
/*! \param[in]   enuChannelId  ID of the channel to read \n
    \Range       0..DIO_CHANNEL_NUMBER \n
    \Unit        N/A                                                          */
/*! \param[in]   enuLevel  Level to write to the I/O channel \n
    \Range       0..1 \n
    \Unit        N/A                                                          */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
void DIO_vidWriteChannel(
                         DIO_tenuChannelId enuChannelId,
                         DIO_tenuChannelLevel enuLevel
                        )
{
    /*! Define a variable to hold the pin number                              */
    uint8 u8PinNumber;

    /*! Check if the channel is within range                                  */
    if(enuChannelId < DIO_CHANNEL_NUMBER)
    {
	  /* PORT A */
      if(enuChannelId < DIO_PORTB_CHANNEL_0)
	  {
	    u8PinNumber = enuChannelId;
	    if (enuLevel == DIO_LEVEL_LOW)
		  {
		    PORTA = PORTA & ~(1 << u8PinNumber);
		  }
		else
		  {
		    PORTA = PORTA | (1 << u8PinNumber);
		  }
	  }

	  /* PORT B */
	  else if (enuChannelId < DIO_PORTC_CHANNEL_0 )
	  {
	    u8PinNumber = enuChannelId - 6 /* Number of PortA channels */;
	    if (enuLevel == DIO_LEVEL_LOW)
		  {
		    PORTB = PORTB & ~(1 << u8PinNumber);
		  }
		else
		  {
		    PORTB = PORTB | (1 << u8PinNumber);
		  }
	  }

	  /* PORT C */
	  else if (enuChannelId < DIO_PORTD_CHANNEL_0 )
	  {
	    u8PinNumber = enuChannelId - 14 /* Number of Port A&B channels */;
	    if (enuLevel == DIO_LEVEL_LOW)
		  {
		    PORTC = PORTC & ~(1 << u8PinNumber);
		  }
		else
		  {
		    PORTC = PORTC | (1 << u8PinNumber);
		  }
	  }

	  /* PORT D */
      else if (enuChannelId < DIO_PORTE_CHANNEL_0 )
	  {
	    u8PinNumber = enuChannelId - 22;
	    if (enuLevel == DIO_LEVEL_LOW)
		{
		  PORTD = PORTD & ~(1 << u8PinNumber);
		}
		else
		{
		  PORTD = PORTD | (1 << u8PinNumber);
		}
	  }
	  /* PORT E */
      else
	  {
	    u8PinNumber = enuChannelId - 30;
	    if (enuLevel == DIO_LEVEL_LOW)
		{
		  PORTE = PORTE & ~(1 << u8PinNumber);
		}
		else
		{
		  PORTE = PORTE | (1 << u8PinNumber);
		}
	  }

    }
    else
    {
        /* Do Nothing */
    }

}

/******************************************************************************/
/*! \Description Write the value to a certain micro-controller Port           */
/*! \param[in]   enuPortId: ID of the PORT group to write \n
    \Range       0..DIO_PORT_NUMBER \n
    \Unit        N/A                                                          */
/*! \param[in]   u8Value  Value to write to the PORT \n
    \Range       0..255 \n
    \Unit        N/A                                                          */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
void DIO_vidWritePort(
                      DIO_tenuPortId enuPortId,
                      uint8 u8Value
                      )
{
  switch (enuPortId)
  {
    case DIO_PORTA: PORTA = u8Value; break;
	case DIO_PORTB: PORTB = u8Value; break;
	case DIO_PORTC: PORTC = u8Value; break;
	case DIO_PORTD: PORTD = u8Value; break;
	case DIO_PORTE: PORTE = u8Value; break;
	default: /* Do Nothing */ break;
  }
}

/** \} */ /* end of DIO module group                                          */
/** \} */ /* end of DIO Component group                                       */
