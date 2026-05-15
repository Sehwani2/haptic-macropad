#ifndef MACRO_H_
#define MACRO_H_

#include "ap_def.h"


#define MACRO_KEY1    2
#define MACRO_KEY2    3
#define MACRO_KEY3    4
#define MACRO_KEY4    5
#define MACRO_KEY5    6
#define MACRO_KEY6    7

void macro_init(void);
void testMacroUpdate(void);
void macro_run(uint8_t bank, uint8_t index);
void macro_request(uint8_t bank, uint8_t index);
void macro_update(void);
#endif
