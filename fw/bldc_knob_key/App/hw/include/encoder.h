#ifndef HW_ENCODER_H_
#define HW_ENCODER_H_

#include "hw_def.h"

#ifdef _USE_HW_ENCODER

bool     encoderInit(void);
void     encoderUpdate(void);
void     encoderUpdateVelocity(float dt);

int32_t  encoderGetRaw(void);
int32_t  encoderGetCount(void);
uint8_t  encoderGetDir(void);
float    encoderGetAngle(void);
float    encoderGetVelocity(void);

void     encoderReset(void);
bool     encoderConsumeZ(void);

#endif

#endif
