

void Oven_Main(void)
{
	switch(State)
	{
		case STATE_INACTIVE:
		{
			Btn_GetStateTimer();
			if(TimerBtnPressed == TRUE)
			{
				TimerBtnPressed = FALSE;
				UpdateTime();
				State = STATE_PAUSE;
			}
			else
			{
				/*Timer Button not pressed, Keep the same state*/
			}
		}
		break;
		
		case STATE_ACTIVE:
		{
			
		}
		break;
		
		case STATE_PAUSE:
		{
			
		}
		break;
		default:
		State = STATE_INACTIVE;
	}
}