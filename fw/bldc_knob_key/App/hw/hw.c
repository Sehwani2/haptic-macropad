#include "hw.h"




bool hwInit(void)
{
  // 하드웨어 초기화 함수
  //

  delay(10);
  ledInit();
  usbInit();
  cdcInit();
  uartInit();
  cliInit();
  buttonInit();
  gpioInit();

  if (sdInit() == true)
  {
    fatfsInit();
  }

  st7789Init();
  lcdInit();
  lvglInit();
  encoderInit();
  TMCInit();
  timerInit();

  if(buttonGetPressed(0)==1)
  {
    usbBegin(USB_MSC_MODE);
  }
  else
  {
    usbBegin(USB_HID_MODE);
  }


  return true;
}

void delay(uint32_t ms)
{
  HAL_Delay(ms);
}

uint32_t millis(void)
{
  return HAL_GetTick();
}
