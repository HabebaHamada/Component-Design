/******************************************************************************/
/*                                                                            */
/* !Layer           : Application Abstraction Layer                           */
/*                                                                            */
/* !Component       : TIF                                                     */
/* !Description     : Turn Indicator Function module                          */
/*                                                                            */
/* !Module          : TIF                                                     */
/* !Description     : TIF Module implementation                               */
/*                                                                            */
/* !File            : tif_prg.c                                               */
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
*   Internals of the module TIF. \n
*   This file contains the internals of the module TIF.                       */
/******************************************************************************/

/******************************************************************************/
/*! \defgroup  TIF Turn Indicator Function (TIF) Component
* Provide the turn indicator functionallity.
* \{                                                                          */

/*! \defgroup TIFINT TIF module
* This is the grouping of TIF module members.
* \{                                                                          */
/******************************************************************************/

#include "TIF_int.h"

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
static TIF_enuMode enuTiMode;
static TIF_enuMode enuTiOldMode;
static uint8 u8TifCounter;
static tenuBlinkState enuTifBlinkState;

/******************************************************************************/
/*********************** Private Functions Declaration ************************/
/******************************************************************************/
static void vidBlinkMode(TIF_enuMode enuBlinkMode);

/******************************************************************************/
/*********************** Public Functions Implementation **********************/
/******************************************************************************/

/******************************************************************************/
/*! \Description                                                              */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
void TIF_vidInit(void)
{
    enuTiMode        = TIF_OFF_MODE;
    enuTiOldMode     = TIF_OFF_MODE;
    u8TifCounter     = BTY_u8ZERO;
    enuTifBlinkState = BLINK_OFF;
}

/******************************************************************************/
/*! \Description                                                              */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
void TIF_vidTask(void)
{
    switch(enuTiMode)
    {
        case TIF_OFF_MODE:
            /*! Check if the previous mode was also off before turning the 
                signs off (in case the HIF is working)                        */
            if(enuTiMode != enuTiOldMode)
            {
                SSD_SetDisplayedNumber(SSD_SEGMENT_LEFT, 18);
                SSD_SetDisplayedNumber(SSD_SEGMENT_RIGHT, 18);
                enuTiOldMode = enuTiMode;
            }
            else
            {
                /* Do nothing */
            }
            break;
            
        case TIF_RIGHT_BLINK_MODE:
            vidBlinkMode(TIF_RIGHT_BLINK_MODE);
            break;
            
        case TIF_LEFT_BLINK_MODE:
            vidBlinkMode(TIF_LEFT_BLINK_MODE);
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
void TIF_vidSetMode(TIF_enuMode enuTifSetMode)
{
    if((enuTifSetMode < TIF_UNDEFINED_MODE) &&
       (enuTifSetMode != enuTiMode))
    {
        enuTiOldMode = enuTiMode;
        u8TifCounter = BTY_u8ZERO;
        enuTifBlinkState = BLINK_OFF;
        enuTiMode    = enuTifSetMode;
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
static void vidBlinkMode(TIF_enuMode enuBlinkMode)
{
    u8TifCounter++;
    
    if(enuTifBlinkState == BLINK_OFF)
    {
        if(u8TifCounter >= TIF_u8BLINK_OFF_THRESHOLD)
        {
            if(enuBlinkMode == TIF_RIGHT_BLINK_MODE)
            {
                SSD_SetDisplayedNumber(SSD_SEGMENT_LEFT, 18);
                SSD_SetDisplayedNumber(SSD_SEGMENT_RIGHT, TIF_u8BLINK_SIGNAL);
            }
            else
            {
                SSD_SetDisplayedNumber(SSD_SEGMENT_LEFT, TIF_u8BLINK_SIGNAL);
                SSD_SetDisplayedNumber(SSD_SEGMENT_RIGHT, 18);
            }
            enuTifBlinkState = BLINK_ON;
            u8TifCounter     = BTY_u8ZERO;
        }
        else
        {
            /* do nothing */
        }
    }
    else
    {
        if(u8TifCounter >= TIF_u8BLINK_OFF_THRESHOLD)
        {
            SSD_SetDisplayedNumber(SSD_SEGMENT_LEFT, 18);
            SSD_SetDisplayedNumber(SSD_SEGMENT_RIGHT, 18);
            enuTifBlinkState = BLINK_OFF;
            u8TifCounter     = BTY_u8ZERO;
        }
        else
        {
            /* do nothing */
        }
    }
}

/* }                                                                          */
/* }                                                                          */
