/******************************************************************************/
/*                                                                            */
/* !Layer           : Hardware Abstraction Layer (HAL)                        */
/*                                                                            */
/* !Component       : PBD                                                     */
/* !Description     : Push button driver module                               */
/*                                                                            */
/* !Module          : PBD                                                     */
/* !Description     : PBD Module configuration                                */
/*                                                                            */
/* !File            : pbd_cfg.c                                               */
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

/******************************************************************************/
/*! \par
*   Configuration of the module PBD. \n
*   This file contains the internal configurations of the module PBD.         */
/******************************************************************************/

/******************************************************************************/
/*! \defgroup  PBD Push Buttons Driver (PBD) Component
* Abstract interaction with push-buttons.
* \{                                                                          */

/*! \defgroup PBDCFG PBD configuration module
* This is the grouping of PBD configuration module members.
* \{                                                                          */
/******************************************************************************/

#include "PBD_cfg.h"

const PBD_tenuButtonConfig PBD_enuBtnConfig[PBD_BUTTONS_NUM] = 
{
    /* Debounce and Hold thresholds are in units of 10ms                      */
    /* Button channel ID, Debounce threshold , Hold threshold                 */
    {DIO_PORTB_CHANNEL_1, 1, 10},       /* PBD_BUTTON_STEP_DOWN               */
    {DIO_PORTB_CHANNEL_2, 1, 10},       /* PBD_BUTTON_STEP_UP                 */
    {DIO_PORTB_CHANNEL_3, 1, 20},       /* PBD_BUTTON_HAZZARD                 */
};

/* }                                                                          */
/* }                                                                          */
