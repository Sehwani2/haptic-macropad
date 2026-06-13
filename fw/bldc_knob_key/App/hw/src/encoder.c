#include "encoder.h"
#include <math.h>

#ifdef _USE_HW_ENCODER

#include "cli.h"

extern TIM_HandleTypeDef htim3;

#define PPR 1024

// ------------------------------
// 내부 변수
// ------------------------------
static uint16_t enc_prev = 0;
static int32_t  enc_pos  = 0;
static int8_t   enc_dir  = 0;
static float    velocity = 0;

volatile static uint8_t z_flag = 0;

#ifdef _USE_HW_CLI
static void cliEncoder(cli_args_t *args);
#endif

// ------------------------------
// 초기화
// ------------------------------
bool encoderInit(void)
{
  HAL_TIM_Encoder_Start(&htim3, TIM_CHANNEL_ALL);
  __HAL_TIM_SET_COUNTER(&htim3, 0);

  enc_prev = 0;
  enc_pos  = 0;
  velocity = 0.0f;

#ifdef _USE_HW_CLI
  cliAdd("encoder", cliEncoder);
#endif

  return true;
}

// ------------------------------
// 업데이트
// ------------------------------
void encoderUpdate(void)
{
    uint16_t now = (uint16_t)__HAL_TIM_GET_COUNTER(&htim3);
    int16_t diff = (int16_t)(now - enc_prev);
    enc_prev = now;

    enc_pos -= diff;

    if(diff > 0)      enc_dir = +1;
    else if(diff < 0) enc_dir = -1;
    else              enc_dir = 0;
}

// ------------------------------
// 기계각 계산 (0 ~ 360도 정규화)
// ------------------------------
float encoderGetAngle(void)
{

    float angle_raw = (float)enc_pos * 360.0f / (PPR * 4);

    angle_raw = fmodf(angle_raw, 360.0f);
    if(angle_raw < 0.0f)
    {
        angle_raw += 360.0f;
    }

    return angle_raw;
}

// ------------------------------
// 속도 계산
// ------------------------------
void encoderUpdateVelocity(float dt)
{
    static int32_t prev_pos = 0;
    int32_t pos = enc_pos;
    int32_t diff = pos - prev_pos;
    prev_pos = pos;

    if (dt <= 0.0f) return;

    // 현재 diff 기반의 초당 회전 각도(deg/s) 계산
    float vel = ((float)diff / (PPR * 4)) * (360.0f / dt);

    // 속도 노이즈용 LPF
    float alpha = 0.02f;
    velocity = alpha * vel + (1.0f - alpha) * velocity;

    // 미세 떨림 데드밴드 제거
    if (fabsf(velocity) < 0.1f) velocity = 0.0f;
}

float encoderGetVelocity(void)
{
    return velocity;
}

int32_t encoderGetRaw(void)
{
  return (int32_t)(uint16_t)__HAL_TIM_GET_COUNTER(&htim3);
}

int32_t encoderGetCount(void)
{
  return enc_pos;
}

uint8_t encoderGetDir(void)
{
  return enc_dir;
}

void encoderReset(void)
{
  __HAL_TIM_SET_COUNTER(&htim3, 0);
  enc_prev = 0;
  enc_pos  = 0;
  velocity = 0.0f;
}

// ------------------------------
// Z상 처리
// ------------------------------
bool encoderConsumeZ(void)
{
    if(z_flag)
    {
        z_flag = 0;
        return true;
    }
    return false;
}

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
    if(GPIO_Pin == Z_Pin)
    {
        z_flag = 1;
    }
}

/* -------------------------------------------------------------------------- */
/* CLI 명령어                                        */
/* -------------------------------------------------------------------------- */
#ifdef _USE_HW_CLI
static void cliEncoder(cli_args_t *args)
{
  bool ret = false;

  if (args->argc == 1 && args->isStr(0, "raw"))
  {
    while (cliKeepLoop())
    {
      cliPrintf("RAW: %d\n", encoderGetRaw());
      delay(100);
    }
    ret = true;
  }

  if (args->argc == 1 && args->isStr(0, "diff"))
  {
    uint16_t prev = encoderGetRaw();
    while (cliKeepLoop())
    {
      uint16_t now = encoderGetRaw();
      int16_t diff = (int16_t)(now - prev);
      prev = now;

      cliPrintf("DIFF: %d\n", diff);
      delay(100);
    }
    ret = true;
  }

  if (args->argc == 1 && args->isStr(0, "pos"))
  {
    while (cliKeepLoop())
    {
      encoderUpdate();
      cliPrintf("POS: %d\n", encoderGetCount());
      delay(100);
    }
    ret = true;
  }

  if (args->argc == 1 && args->isStr(0, "reset"))
  {
    encoderReset();
    cliPrintf("encoder reset\n");
    ret = true;
  }

  if (args->argc == 1 && args->isStr(0, "dir"))
  {
    while (cliKeepLoop())
    {
      encoderUpdate();
      int8_t dir = encoderGetDir();

      if (dir > 0)       cliPrintf("DIR: CW (+1)\n");
      else if (dir < 0)  cliPrintf("DIR: CCW (-1)\n");
      else               cliPrintf("DIR: STOP (0)\n");

      delay(100);
    }
    ret = true;
  }

  if (args->argc == 1 && args->isStr(0, "angle"))
  {
    while (cliKeepLoop())
    {
      encoderUpdate();
      float angle = encoderGetAngle();
      cliPrintf("ANGLE: %.2f deg\n", angle);
      delay(100);
    }
    ret = true;
  }

  if (ret != true)
  {
    cliPrintf("encoder raw\n");
    cliPrintf("encoder diff\n");
    cliPrintf("encoder pos\n");
    cliPrintf("encoder reset\n");
    cliPrintf("encoder dir\n");
    cliPrintf("encoder angle\n");
  }
}
#endif

#endif /* _USE_HW_ENCODER */
