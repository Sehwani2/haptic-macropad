#include "button.h"
#include "cli.h"




typedef struct
{
  GPIO_TypeDef *port;
  uint32_t      pin;
  GPIO_PinState on_state;
} button_tbl_t;


const button_tbl_t button_tbl[BUTTON_MAX_CH] =
    {
        {BTN1_GPIO_Port, BTN1_Pin, GPIO_PIN_RESET},                       // setting btn
        {BTN2_GPIO_Port, BTN2_Pin, GPIO_PIN_RESET},
        {KEY1_GPIO_Port, KEY1_Pin, GPIO_PIN_RESET},                       // macro btn
        {KEY2_GPIO_Port, KEY2_Pin, GPIO_PIN_RESET},
        {KEY3_GPIO_Port, KEY3_Pin, GPIO_PIN_RESET},
        {KEY4_GPIO_Port, KEY4_Pin, GPIO_PIN_RESET},
        {KEY5_GPIO_Port, KEY5_Pin, GPIO_PIN_RESET},
        {KEY6_GPIO_Port, KEY6_Pin, GPIO_PIN_RESET},
        {SDMMC1_CD_GPIO_GPIO_Port, SDMMC1_CD_GPIO_Pin, GPIO_PIN_RESET},   // SD CARD Detection

    };


#ifdef _USE_HW_CLI
static void cliButton(cli_args_t *args);
#endif





bool buttonInit(void)
{
  bool ret = true;


#ifdef _USE_HW_CLI
  cliAdd("button", cliButton);
#endif

  return ret;
}

bool buttonGetPressed(uint8_t ch)
{
  bool ret = false;

  if (ch >= BUTTON_MAX_CH)
  {
    return false;
  }

  if (HAL_GPIO_ReadPin(button_tbl[ch].port, button_tbl[ch].pin) == button_tbl[ch].on_state)
  {
    ret = true;
  }

  return ret;
}

void cliButton(cli_args_t *args)
{
  bool ret = false;


  if (args->argc == 1 && args->isStr(0, "show"))
  {
    while(cliKeepLoop())
    {
      for (int i=0; i<BUTTON_MAX_CH; i++)
      {
        cliPrintf("%d", buttonGetPressed(i));
      }
      cliPrintf("\n");

      delay(100);
    }

    ret = true;
  }


  if (ret != true)
  {
    cliPrintf("button show\n");
  }
}
