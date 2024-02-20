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
/* !File            : pbd_cfg.h                                               */
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
*   This file contains the external configurations of the module PBD.         */
/******************************************************************************/

/******************************************************************************/
/*! \defgroup  PBD Push Buttons Driver (PBD) Component
* Abstract interaction with push-buttons.
* \{                                                                          */

/*! \defgroup PBDCFG PBD configuration module
* This is the grouping of PBD configuration module members.
* \{                                                                          */
/******************************************************************************/

#ifndef PBD_CFG_H
#define PBD_CFG_H

#include "pbd_types.h"

#define PBD_u8HOLD_THRESHOLD    20

extern const DIO_tenuChannelId PBD_enuBtnChannelId[PBD_BUTTONS_NUM];
extern const PBD_tenuButtonConfig PBD_enuBtnConfig[PBD_BUTTONS_NUM];
#endif /* PBD_CFG_H */

/* }                                                                          */
/* }                                                                          */
