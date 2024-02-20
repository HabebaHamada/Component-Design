/******************************************************************************/
/*                                                                            */
/* !Layer           : System Services Layer (SSL)                             */
/*                                                                            */
/* !Component       : SCHED                                                   */
/* !Description     : Scheduler module                                        */
/*                                                                            */
/* !Module          : SCHED                                                   */
/* !Description     : SCHED Module implementation                             */
/*                                                                            */
/* !File            : sched_prg.c                                             */
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

#include "SCHED_int.h"
#include "SCHED_cfg.h"

/*! Include Metrowerks Star08 microcontroller header file                     */
/*! \Trace_To                                                                 */
#include "MCU_int.h"

static uint8 u8TickCounter;

static SCHED_tstrTaskControlBlock astrTCB[SCHED_TASKS_NUMBER];

static void vidManageTemporalTasks(void);

void SCHED_vidInit(void)
{
    uint8 u8Index;
    
    /*! initialize the scheduler variables                                    */
    for(u8Index=0; u8Index<SCHED_TASKS_NUMBER; u8Index++)
    {
        astrTCB[u8Index].u8TaskCounter = 
                                       SCHED_astrTCBConfig[u8Index].u8TaskDelay;
        
        astrTCB[u8Index].enuTaskStatus = SCHED_TASK_ACTIVE;
    }
}

/******************************************************************************/
/*! \Description                                                              */
/*! \Trace_To                                                                 */
/******************************************************************************/
void SCHED_vidStartScheduler(void)
{
    for(;;)
    {
        if(u8TickCounter > BTY_u8ZERO)
        {
            /*! Acknowledge the system tick by decrementing the counter       */
            u8TickCounter--;
            
            vidManageTemporalTasks();
        }
        else
        {
            /* Do nothing */
        }
    }
}

static void vidManageTemporalTasks(void)
{
    uint8 u8Index;
    
    for(u8Index=0; u8Index<SCHED_TASKS_NUMBER; u8Index++)
    {
        if(astrTCB[u8Index].enuTaskStatus == SCHED_TASK_ACTIVE)
        {
            if(astrTCB[u8Index].u8TaskCounter > BTY_u8ZERO)
            {
                astrTCB[u8Index].u8TaskCounter--;
            }
            else
            {
                astrTCB[u8Index].u8TaskCounter = 
                                      SCHED_astrTCBConfig[u8Index].u8TaskPeriod;
                
                (*SCHED_astrTCBConfig[u8Index].pfTask)();
            }
        }
        else
        {
            /* Do nothing */
        }
    }
}
/******************************************************************************/
/*! \Description RTC interrupt which increments a counter every system tick   */
/*! \Trace_To                                                                 */
/******************************************************************************/
void SCHED_vidRtcInterrupt(void)
{
    u8TickCounter++;
    
    /*! If we reached the maximum count, this means that a task is taking more
        than the expected                                                     */
    if(u8TickCounter == SCHED_u8MAX_TASK_DURATION)
    {
        /*! Hang the CPU waiting for a watchdog reset                         */
        for(;;)
        {}
    }
}
