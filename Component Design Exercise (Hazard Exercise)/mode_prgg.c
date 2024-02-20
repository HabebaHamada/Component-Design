#include"MODE_int.h"

static MODE_enutModeState ModeState;

void MODE_vidInit(void)
{
    ModeState = IDLE;
    HIF_vidSetMode(HIF_UNDEFINED_MODE);
    TIF_vidSetMode(TIF_UNDEFINED_MODE);
    SSD_SetDisplayedNumber(SSD_SEGMENT_RIGHT,18);
    SSD_SetDisplayedNumber(SSD_SEGMENT_LEFT,18);
}

void MODE_vidTask(void)
{
    PBD_tenuButtonId Button_State1 = PBD_enuGetButtonState(PBD_BUTTON_STEP_DOWN);
    PBD_tenuButtonId Button_State2 = PBD_enuGetButtonState(PBD_BUTTON_STEP_UP);
    PBD_tenuButtonId Button_State3 = PBD_enuGetButtonState(PBD_BUTTON_HAZZARD);
    static MODE_enutModeState PreviousState;
    switch(ModeState)
    {
    case IDLE:

        if(Button_State1 == PBD_PUSHED)
        {
           ModeState = LEFT_BLINK;
        }
        else if(Button_State2 == PBD_PUSHED)
        {
            ModeState = RIGHT_BLINK;
        }
        else if(Button_State3 == PBD_HOLD)
        {
            PreviousState = IDLE;
            ModeState = HAZZARD_BLINK;
        }
        HIF_vidSetMode(HIF_OFF_MODE);
        TIF_vidSetMode(TIF_OFF_MODE);

        break;
    case LEFT_BLINK:
        if(Button_State1 == PBD_PUSHED)
        {
           ModeState = LEFT_BLINK;
        }
        else if(Button_State2 == PBD_PUSHED)
        {
            ModeState = IDLE;
        }
        else if(Button_State3 == PBD_HOLD)
        {
            PreviousState = LEFT_BLINK;
            ModeState = HAZZARD_BLINK;
        }
        HIF_vidSetMode(HIF_OFF_MODE);
        TIF_vidSetMode(TIF_LEFT_BLINK_MODE);

        break;
    case RIGHT_BLINK:
        if(Button_State1 == PBD_PUSHED)
        {
           ModeState = IDLE;
        }
        else if(Button_State2 == PBD_PUSHED)
        {
            ModeState = RIGHT_BLINK;
        }
        else if(Button_State3 == PBD_HOLD)
        {
            PreviousState = RIGHT_BLINK;
            ModeState = HAZZARD_BLINK;
        }
         HIF_vidSetMode(HIF_OFF_MODE);
         TIF_vidSetMode(TIF_RIGHT_BLINK_MODE);

        break;
    case HAZZARD_BLINK:
        if(Button_State1 == PBD_PUSHED)
        {
             ModeState = HAZZARD_BLINK;
        }
        else if(Button_State2 == PBD_PUSHED)
        {
            ModeState = HAZZARD_BLINK;
        }
        else if(Button_State3 == PBD_HOLD)
        {
            ModeState = PreviousState;
        }
        HIF_vidSetMode(HIF_ON_MODE);
        TIF_vidSetMode(TIF_OFF_MODE);
        break;
    }
}

