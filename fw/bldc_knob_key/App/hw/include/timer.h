/*
 * timer.h
 *
 *  Created on: Feb 4, 2026
 *      Author: hyn02
 */

#ifndef HW_TIMER_H_
#define HW_TIMER_H_

#ifdef __cplusplus
 extern "C" {
#endif

#include "hw_def.h"

#ifdef _USE_HW_TIMER

 typedef struct {
     volatile bool flag_1ms;
     volatile bool flag_5ms;
     volatile bool flag_10ms;
     volatile bool flag_15ms;
     volatile bool flag_20ms;
     volatile bool flag_50ms;
     volatile bool flag_100ms;
     volatile bool flag_500ms;
 } timer_flag_t;




bool timerInit(void);
bool timerGetFlag_1ms(void);
bool timerGetFlag_5ms(void);
bool timerGetFlag_10ms(void);
bool timerGetFlag_15ms(void);
bool timerGetFlag_20ms(void);
bool timerGetFlag_50ms(void);
bool timerGetFlag_100ms(void);
bool timerGetFlag_500ms(void);

#endif

#ifdef __cplusplus
}
#endif

#endif /* HW_INCLUDE_TIMER_H_ */
