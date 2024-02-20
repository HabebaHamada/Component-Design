
#ifndef PBD_TYPES_H
#define PBD_TYPES_H

#include "BTY_int.h"

#include "DIO_int.h"

typedef enum
{
    PBD_BUTTON_STEP_DOWN = 0,
    PBD_BUTTON_STEP_UP,
    PBD_BUTTON_HAZZARD,
    PBD_BUTTONS_NUM
} PBD_tenuButtonId;

typedef enum
{
    PBD_PRE_PUSH = 0,
    PBD_PUSHED,
    PBD_PRE_HOLD,
    PBD_HOLD,
    PBD_PRE_RELEASE,
    PBD_RELEASED,
    PBD_UNDEFINED
} PBD_tenuButtonState;

typedef enum
{
    PBD_PUSH_LEVEL    = 0,
    PBD_RELEASE_LEVEL = 1
} PBD_tenuButtonLevel;

typedef struct
{
    DIO_tenuChannelId enuBtnChannelId;
    uint8 u8DebounceThreshold;
    uint8 u8HoldThreshold;
} PBD_tenuButtonConfig;

#endif /* PBD_TYPES_H */
