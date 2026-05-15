#ifndef HW_H_
#define HW_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "hw_def.h"

#include "led.h"
#include "cli.h"
#include "uart.h"
#include "button.h"
#include "gpio.h"
#include "sd.h"
#include "fat_fs.h"
#include "st7789.h"
#include "usb.h"
#include "cdc.h"
#include "lcd.h"
#include "lvgl.h"
#include "encoder.h"
#include "TMC6300.h"
#include "timer.h"


bool hwInit(void);


#ifdef __cplusplus
}
#endif

#endif
