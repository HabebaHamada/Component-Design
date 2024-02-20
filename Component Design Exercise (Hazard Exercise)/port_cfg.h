/******************************************************************************/
/*                                                                            */
/* !Layer           : Micro-Controller Abstraction Layer (MCAL)               */
/*                                                                            */
/* !Component       : PORT                                                    */
/* !Description     : PORT driver module                                      */
/*                                                                            */
/* !Module          : PORT                                                    */
/* !Description     : PORT Module implementation                              */
/*                                                                            */
/* !File            : port_prg.c                                              */
/*                                                                            */
/* !Scope           : Private                                                 */
/*                                                                            */
/* !Coding language : C                                                       */
/*                                                                            */
/* !Project         : Induction training exercise project                     */
/*                                                                            */
/* !Target          : PIC 16F877A                                             */
/*                                                                            */
/* !Compiler        : SDCC                                                    */
/*                                                                            */
/* !COPYRIGHT 2015 Valeo Egypt                                                */
/*  all rights reserved                                                       */
/*                                                                            */
/******************************************************************************/
/* MODIFICATION LOG :                                                         */
/******************************************************************************/
/*                                                                            */
/* !Designed by     : Ahmed ASSAF                    !Date : JULY 18, 2015    */
/* !Coded by        : Ahmed ASSAF                    !Date : JULY 18, 2015    */
/*                                                                            */
/* Rev 1.0   JULY 18, 2015     Initial release                                */
/******************************************************************************/

#ifndef PORT_CFG_H
#define PORT_CFG_H


/******************************************************************************/
/******************************************************************************/
/****************************** Types Definition ******************************/
/******************************************************************************/
/******************************************************************************/

/*! Description: PORT A Pin Directions */
/*! Range: 1 for input, 0 for output */

#define u8PORTA_DIRECTIONS 0x3f

/*! Description: PORT B Pin Directions */
/*! Range: 1 for input, 0 for output */

#define u8PORTB_DIRECTIONS 0x0f

/*! Description: PORT C Pin Directions */
/*! Range: 1 for input, 0 for output */

#define u8PORTC_DIRECTIONS 0xff

/*! Description: PORT D Pin Directions */
/*! Range: 1 for input, 0 for output */

#define u8PORTD_DIRECTIONS 0

/*! Description: PORT E Pin Directions */
/*! Range: 1 for input, 0 for output */

#define u8PORTE_DIRECTIONS 0x07

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


#endif /* PORT_CFG_H_ */
