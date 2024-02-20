/******************************************************************************/
/*                                                                            */
/* !Layer           : Hardware Abstraction Layer (HAL)                        */
/*                                                                            */
/* !Component       : PBD                                                     */
/* !Description     : Push button driver module                               */
/*                                                                            */
/* !Module          : PBD                                                     */
/* !Description     : PBD Module internals                                    */
/*                                                                            */
/* !File            : pbd_prg.c                                               */
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
*   Internals of the module PBD. \n
*   This file contains the internals of the module PBD.                       */
/******************************************************************************/

/******************************************************************************/
/*! \defgroup  PBD Push Buttons Driver (PBD) Component
* Abstract interaction with push-buttons.
* \{                                                                          */

/*! \defgroup PBDPRIV PBD module
* This is the grouping of PBD module members.
* \{                                                                          */
/******************************************************************************/

#include "PBD_int.h"
#include "PBD_cfg.h"

#include "DIO_int.h"

/******************************************************************************/
/******************************* Private Types ********************************/
/******************************************************************************/
typedef struct
{
    PBD_tenuButtonState enuBtnState;
    uint8 u8DebounceCntr;
    uint8 u8HoldCntr;
} tstrBtnState;

/******************************************************************************/
/************************** Private Global Variables **************************/
/******************************************************************************/
static tstrBtnState strBtnInfo[PBD_BUTTONS_NUM];

/******************************************************************************/
/*********************** Private Functions Declaration ************************/
/******************************************************************************/
static void vidUpdateBtnState(PBD_tenuButtonId enuBtnId);
static void vidPrePushState(PBD_tenuButtonId enuBtnId);
static void vidPushState(PBD_tenuButtonId enuBtnId);
static void vidPreHoldState(PBD_tenuButtonId enuBtnId);
static void vidHoldState(PBD_tenuButtonId enuBtnId);
static void vidPreReleaseState(PBD_tenuButtonId enuBtnId);
static void vidReleaseState(PBD_tenuButtonId enuBtnId);

/******************************************************************************/
/*********************** Public Functions Implementation **********************/
/******************************************************************************/

/******************************************************************************/
/*! \Description Initialize the PBD driver variables                          */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
void PBD_vidInit(void)
{
    uint8 u8Index;
    
    for(u8Index=0;u8Index<PBD_BUTTONS_NUM;u8Index++)
    {
        strBtnInfo[u8Index].enuBtnState     = PBD_RELEASED;
        strBtnInfo[u8Index].u8DebounceCntr  = BTY_u8ZERO;
        strBtnInfo[u8Index].u8HoldCntr      = BTY_u8ZERO;
    }
}

/******************************************************************************/
/*! \Description The PBD driver task, should be called periodically with a 10ms
                 period. This service update the state of all configured push
                 buttons.                                                     */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
void PBD_vidTask(void)
{
    /*! Define a variable to be used as an index                              */
    uint8 u8Index;
    
    /*! Iterate over all defined push buttons                                 */
    for(u8Index=0;u8Index<PBD_BUTTONS_NUM; u8Index++)
    {
        vidUpdateBtnState((PBD_tenuButtonId)u8Index);
    }
}

/******************************************************************************/
/*! \Description The PBD driver task, should be called periodically with a 10ms
                 period. This service update the state of all configured push
                 buttons.                                                     */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
PBD_tenuButtonState PBD_enuGetButtonState(PBD_tenuButtonId enuButtonId)
{
    PBD_tenuButtonState enuReturn;
    
    if(enuButtonId < PBD_BUTTONS_NUM)
    {
        enuReturn = strBtnInfo[enuButtonId].enuBtnState;
    }
    else
    {
        enuReturn = PBD_UNDEFINED;
    }
    
    return (enuReturn);
}

/******************************************************************************/
/********************** Private Functions Implementation **********************/
/******************************************************************************/

/******************************************************************************/
/*! \Description The PBD driver task, should be called periodically with a 10ms
                 period. This service update the state of all configured push
                 buttons.                                                     */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
/*! \Deviation MISRA-C:2004 Rule 21.1; REFERENCE - ISO:C90-6.3.6 Additive
    Operators, Semantics, Msg(7:3689) [U] Apparent access outside bounds of
    array: The following functions are private and the bounds are protected by
    the calling function, no need for more checks.                            */
/* PRQA S 3689 ++                                                             */
static void  vidUpdateBtnState(PBD_tenuButtonId enuBtnId)
{
    switch(strBtnInfo[enuBtnId].enuBtnState)
    {
        case PBD_PRE_PUSH:
            vidPrePushState(enuBtnId);
            break;
        
        case PBD_PUSHED:
            vidPushState(enuBtnId);
            break;
        
        case PBD_PRE_HOLD:
            vidPreHoldState(enuBtnId);
            break;
        
        case PBD_HOLD:
            vidHoldState(enuBtnId);
            break;
        
        case PBD_PRE_RELEASE:
            vidPreReleaseState(enuBtnId);
            break;
        
        case PBD_RELEASED:
            vidReleaseState(enuBtnId);
            break;
        
        default:
            break;
    }
}


/******************************************************************************/
/*! \Description        .                                                     */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
static void vidPrePushState(PBD_tenuButtonId enuBtnId)
{
    uint8 u8BtnValue;
    
    u8BtnValue = DIO_u8ReadChannel(PBD_enuBtnConfig[enuBtnId].enuBtnChannelId);
    
    if(u8BtnValue == PBD_RELEASE_LEVEL)
    {
        strBtnInfo[enuBtnId].u8DebounceCntr = BTY_u8ZERO;
        strBtnInfo[enuBtnId].enuBtnState    = PBD_PRE_RELEASE;
    }
    else
    {
        strBtnInfo[enuBtnId].u8DebounceCntr++;
        
        if(strBtnInfo[enuBtnId].u8DebounceCntr == 
                                 PBD_enuBtnConfig[enuBtnId].u8DebounceThreshold)
        {
            strBtnInfo[enuBtnId].enuBtnState    = PBD_PUSHED;
        }
        else
        {
            /* Do Nothing */
        }
    }
}

/******************************************************************************/
/*! \Description        .                                                     */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
static void vidPushState(PBD_tenuButtonId enuBtnId)
{
    uint8 u8BtnValue;
    
    u8BtnValue = DIO_u8ReadChannel(PBD_enuBtnConfig[enuBtnId].enuBtnChannelId);
    
    if(u8BtnValue == PBD_RELEASE_LEVEL)
    {
        strBtnInfo[enuBtnId].u8DebounceCntr = BTY_u8ZERO;
        strBtnInfo[enuBtnId].enuBtnState    = PBD_PRE_RELEASE;
    }
    else
    {
        strBtnInfo[enuBtnId].u8HoldCntr  = BTY_u8ZERO;
        strBtnInfo[enuBtnId].enuBtnState = PBD_PRE_HOLD;
    }
}

/******************************************************************************/
/*! \Description        .                                                     */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
static void vidPreHoldState(PBD_tenuButtonId enuBtnId)
{
    uint8 u8BtnValue;
    
    u8BtnValue = DIO_u8ReadChannel(PBD_enuBtnConfig[enuBtnId].enuBtnChannelId);
    
    if(u8BtnValue == PBD_RELEASE_LEVEL)
    {
        strBtnInfo[enuBtnId].u8DebounceCntr = BTY_u8ZERO;
        strBtnInfo[enuBtnId].enuBtnState    = PBD_PRE_RELEASE;
    }
    else
    {
        strBtnInfo[enuBtnId].u8HoldCntr++;
        if(strBtnInfo[enuBtnId].u8HoldCntr >= 
                                     PBD_enuBtnConfig[enuBtnId].u8HoldThreshold)
        {
            strBtnInfo[enuBtnId].enuBtnState = PBD_HOLD;
        }
        else
        {
            /* Do Nothing */
        }
    }
}

/******************************************************************************/
/*! \Description        .                                                     */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
static void vidHoldState(PBD_tenuButtonId enuBtnId)
{
    uint8 u8BtnValue;
    
    u8BtnValue = DIO_u8ReadChannel(PBD_enuBtnConfig[enuBtnId].enuBtnChannelId);
    
    if(u8BtnValue == PBD_RELEASE_LEVEL)
    {
        strBtnInfo[enuBtnId].u8DebounceCntr = BTY_u8ZERO;
        strBtnInfo[enuBtnId].enuBtnState    = PBD_PRE_RELEASE;
    }
    else
    {
        /* Do Nothing */
    }
}

/******************************************************************************/
/*! \Description        .                                                     */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
static void vidPreReleaseState(PBD_tenuButtonId enuBtnId)
{
    uint8 u8BtnValue;
    
    u8BtnValue = DIO_u8ReadChannel(PBD_enuBtnConfig[enuBtnId].enuBtnChannelId);
    
    if(u8BtnValue == PBD_RELEASE_LEVEL)
    {
        strBtnInfo[enuBtnId].u8DebounceCntr++;
        
        if(strBtnInfo[enuBtnId].u8DebounceCntr ==
                                 PBD_enuBtnConfig[enuBtnId].u8DebounceThreshold)
        {
            strBtnInfo[enuBtnId].enuBtnState = PBD_RELEASED;
        }
        else
        {
            /* Do Nothing */
        }
    }
    else
    {
        strBtnInfo[enuBtnId].u8DebounceCntr = BTY_u8ZERO;
        strBtnInfo[enuBtnId].enuBtnState    = PBD_PRE_PUSH;
    }
}

/******************************************************************************/
/*! \Description        .                                                     */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
static void vidReleaseState(PBD_tenuButtonId enuBtnId)
{
    uint8 u8BtnValue;
    
    u8BtnValue = DIO_u8ReadChannel(PBD_enuBtnConfig[enuBtnId].enuBtnChannelId);
    
    if(u8BtnValue == PBD_PUSH_LEVEL)
    {
        strBtnInfo[enuBtnId].u8DebounceCntr = BTY_u8ZERO;
        strBtnInfo[enuBtnId].enuBtnState    = PBD_PRE_PUSH;
    }
    else
    {
        /* Do nothing */
    }
}

/* }                                                                          */
/* }                                                                          */
