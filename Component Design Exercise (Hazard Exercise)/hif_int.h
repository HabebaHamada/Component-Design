/******************************************************************************/
/*                                                                            */
/* !Layer           : Application Abstraction Layer                           */
/*                                                                            */
/* !Component       : HIF                                                     */
/* !Description     : Hazzard Indicator Function module                       */
/*                                                                            */
/* !Module          : HIF                                                     */
/* !Description     : HIF Module interface                                    */
/*                                                                            */
/* !File            : hif_int.h                                               */
/*                                                                            */
/* !Scope           : Private                                                 */
/*                                                                            */
/* !Coding language : C                                                       */
/*                                                                            */
/* !Project         : Induction training exercise project                     */
/*                                                                            */
/* !Target          : Motorola MC9S08                                         */
/*                                                                            */
/* !Compiler        : CodeWarrior V3.6                                        */
/*                                                                            */
/* !COPYRIGHT 2012 Valeo Egypt                                                */
/*  all rights reserved                                                       */
/*                                                                            */
/******************************************************************************/
/* MODIFICATION LOG :                                                         */
/******************************************************************************/
/*                                                                            */
/* !Designed by     : Ahmed GHASSAN                   !Date : April 27, 2012  */
/* !Coded by        : Ahmed GHASSAN                   !Date : April 27, 2012  */
/*                                                                            */
/* Rev 1.0   April 27, 2012     Initial release                               */
/******************************************************************************/

/******************************************************************************/
/*! \par
*   Externals of the module HIF. \n
*   This file contains the externals of the module HIF.                       */
/******************************************************************************/

/******************************************************************************/
/*! \defgroup  HIF Hazzard Indicator Function (HIF) Component
* Provide the hazard indicator functionallity.
* \{                                                                          */

/*! \defgroup DIOINT HIF module
* This is the grouping of HIF module members.
* \{                                                                          */
/******************************************************************************/

#ifndef HIF_INT_H
#define HIF_INT_H

/*! Include basic types header                                                */
/*! \Trace_To                                                                 */
#include "BTY_int.h"

/******************************************************************************/
/******************************************************************************/
/****************************** Types Definition ******************************/
/******************************************************************************/
/******************************************************************************/

typedef enum
{
    HIF_OFF_MODE = 0,
    HIF_ON_MODE,
    HIF_UNDEFINED_MODE
} HIF_tenuMode;

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

#define HIF_u8BLINK_ON_THRESHOLD    20
#define HIF_u8BLINK_OFF_THRESHOLD   40

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
/*! \Description                                                              */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
extern void HIF_vidInit(void);

/******************************************************************************/
/*! \Description                                                              */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
extern void HIF_vidTask(void);

/******************************************************************************/
/*! \Description                                                              */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
extern void HIF_vidSetMode(HIF_tenuMode enuHifSetMode);

#endif /* HIF_INT_H */

/* }                                                                          */
/* }                                                                          */
