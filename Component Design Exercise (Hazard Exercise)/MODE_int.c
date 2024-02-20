/******************************************************************************/
/*                                                                            */
/* !Coded by        : Mina Karam                      !Date : Thu 10, 2022    */
/*                                                                            */
/******************************************************************************/

#include "MODE_int.h"

static MODE_enutModeState ModeState;

/******************************************************************************/
/*********************** Public Functions Implementation **********************/
/******************************************************************************/

/******************************************************************************/
/*! \Description Initialize the Mode Component                                */
/*! \Sync/As      None                                                        */
/*! \return      None                                                         */
/*! \return      None                                                         */
/*! \Trace_To                                                                 */
/******************************************************************************/
void MODE_vidInit(void)
{
    /*Upon Startup, this service put the system in IDLE State*/
    ModeState = IDLE;

    /*Upon Startup, both LEFT and RIGHT SSDs should be switched off*/
    /*Upon Startup, HIF and TIF modes should be undefined*/
    HIF_vidSetMode(HIF_UNDEFINED_MODE);
    TIF_vidSetMode(TIF_UNDEFINED_MODE);
}

void MODE_vidTask(void)
{
    /*Shall grab the state if different push buttons and switch between states */
    PBD_tenuButtonId ButtonStateDown = PBD_enuGetButtonState(PBD_BUTTON_STEP_DOWN);
    PBD_tenuButtonId ButtonStateUP = PBD_enuGetButtonState(PBD_BUTTON_STEP_UP);
    PBD_tenuButtonId ButtonStateHazzard = PBD_enuGetButtonState(PBD_BUTTON_HAZZARD);

    static MODE_enutModeState PreviousState; /* Save Last State if Hazzard Checked*/

    switch(ModeState)
    {
        case IDLE:
            if(ButtonStateDown == PBD_PUSHED)
            {
                ModeState = LEFT_BLINK;
            }
            else if(ButtonStateUP == PBD_PUSHED)
            {
                ModeState = RIGHT_BLINK;
            }
            else if(ButtonStateHazzard == PBD_PUSHED)
            {
                PreviousState = IDLE;
                ModeState = HAZZARD_BLINK;
            }
            else
            {
                /*Do Nothing*/
            }
            HIF_vidSetMode(HIF_OFF_MODE);
            TIF_vidSetMode(TIF_OFF_MODE);

            break;

        case LEFT_BLINK:
            if(ButtonStateUP == PBD_PUSHED)
            {
                ModeState = IDLE;
            }
            else if(ButtonStateDown == PBD_PUSHED)
            {
                ModeState = LEFT_BLINK;
            }
            else if(ButtonStateHazzard == PBD_PUSHED)
            {
                PreviousState = LEFT_BLINK;
                ModeState = HAZZARD_BLINK;
            }
            else
            {
                /*Do Nothing*/
            }
            HIF_vidSetMode(HIF_OFF_MODE);
            TIF_vidSetMode(TIF_LEFT_BLINK_MODE);

            break;
        case RIGHT_BLINK:
            if(ButtonStateUP == PBD_PUSHED)
            {
                ModeState = RIGHT_BLINK;
            }
            else if(ButtonStateDown == PBD_PUSHED)
            {
                ModeState = IDLE;
            }
            else if(ButtonStateHazzard == PBD_PUSHED)
            {
                PreviousState = RIGHT_BLINK;
                ModeState = HAZZARD_BLINK;
            }
            else
            {
                /*Do Nothing*/
            }
            HIF_vidSetMode(HIF_OFF_MODE);
            TIF_vidSetMode(TIF_RIGHT_BLINK_MODE);

            break;
        case HAZZARD_BLINK:
            if(ButtonStateUP == PBD_PUSHED)
            {
                ModeState = HAZZARD_BLINK;
            }
            else if(ButtonStateDown == PBD_PUSHED)
            {
                ModeState = HAZZARD_BLINK;
            }
            else if(ButtonStateHazzard == PBD_PUSHED)
            {
                ModeState = PreviousState;
            }
            else
            {
                /*Do Nothing*/
            }
            HIF_vidSetMode(HIF_ON_MODE);
            TIF_vidSetMode(TIF_OFF_MODE);

            break;
    }
}
