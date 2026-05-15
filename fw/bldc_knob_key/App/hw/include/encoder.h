#ifndef HW_ENCODER_H_
#define HW_ENCODER_H_

#include "hw_def.h"

#ifdef _USE_HW_ENCODER

bool     encoderInit(void);
int32_t  encoderGetRaw(void);    // x4 raw
uint8_t encoderGetDir(void);
int32_t  encoderGetCount(void);  // 1 click = 1
void encoderClearDir(void);
void encoderUpdate(void);
void     encoderReset(void);
bool encoderConsumeZ(void);
float encoderGetAngle(void);
void encoderUpdateVelocity(float dt);
float encoderGetVelocity(void);

#endif

#endif
