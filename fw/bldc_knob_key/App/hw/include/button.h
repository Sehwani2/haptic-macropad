#ifndef BUTTON_H_
#define BUTTON_H_

#include "hw_def.h"


#ifdef _USE_HW_BUTTON

#define BUTTON_MAX_CH         HW_BUTTON_MAX_CH

enum
{
  KEY_NONE,
  // UI용
  KEY_LEFT,
  KEY_RIGHT,
  KEY_ENTER,
  KEY_BACK,

  // 매크로용
  KEY_1,
  KEY_2,
  KEY_3,
  KEY_4,
  KEY_5,
  KEY_6,
};

bool buttonInit(void);
bool buttonGetPressed(uint8_t ch);


#endif

#endif
