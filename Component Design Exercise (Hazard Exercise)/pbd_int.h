/******************************************************************************/
/*                                                                            */
/* !Layer           : Hardware Abstraction Layer (HAL)                        */
/*                                                                            */
/* !Component       : PBD                                                     */
/* !Description     : Push button driver module                               */
/*                                                                            */
/* !Module          : PBD                                                     */
/* !Description     : PBD Module interface                                    */
/*                                                                            */
/* !File            : pbd_int.h                                               */
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
*   Externals of the module PBD. \n
*   This file contains the externals of the module PBD.                       */
/******************************************************************************/

/******************************************************************************/
/*! \defgroup  PBD Push Buttons Driver (PBD) Component
* Abstract interaction with push-buttons.
* \{                                                                          */

/*! \defgroup PBDPRIV PBD module
* This is the grouping of PBD module members.
* \{                                                                          */
/******************************************************************************/

#ifndef PBD_INT_H
#define PBD_INT_H

#include "pbd_types.h"

/******************************************************************************/
/*! \Description Initialize the PBD driver variables                          */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
extern void PBD_vidInit(void);

/******************************************************************************/
/*! \Description The PBD driver task, should be called periodically with a 10ms
                 period. This service update the state of all configured push
                 buttons.                                                     */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
extern void PBD_vidTask(void);

/******************************************************************************/
/*! \Description The PBD driver task, should be called periodically with a 10ms
                 period. This service update the state of all configured push
                 buttons.                                                     */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
extern PBD_tenuButtonState PBD_enuGetButtonState(PBD_tenuButtonId enuButtonId);

#endif /* PBD_INT_H */

/* }                                                                          */
/* }                                                                          */
