#ifndef _MODE_int_h_
#define _MODE_int_h_

#include "tif_int.h"
#include "hif_int.h"
#include "pbd_int.h"

void MODE_vidInit(void);
void MODE_vidTask(void);

typedef enum{
    IDLE = 0,
    RIGHT_BLINK,
    LEFT_BLINK,
    HAZZARD_BLINK
}MODE_enutModeState;

#endif // _MODE_int_h_

