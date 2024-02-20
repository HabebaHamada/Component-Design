/******************************************************************************/
/*                                                                            */
/* !Layer           : Micro-Controller Abstraction Layer (MCAL)               */
/*                                                                            */
/* !Component       : MCU                                                     */
/* !Description     : Micro-controller driver module                          */
/*                                                                            */
/* !Module          : MCU                                                     */
/* !Description     : MCU Module implementation                               */
/*                                                                            */
/* !File            : mcu_prg.c                                               */
/*                                                                            */
/* !Scope           : Private                                                 */
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

/*! Include the module interface header                                       */
/*! \Trace_To                                                                 */
#include "MCU_int.h"

/*! Include microcontroller register file                                     */
/*! \Trace_To  															      */
#include "pic16f877a.h"

/*! Include the timer module interface header                                 */
/*! \Trace_To                                                                 */
#include "SCHED_int.h"


/******************************************************************************/
/*! \Description                                                              */
/*! \Trace_To                                                                 */
/******************************************************************************/
void MCU_vidInit(void)
{
  /* Inialize clock system = 4 MHz */
  static __code unsigned int __at (_CONFIG) configword = _CP_OFF &
   _WDT_OFF &
   _BODEN_OFF &
   _PWRTE_OFF &
   _HS_OSC &
   _LVP_OFF;


  /* clock source is instruction clock */
  T0CS = 0;

  /* Prescaler is assigned to timer 0 */
  PSA = 0;

  /* Prescaler is 1:8 */
  PS0 = 0;
  PS1 = 1;
  PS2 = 0;

  /* Enable interrupt */
  GIE =1;
  PEIE =1;
  TMR0IE = 1;
  TMR0IF = 0;


}

/******************************************************************************/
/*** Private functions definition *********************************************/
/******************************************************************************/

void myIntr(void) __interrupt 0
{
  /* Disable Globla interrupt to avoid nested interrupt */
  GIE =0;
  
  /* Clear Timer 0 Flag */
  TMR0IF =0;

  /* Call the scheduler */
  SCHED_vidRtcInterrupt();
  
  /* Enable global interrupt */
  GIE = 1;
}
