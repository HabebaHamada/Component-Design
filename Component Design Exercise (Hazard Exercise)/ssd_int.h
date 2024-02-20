/******************************************************************************/
/*                                                                            */
/* !Layer           : HArdware Abstraction Layer (HAL)                        */
/*                                                                            */
/* !Component       : SSD                                                     */
/* !Description     : Seven Segment Display Driver                            */
/*                                                                            */
/* !Module          : SSD                                                     */
/* !Description     : SSD Module interface                                    */
/*                                                                            */
/* !File            : ssd_int.h                                               */
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

#ifndef SEG_H_
#define SEG_H_

#include "BTY_int.h"

#include "DIO_int.h"

typedef enum
{
    SSD_SEGMENT_RIGHT,
    SSD_SEGMENT_LEFT,
    SSD_SEGMENT_NUMBER
} SSD_tenuSegmentId;

#define SSD_u8SSEG1_EN_CHANNEL      DIO_PORTB_CHANNEL_4
#define SSD_u8SSEG2_EN_CHANNEL      DIO_PORTB_CHANNEL_5

#define SSD_u8DISPLAY_INIT_ID   18

/******************************************************************************/
/*! Description :                                                             */
/******************************************************************************/
extern void SSD_vidInit(void);
extern void SSD_vidTask(void);

/******************************************************************************/
/*! Description :                                                             */
/******************************************************************************/
void SSD_SetDisplayedNumber (SSD_tenuSegmentId enuSegmentId, uint8 u8Number);

#endif/* SEG_H_ */
