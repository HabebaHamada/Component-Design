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

/*! Include the module interface header                                       */
/*! \Trace_To                                                                 */
#include "PORT_int.h"

/*! Include the module configuration header                                   */
/*! \Trace_To                                                                 */
#include "PORT_cfg.h"

/*! Include microcontroller register file                                     */
/*! \Trace_To                                                                 */
#include "pic16f877a.h"

/******************************************************************************/
/*! \Description                                                              */
/*! \return                                                                   */
/*! \Trace_To                                                                 */
/******************************************************************************/
void PORT_vidInit(void)
{
  TRISA = u8PORTA_DIRECTIONS;
  
  TRISB = u8PORTB_DIRECTIONS;
   
  TRISC = u8PORTC_DIRECTIONS;
 
  TRISD = u8PORTD_DIRECTIONS;
	 
  TRISE = u8PORTE_DIRECTIONS;
}
