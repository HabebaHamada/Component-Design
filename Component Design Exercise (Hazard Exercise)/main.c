/******************************************************************************/
/*                                                                            */
/* !Layer           : Application Layer                                       */
/*                                                                            */
/* !Component       : main                                                    */
/* !Description     : Application Entry Point                                 */
/*                                                                            */
/* !Module          : main                                                    */
/* !Description     : Main Module implementation                              */
/*                                                                            */
/* !File            : mian.c                                                  */
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

/*! Include compiler types header                                             */

#include "PORT_int.h"
#include "DIO_int.h"
#include "MCU_int.h"

#include "SSD_int.h"
#include "PBD_int.h"

#include "TIF_int.h"
#include "HIF_int.h"
#include "MODE_int.h"

#include "SCHED_int.h"

static void vidInit(void);

/* ! \Deviation Msg(6:0601) MISRA-C:2004 Rule 1.1; REFERENCE - ISO:C90-5.1.2.2
                Hosted environment[E] Function 'main()' is not of type
                'int (void)' or 'int (int, char *[])':                        */
/* PRQA S 0601 ++                                                             */
void main(void)
{
    /*! Initialize the software                                               */
    vidInit();

    /*! Start the scheduler                                                   */
    SCHED_vidStartScheduler();
}

static void vidInit(void)
{

    /*! Initialize MCAL layer                                                 */
    PORT_vidInit();
    MCU_vidInit();
    /*! Initialize HAL layer                                                  */
    SSD_vidInit();
    PBD_vidInit();
    /*! Initialize APP layer                                                  */
    MODE_vidInit();

    /*! Initialize the scheduler                                              */
    SCHED_vidInit();
}
