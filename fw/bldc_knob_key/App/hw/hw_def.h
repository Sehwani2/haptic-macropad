#ifndef HW_DEF_H_
#define HW_DEF_H_


#include "main.h"
#include "def.h"



// 하드웨어 정의 추가
//
#define _USE_HW_LED
#define      HW_LED_MAX_CH          1

#define _USE_HW_BUTTON
#define HW_BUTTON_MAX_CH            9

#define _USE_HW_GPIO
#define      HW_GPIO_MAX_CH         4

#define _USE_HW_ENCODER
#define _USE_HW_TCM6300

#define _USE_HW_SD
#define _USE_HW_FATFS

#define _USE_HW_UART
#define      HW_UART_MAX_CH         1

#define _USE_HW_CLI
#define      HW_CLI_CMD_LIST_MAX    32
#define      HW_CLI_CMD_NAME_MAX    16
#define      HW_CLI_LINE_HIS_MAX    8
#define      HW_CLI_LINE_BUF_MAX    64

#define _USE_HW_ST7789
#define      HW_ST7789_WIDTH        160
#define      HW_ST7789_HEIGHT       128

#define _USE_HW_LCD
#define      HW_LCD_WIDTH           160
#define      HW_LCD_HEIGHT          128

#define _USE_HW_LVGL
#define      HW_LCD_WIDTH           160
#define      HW_LCD_HEIGHT          128

#define _USE_HW_USB
#define _USE_HW_CDC

#define      HW_USE_CDC             0
#define      HW_USE_MSC             1
#define      HW_USB_HID             1

#define _USE_HW_TIMER

// 공통 사용 함수
//
#define logPrintf printf

void     delay(uint32_t ms);
uint32_t millis(void);


#endif
