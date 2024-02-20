/******************************************************************************/
/*                                                                            */
/* !Layer           : Hardware Abstraction Layer                              */
/*                                                                            */
/* !Component       : SSD                                                     */
/* !Description     : Seven Segment Driver                                    */
/*                                                                            */
/* !Module          : SSD                                                     */
/* !Description     : SSD Module implementation                               */
/*                                                                            */
/* !File            : ssd_prg.c                                               */
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

#include "BTY_int.h"
#include "SSD_int.h"

/******************************************************************************/
/*! \Description                                                              */
/******************************************************************************/
static uint8 au8SegmentNumber[SSD_SEGMENT_NUMBER];

/******************************************************************************/
/*! \Description                                                              */
/******************************************************************************/
static SSD_tenuSegmentId enuCurrSegment;

/******************************************************************************/
/*! \Description Seven Segment Display Characters table                       */
/******************************************************************************/
#define u8SEG_TABLE_SIZE        19
/* a b c d e f g dp */
const static uint8 ku8CharacterTable[u8SEG_TABLE_SIZE] =
{
    0xFC,       /* 0 = 1111 1100                                              */
    0x60,       /* 1 = 0110 0000                                              */
    0xDA,       /* 2 = 1101 1010                                              */
    0xF2,       /* 3 = 1111 0010                                              */
    0x66,       /* 4 = 0110 0110                                              */
    0xB6,       /* 5 = 1011 0110                                              */
    0xBE,       /* 6 = 1011 1110                                              */
    0xE0,       /* 7 = 1110 0000                                              */
    0x7F,       /* 8 = 1111 1110                                              */
    0xF6,       /* 9 = 1111 0110                                              */
    0xEE,       /* A = 1110 1110                                              */
    0xFF,       /* B = 1111 1111                                              */
    0x9C,       /* C = 1001 1100                                              */
    0xFD,       /* D = 1111 1101                                              */
    0x9E,       /* E = 1001 1110                                              */
    0x8E,       /* F = 1000 1110                                              */
    0xC6,       /* L = 1100 0110                                              */
    0x3A,       /* R = 0011 1010                                              */
    0x00,       /* ''= 0000 0000                                              */
};

/******************************************************************************/
/*! \Description                                                              */
/*! \return                                                                   */
/******************************************************************************/
void SSD_vidInit(void)
{
    uint8 u8Index;

    for(u8Index=0; u8Index<SSD_SEGMENT_NUMBER; u8Index++)
    {
        au8SegmentNumber[u8Index] = ku8CharacterTable[SSD_u8DISPLAY_INIT_ID];
    }

    enuCurrSegment = SSD_SEGMENT_RIGHT;
}

/******************************************************************************/
/*! \Description                                                              */
/*! \return                                                                   */
/******************************************************************************/
void SSD_vidTask(void)
{
    uint8 u8DisplayValue;

    switch(enuCurrSegment)
    {
        case SSD_SEGMENT_RIGHT:
            /*! Disable seven segment 2                                       */
            DIO_vidWriteChannel(SSD_u8SSEG2_EN_CHANNEL, DIO_LEVEL_LOW);
            u8DisplayValue  = au8SegmentNumber[SSD_SEGMENT_RIGHT];

            /*! Output the display value to the seven segments port           */
            DIO_vidWritePort(DIO_PORTD, u8DisplayValue);
            DIO_vidWriteChannel(SSD_u8SSEG1_EN_CHANNEL, DIO_LEVEL_HIGH);
            enuCurrSegment = SSD_SEGMENT_LEFT;
            break;

        case SSD_SEGMENT_LEFT:
            /*! Disable seven segment 1                                       */
            DIO_vidWriteChannel(SSD_u8SSEG1_EN_CHANNEL, DIO_LEVEL_LOW);
            u8DisplayValue  = au8SegmentNumber[SSD_SEGMENT_LEFT];

            /*! Output the display value to the seven segments port           */
            DIO_vidWritePort(DIO_PORTD, u8DisplayValue);
            DIO_vidWriteChannel(SSD_u8SSEG2_EN_CHANNEL, DIO_LEVEL_HIGH);
            enuCurrSegment = SSD_SEGMENT_RIGHT;
            break;

        default:
            enuCurrSegment = SSD_SEGMENT_RIGHT;
            break;
    }
}

/******************************************************************************/
/* @Description :                                                             */
/******************************************************************************/
void SSD_SetDisplayedNumber(SSD_tenuSegmentId enuSegmentId, uint8 u8Number)
{
    if((enuSegmentId<SSD_SEGMENT_NUMBER) && (u8Number<u8SEG_TABLE_SIZE))
    {
        au8SegmentNumber[enuSegmentId] = ku8CharacterTable[u8Number];
    }
    else
    {
        /* Do Nothing */
    }
}
