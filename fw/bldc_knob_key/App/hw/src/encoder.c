

#include "encoder.h"

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

static float angle_filtered = 0.0f;

volatile static uint8_t z_flag = 0;




#ifdef _USE_HW_CLI
static void cliEncoder(cli_args_t *args);
#endif

///////
//vel
static float prev_angle = 0;
static float velocity = 0;

void encoderUpdateVelocity(float dt)
{
    static int32_t prev_pos = 0;
    int32_t pos = encoderGetCount();
    int32_t diff = pos - prev_pos;
    prev_pos = pos;

    float vel = ((float)diff / (PPR * 4)) * (360.0f / dt);


    float alpha = 0.02f;
    velocity = alpha * vel + (1.0f - alpha) * velocity;

    if (fabsf(velocity) < 0.1f) velocity = 0;
}

float encoderGetVelocity(void)
{
//    printf("%f \r\n",velocity);
    return velocity;
}

// ------------------------------
// 초기화
// ------------------------------
bool encoderInit(void)
{
  HAL_TIM_Encoder_Start(&htim3, TIM_CHANNEL_ALL);
  __HAL_TIM_SET_COUNTER(&htim3, 0);

  enc_prev = 0;
  enc_pos  = 0;
  angle_filtered = 0;

#ifdef _USE_HW_CLI
  cliAdd("encoder", cliEncoder);
#endif

  return true;
}

int32_t encoderGetRaw(void)
{
  return (int32_t)(uint16_t)__HAL_TIM_GET_COUNTER(&htim3);
}

// ------------------------------
// 업데이트
// ------------------------------
void encoderUpdate(void)
{
    uint16_t now = (uint16_t)__HAL_TIM_GET_COUNTER(&htim3);
    int32_t diff = (int32_t)now - (int32_t)enc_prev;

    // wrap 보정
    if(diff > 32768)  diff -= 65536;
    if(diff < -32768) diff += 65536;

    enc_prev = now;

    if(diff > 100 || diff < -100)
    {
      return;
    }

    enc_pos -= diff;

    if(diff > 0)      enc_dir = +1;
    else if(diff < 0) enc_dir = -1;
    else              enc_dir = 0;
}

// ------------------------------
// 각도
// ------------------------------
float encoderGetAngle(void)
{
    float angle_raw;

    angle_raw = (float)enc_pos * 360.0f / (PPR * 4);

    // wrap
    while(angle_raw >= 360.0f) angle_raw -= 360.0f;
    while(angle_raw < 0.0f)    angle_raw += 360.0f;

    // unwrap + LPF
    float diff = angle_raw - angle_filtered;

    if(diff > 180.0f)  diff -= 360.0f;
    if(diff < -180.0f) diff += 360.0f;


    angle_filtered += diff * 0.8f;

    // wrap
    if(angle_filtered >= 360.0f) angle_filtered -= 360.0f;
    if(angle_filtered < 0.0f)    angle_filtered += 360.0f;

    return angle_filtered;
}

// ------------------------------
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
  angle_filtered = 0;
}

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

// ------------------------------
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
    if(GPIO_Pin == Z_Pin)
    {
        z_flag = 1;
    }
}



/* -------------------------------------------------------------------------- */
/* CLI                                                                        */
/* -------------------------------------------------------------------------- */
#ifdef _USE_HW_CLI
static void cliEncoder(cli_args_t *args)
{
  bool ret = false;

  /* RAW 카운터 확인 */
  if (args->argc == 1 && args->isStr(0, "raw"))
  {
    while (cliKeepLoop())
    {
      cliPrintf("RAW: %d\n", encoderGetRaw());
      delay(100);
    }
    ret = true;
  }

  /* 변화량(diff) 확인 */
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

  /* 위치(pos) 확인 */
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

  /* reset */
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

      if (dir > 0)
        cliPrintf("DIR: CW (+1)\n");
      else if (dir < 0)
        cliPrintf("DIR: CCW (-1)\n");
      else
        cliPrintf("DIR: STOP (0)\n");

      delay(100);
    }
    ret = true;
  }
  /* 각도 확인 */
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
