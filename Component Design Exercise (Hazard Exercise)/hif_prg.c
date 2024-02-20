/******************************************************************************/
/*                                                                            */
/* !Layer           : Application Abstraction Layer                           */
/*                                                                            */
/* !Component       : HIF                                                     */
/* !Description     : Hazzard Indicator Function module                       */
/*                                                                            */
/* !Module          : HIF                                                     */
/* !Description     : HIF Module implementation                               */
/*                                                                            */
/* !File            : hif_prg.c                                               */
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
*   Internals of the module HIF. \n
*   This file contains the internals of the module HIF.                       */
/******************************************************************************/

/******************************************************************************/
/*! \defgroup  HIF Hazzard Indicator Function (HIF) Component
* Provide the hazard indicator functionallity.
* \{                                                                          */

/*! \defgroup HIFINT HIF module
* This is the grouping of HIF module members.
* \{                                                                          */
/******************************************************************************/

/*! Include the module interface header                                       */
/*! \Trace_To                                                                 */
#include "HIF_int.h"

/*! Include the SSD module interface header                                   */
/*! \Trace_To                                                                 */
#include "SSD_int.h"

/******************************************************************************/
/******************************* Private Types ********************************/
/******************************************************************************/
typedef enum
{
    BLINK_OFF = 0,
    BLINK_ON
} tenuBlinkState;

/******************************************************************************/
/************************** Private Global Variables **************************/
/******************************************************************************/
static HIF_tenuMode enuHifMode;
static HIF_tenuMode enuHifOldMode;
static uint8 u8HifCounter;
static tenuBlinkState enuHifBlinkState;

/******************************************************************************/
/*********************** Private Functions Declaration ************************/
/******************************************************************************/
static void vidHazzardBlink(void);

/******************************************************************************/
/*********************** Public Functions Implementation **********************/
/******************************************************************************/

/******************************************************************************/
/*! \Description                                                              */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
void HIF_vidInit(void)
{
    enuHifMode       = HIF_OFF_MODE;
    enuHifOldMode    = HIF_OFF_MODE;
    u8HifCounter     = BTY_u8ZERO;
    enuHifBlinkState = BLINK_OFF;
}

/******************************************************************************/
/*! \Description                                                              */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
void HIF_vidTask(void)
{
    switch(enuHifMode)
    {
        case HIF_OFF_MODE:
            if(enuHifMode != enuHifOldMode)
            {
                SSD_SetDisplayedNumber(SSD_SEGMENT_LEFT, 18);
                SSD_SetDisplayedNumber(SSD_SEGMENT_RIGHT, 18);
                enuHifOldMode = enuHifMode;
            }
            else
            {
                /* Do nothing */
            }
            break;
        
        case HIF_ON_MODE:
            vidHazzardBlink();
            break;
        
        default:
            break;
    }
}

/******************************************************************************/
/*! \Description                                                              */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
void HIF_vidSetMode(HIF_tenuMode enuHifSetMode)
{
    if((enuHifSetMode < HIF_UNDEFINED_MODE) &&
       (enuHifSetMode != enuHifMode))
    {
        enuHifOldMode = enuHifMode;
        u8HifCounter  = BTY_u8ZERO;
        enuHifBlinkState = BLINK_OFF;
        enuHifMode    = enuHifSetMode;
    }
    else
    {
        /* do nothing */
    }
}

/******************************************************************************/
/********************** Private Functions Implementation **********************/
/******************************************************************************/

/******************************************************************************/
/*! \Description                                                              */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
static void vidHazzardBlink(void)
{
    u8HifCounter++;
    
    if(enuHifBlinkState == BLINK_OFF)
    {
        if(u8HifCounter >= HIF_u8BLINK_OFF_THRESHOLD)
        {
            SSD_SetDisplayedNumber(SSD_SEGMENT_LEFT, 0x08);
            SSD_SetDisplayedNumber(SSD_SEGMENT_RIGHT, 0x08);
            enuHifBlinkState = BLINK_ON;
            u8HifCounter     = BTY_u8ZERO;
        }
        else
        {
        }
    }
    else
    {
        if(u8HifCounter >= HIF_u8BLINK_ON_THRESHOLD)
        {
            SSD_SetDisplayedNumber(SSD_SEGMENT_LEFT, 18);
            SSD_SetDisplayedNumber(SSD_SEGMENT_RIGHT, 18);
            enuHifBlinkState = BLINK_OFF;
            u8HifCounter     = BTY_u8ZERO;
        }
        else
        {
        }
    }
}

/* }                                                                          */
/* }                                                                          */
