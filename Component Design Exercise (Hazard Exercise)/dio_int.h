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
*   Interface of the module DIO. \n
*   This file contains the interface of the module DIO.                       */
/******************************************************************************/

/******************************************************************************/
/*! \defgroup  DIO Digital I/O (DIO) Component
* Abstract Digital I/O pins.
* \{                                                                          */

/*! \defgroup DIOINT DIO module
* This is the grouping of DIO module members.
* \{                                                                          */
/******************************************************************************/

#ifndef DIO_INT_H
#define DIO_INT_H

#include "BTY_int.h"

/******************************************************************************/
/******************************************************************************/
/****************************** Types Definition ******************************/
/******************************************************************************/
/******************************************************************************/

/******************************************************************************/
/*! \Description Define DIO module channels ID, bits 3..5 indicates the port
                 number and bits 0..2 indicate the pin number                 */
/*! \Trace_To                                                                 */
/******************************************************************************/
typedef enum
{
    /*! PORT A IDs                                                            */
    DIO_PORTA_CHANNEL_0 = 0,    /*!< PortA pin0                               */
    DIO_PORTA_CHANNEL_1,        /*!< PortA pin1                               */
    DIO_PORTA_CHANNEL_2,        /*!< PortA pin2                               */
    DIO_PORTA_CHANNEL_3,        /*!< PortA pin3                               */
    DIO_PORTA_CHANNEL_4,        /*!< PortA pin4                               */
    DIO_PORTA_CHANNEL_5,        /*!< PortA pin5                               */
    /*! PORT B IDs                                                            */
    DIO_PORTB_CHANNEL_0,        /*!< PortB pin0                               */
    DIO_PORTB_CHANNEL_1,        /*!< PortB pin1                               */
    DIO_PORTB_CHANNEL_2,        /*!< PortB pin2                               */
    DIO_PORTB_CHANNEL_3,        /*!< PortB pin3                               */
    DIO_PORTB_CHANNEL_4,        /*!< PortB pin4                               */
    DIO_PORTB_CHANNEL_5,        /*!< PortB pin5                               */
    DIO_PORTB_CHANNEL_6,        /*!< PortB pin6                               */
    DIO_PORTB_CHANNEL_7,        /*!< PortB pin7                               */
    /*! PORT C IDs                                                            */
    DIO_PORTC_CHANNEL_0,        /*!< PortC pin0                               */
    DIO_PORTC_CHANNEL_1,        /*!< PortC pin1                               */
    DIO_PORTC_CHANNEL_2,        /*!< PortC pin2                               */
    DIO_PORTC_CHANNEL_3,        /*!< PortC pin3                               */
    DIO_PORTC_CHANNEL_4,        /*!< PortC pin4                               */
    DIO_PORTC_CHANNEL_5,        /*!< PortC pin5                               */
    DIO_PORTC_CHANNEL_6,        /*!< PortC pin6                               */
    DIO_PORTC_CHANNEL_7,        /*!< PortC pin7                               */
    /*! PORT D IDs                                                            */
    DIO_PORTD_CHANNEL_0,        /*!< PortD pin0                               */
    DIO_PORTD_CHANNEL_1,        /*!< PortD pin1                               */
    DIO_PORTD_CHANNEL_2,        /*!< PortD pin2                               */
    DIO_PORTD_CHANNEL_3,        /*!< PortD pin3                               */
    DIO_PORTD_CHANNEL_4,        /*!< PortD pin4                               */
    DIO_PORTD_CHANNEL_5,        /*!< PortD pin5                               */
    DIO_PORTD_CHANNEL_6,        /*!< PortD pin6                               */
    DIO_PORTD_CHANNEL_7,        /*!< PortD pin7                               */
    /*! PORT E IDs                                                            */
    DIO_PORTE_CHANNEL_0,        /*!< PortE pin0                               */
    DIO_PORTE_CHANNEL_1,        /*!< PortE pin1                               */
    DIO_PORTE_CHANNEL_2,        /*!< PortE pin2                               */

    DIO_CHANNEL_NUMBER          /*!< Maximum channel number                   */
} DIO_tenuChannelId;


/******************************************************************************/
/*! \Description Define DIO module PORT IDs                                   */
/*! \Trace_To                                                                 */
/******************************************************************************/
typedef enum
{
    DIO_PORTA = 0,    /*!< PortA                               */
    DIO_PORTB,        /*!< PortB                               */
    DIO_PORTC,        /*!< PortC                               */
    DIO_PORTD,        /*!< PortD                               */
    DIO_PORTE,        /*!< PortE                               */
	DIO_PORT_NUMBER

} DIO_tenuPortId;

/******************************************************************************/
/*! \Description Define DIO module channels levels                            */
/*! \Trace_To                                                                 */
/******************************************************************************/
typedef enum
{
    DIO_LEVEL_LOW = 0,
    DIO_LEVEL_HIGH,
    DIO_LEVEL_UNDEFINED
} DIO_tenuChannelLevel;


/******************************************************************************/
/******************************************************************************/
/****************************** Macro Definitions *****************************/
/******************************************************************************/
/******************************************************************************/

/******************************************************************************/
/******************************************************************************/
/***************************** Symbol Definitions *****************************/
/******************************************************************************/
/******************************************************************************/

/******************************************************************************/
/******************************************************************************/
/*************************** Constants Declaration ****************************/
/******************************************************************************/
/******************************************************************************/

/******************************************************************************/
/******************************************************************************/
/*************************** Variables Declaration ****************************/
/******************************************************************************/
/******************************************************************************/

/******************************************************************************/
/******************************************************************************/
/*************************** Functions Declaration ****************************/
/******************************************************************************/
/******************************************************************************/

/******************************************************************************/
/*! \Description Read the value to a certain micro-controller channel         */
/*! \param[in]   enuChannelId  ID of the channel to read \n
    \Range       0..DIO_CHANNEL_NUMBER \n
    \Unit        N/A                                                          */
/*! \return      Aquired value from the I/O channel                           */
/*! \Trace_To                                                                 */
/******************************************************************************/
extern uint8 DIO_u8ReadChannel(DIO_tenuChannelId enuChannelId);

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
extern void DIO_vidWriteChannel(
                                DIO_tenuChannelId enuChannelId,
                                DIO_tenuChannelLevel enuLevel


		 );

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
                      );



#endif /*DIO_INT_H*/

/** \} */ /* end of DIO module group                                          */
/** \} */ /* end of DIO Component group                                       */
