/******************************************************************************/
/*                                                                            */
/* !Layer           : System Services Layer (SSL)                             */
/*                                                                            */
/* !Component       : SCHED                                                   */
/* !Description     : Scheduler module                                        */
/*                                                                            */
/* !Module          : SCHED                                                   */
/* !Description     : SCHED Module configuration                              */
/*                                                                            */
/* !File            : sched_cfg.h                                             */
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
/* !Designed by     : Ahmed GHASSAN                   !Date : April 29, 2012  */
/* !Coded by        : Ahmed GHASSAN                   !Date : April 29, 2012  */
/*                                                                            */
/* Rev 1.0   April 29, 2012     Initial release                               */
/******************************************************************************/

#include "SCHED_cfg.h"

#include "SSD_int.h"
#include "PBD_int.h"
#include "MODE_int.h"
#include "TIF_int.h"
#include "HIF_int.h"

/******************************************************************************/
/*! \Description                                                              */
/*! \Trace_To                                                                 */
/******************************************************************************/
SCHED_tstrTaskControlBlockConf SCHED_astrTCBConfig[SCHED_TASKS_NUMBER] =
{
    {&SSD_vidTask, 0, 5},
    {&PBD_vidTask, 0, 10},
    {&MODE_vidTask, 0, 10},
    {&HIF_vidTask, 0, 10},
    {&TIF_vidTask, 0, 10}
};
