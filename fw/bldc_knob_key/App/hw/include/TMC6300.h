

#ifndef HW_TMC6300_H_
#define HW_TMC6300_H_

#ifdef __cplusplus
 extern "C" {
#endif

#include "hw_def.h"

#ifdef _USE_HW_TCM6300

 bool TMCInit(void);
 void motorStep(uint8_t step, uint16_t pwm);
 void motorRun(int8_t dir, uint16_t pwm, uint16_t delay_ms);
 float getElectricalAngle(void);
 bool motorAlign(void);

 typedef void (*haptic_callback_t)(int32_t diff);
 void haptic_set_callback(haptic_callback_t cb);
 void TMC6300_SetHapticMode(bool enable);
 void TMC6300_UpdateHaptic(void);

#endif


#ifdef __cplusplus
}
#endif

#endif /* HW_INCLUDE_TMC6300_H_ */
