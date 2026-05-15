#include "TMC6300.h"

#ifdef _USE_HW_TCM6300

#include "encoder.h"
#include <math.h>

#ifdef _USE_HW_CLI
#include "cli.h"
#endif



#ifdef _USE_HW_CLI
static void cliTmc6300(cli_args_t *args);
#endif

extern TIM_HandleTypeDef htim1;

float theta_offset = 0.0f;
#define POLE_PAIRS 7

#define SQRT3_2 0.8660254f
#define PWM_MAX 1999.0f   // TIM ARR 값
float voltage_limit = 5.0f;


typedef struct {
  float last_target;
  float lpf_velocity;
  float step_angle;
  bool  enabled;
} haptic_config_t;

static haptic_config_t haptic_ctrl = { .last_target = -999.0f, .step_angle = 60.0f, .enabled = false };

static int32_t last_index = 0;
static haptic_callback_t haptic_event_cb = NULL;


static inline float deg2rad(float deg)
{
  return deg * 0.01745329251f;
}

static inline float clamp(float v)
{
  if(v > 1.0f) return 1.0f;
  if(v < -1.0f) return -1.0f;
  return v;
}

bool TMCInit(void)
{
  bool ret = true;

  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_1);
  HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_1);

  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_2);
  HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_2);

  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_3);
  HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_3);

  motorAlign();
  TMC6300_SetHapticMode(1);

#ifdef _USE_HW_CLI
  cliAdd("tmc6300", cliTmc6300);
#endif

  return ret;
}

// ===============================
// Inverse Park
// ===============================
void inversePark(float Vd, float Vq, float theta,
    float *Valpha, float *Vbeta)
{
  float sin_t = sinf(theta);
  float cos_t = cosf(theta);

  *Valpha = Vd * cos_t - Vq * sin_t;
  *Vbeta  = Vd * sin_t + Vq * cos_t;
}

// ===============================
// Inverse Clarke
// ===============================
void inverseClarke(float Valpha, float Vbeta,
    float *Ua, float *Ub, float *Uc)
{
  *Ua = Valpha;
  *Ub = -0.5f * Valpha + SQRT3_2 * Vbeta;
  *Uc = -0.5f * Valpha - SQRT3_2 * Vbeta;
}

// ===============================
// PWM 출력
// ===============================
void setPhasePWM(float Ua, float Ub, float Uc)
{
  // 🔥 SVPWM 효과: 중간값을 찾아 오프셋을 뺌 (5V 전압 활용도 극대화)
  float min_v = fminf(fminf(Ua, Ub), Uc);
  float max_v = fmaxf(fmaxf(Ua, Ub), Uc);
  float offset = (max_v + min_v) * 0.5f;

  Ua -= offset;
  Ub -= offset;
  Uc -= offset;

  // 0.5f(50% 듀티)를 더해 0~1 범위로 변환
  float dutyA = (Ua + 1.0f) * 0.5f;
  float dutyB = (Ub + 1.0f) * 0.5f;
  float dutyC = (Uc + 1.0f) * 0.5f;

  // Clamp (안전을 위해)
  if(dutyA < 0) dutyA = 0; if(dutyA > 1) dutyA = 1;
  if(dutyB < 0) dutyB = 0; if(dutyB > 1) dutyB = 1;
  if(dutyC < 0) dutyC = 0; if(dutyC > 1) dutyC = 1;

  __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, dutyA * PWM_MAX);
  __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, dutyB * PWM_MAX);
  __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, dutyC * PWM_MAX);
}

// ===============================
// Voltage limit
// ===============================
float limitVoltage(float Vq)
{
  if(Vq > voltage_limit)  Vq = voltage_limit;
  if(Vq < -voltage_limit) Vq = -voltage_limit;
  return Vq;
}

// ===============================
// FOC 메인
// ===============================
void motorFOC(float theta_deg, float Vq)
{
  float theta = deg2rad(theta_deg) - 1.5707963f;

  float Valpha, Vbeta, Ua, Ub, Uc;
  Vq = clamp(Vq);

  inversePark(0.0f, Vq, theta, &Valpha, &Vbeta);
  inverseClarke(Valpha, Vbeta, &Ua, &Ub, &Uc);

  setPhasePWM(Ua, Ub, Uc);
}

bool motorAlign(void)
{
  cliPrintf("Aligning...\n");
  float align_voltage = 0.8f;
  float Ua, Ub, Uc;

  for(int i = 0; i < 1500; i++) {
    inverseClarke(align_voltage, 0.0f, &Ua, &Ub, &Uc);
    setPhasePWM(Ua, Ub, Uc);
    delay(1);
  }
  delay(200);

  float mech = 0;
  for(int retry = 0; retry < 5; retry++) {
    encoderUpdate();
    mech = encoderGetAngle();
    if(mech != 0.0f) break; // 0이 아니면 성공, 루프 탈출
    delay(10);
  }

  cliPrintf("Raw Mech Angle: %.4f\n", mech);

  if(mech == 0.0f) {
    cliPrintf("Error: Encoder Read Failed (0.0000). Check Hardware!\n");
    setPhasePWM(0, 0, 0);
    return;
  }

  theta_offset = (-mech * (float)POLE_PAIRS);
  while(theta_offset >= 360.0f) theta_offset -= 360.0f;
  while(theta_offset < 0.0f)    theta_offset += 360.0f;

  cliPrintf("Final Offset: %.4f\n", theta_offset);
  setPhasePWM(0, 0, 0);
  return  true;
}


float getElectricalAngle(void)
{
  float theta_mech = encoderGetAngle();

  float theta_elec = (theta_mech * POLE_PAIRS) - theta_offset;

  while(theta_elec >= 360.0f) theta_elec -= 360.0f;
  while(theta_elec < 0.0f)    theta_elec += 360.0f;

  return theta_elec;
}
/////////////////////////

void haptic_set_callback(haptic_callback_t cb) {
  haptic_event_cb = cb;
}

// 햅틱 활성화/비활성화 함수
void TMC6300_SetHapticMode(bool enable) {
  haptic_ctrl.enabled = enable;
  if(enable) haptic_ctrl.last_target = -999.0f;
}

void TMC6300_UpdateHaptic(void)
{
  if (!haptic_ctrl.enabled) return;

  float mech = encoderGetAngle();
  float elec = getElectricalAngle();
  float step = haptic_ctrl.step_angle;

  int32_t current_index = (int32_t)roundf(mech / step);
  float target = roundf(mech / step) * step;
  float error = target - mech;

  if(error > 180.0f)  error -= 360.0f;
  if(error < -180.0f) error += 360.0f;

  // 1. 속도 필터
  float alpha = 0.05f;
  haptic_ctrl.lpf_velocity = (alpha * encoderGetVelocity()) + (1.0f - alpha) * haptic_ctrl.lpf_velocity;

  // 2. 게인 조정
  float Kp = 0.06f;
  float Kd = 0.001f;

  if (fabsf(error) < 1.0f) error = 0;

  float Vq_target = (Kp * error) - (Kd * haptic_ctrl.lpf_velocity);

  // 3. 출력 변화폭을 아주 작게 제한
  static float last_vq = 0;
  float max_step = 0.02f; // 루프당 전압 변화 제한

  if (Vq_target - last_vq > max_step) Vq_target = last_vq + max_step;
  if (Vq_target - last_vq < -max_step) Vq_target = last_vq - max_step;
  last_vq = Vq_target;

  // 인덱스 변화 감지 및 콜백 호출
    if (current_index != last_index) {
      int32_t diff = current_index - last_index;

      // 0~359도 경계 예외 처리 및 콜백 실행
      if (abs(diff) < 10 && haptic_event_cb != NULL) {
        haptic_event_cb(diff); //  macro_haptic_callback 호출
      }
      last_index = current_index;
    }


  motorFOC(elec, clamp(Vq_target));
}



/////// 6-step motor testing code
void motorStep(uint8_t step, uint16_t pwm)
{
  switch(step)
  {
  case 0: // U+, V-, W off
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, pwm); // U PWM
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, 0);   // V LOW
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, 0);   // W OFF
    break;

  case 1: // U+, W-, V off
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, pwm);
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, 0);
    break;

  case 2: // V+, W-, U off
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, pwm);
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, 0);
    break;

  case 3: // V+, U-, W off
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, pwm);
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, 0);
    break;

  case 4: // W+, U-, V off
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, pwm);
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, 0);
    break;

  case 5: // W+, V-, U off
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, pwm);
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, 0);
    break;
  }
}


void motorRun(int8_t dir, uint16_t pwm, uint16_t delay_ms)
{
  static int8_t step = 0;

  motorStep(step, pwm);

  // 방향 처리
  if(dir > 0)
  {
    step++;
    if(step >= 6) step = 0;
  }
  else
  {
    step--;
    if(step < 0) step = 5;
  }

  delay(delay_ms);
}

#ifdef _USE_HW_CLI
#ifdef _USE_HW_CLI
void cliTmc6300(cli_args_t *args)
{
  bool ret = false;

  // ===============================
  // 6-step 테스트
  // ===============================

  if (args->argc == 1 && args->isStr(0, "fwd"))
  {
    cliPrintf("motor forward (6-step)\n");

    while(cliKeepLoop())
    {
      motorRun(+1, 700, 10);
    }
    ret = true;
  }

  if (args->argc == 1 && args->isStr(0, "rev"))
  {
    cliPrintf("motor reverse (6-step)\n");

    while(cliKeepLoop())
    {
      motorRun(-1, 700, 10);
    }
    ret = true;
  }

  if (args->argc == 1 && args->isStr(0, "align"))
  {
    cliPrintf("Aligning...\n");
    float align_voltage = 0.8f;
    float Ua, Ub, Uc;

    for(int i = 0; i < 1500; i++) {
      inverseClarke(align_voltage, 0.0f, &Ua, &Ub, &Uc);
      setPhasePWM(Ua, Ub, Uc);
      delay(1);
    }
    delay(200);

    // 🔥 수정: 인코더 값이 제대로 읽힐 때까지 최대 5번 재시도
    float mech = 0;
    for(int retry = 0; retry < 5; retry++) {
      encoderUpdate();
      mech = encoderGetAngle();
      if(mech != 0.0f) break; // 0이 아니면 성공, 루프 탈출
      delay(10);
    }

    cliPrintf("Raw Mech Angle: %.4f\n", mech);

    // 만약 끝까지 0이라면 하드웨어 체크 필요
    if(mech == 0.0f) {
      cliPrintf("Error: Encoder Read Failed (0.0000). Check Hardware!\n");
      setPhasePWM(0, 0, 0);
      return;
    }

    theta_offset = (-mech * (float)POLE_PAIRS);
    while(theta_offset >= 360.0f) theta_offset -= 360.0f;
    while(theta_offset < 0.0f)    theta_offset += 360.0f;

    cliPrintf("Final Offset: %.4f\n", theta_offset);
    setPhasePWM(0, 0, 0);
    ret = true;
  }

  // ===============================
  // 전기각 확인
  // ===============================
  if (args->argc == 1 && args->isStr(0, "elec"))
  {
    cliPrintf("electrical angle monitor\n");

    while(cliKeepLoop())
    {
      encoderUpdate();

      float mech = encoderGetAngle();
      float elec = getElectricalAngle();

      cliPrintf("mech: %.2f / elec: %.2f\n", mech, elec);

      delay(50);
    }
    ret = true;
  }

  // ===============================
  // 🔥 FOC 토크 테스트
  // ===============================
  if (args->argc == 1 && args->isStr(0, "foc"))
  {
    cliPrintf("FOC constant torque\n");

    while(cliKeepLoop())
    {
      encoderUpdate();
      float elec = getElectricalAngle();

      motorFOC(elec, 0.3f);   // 🔥 30%
      delay(1);
    }
    ret = true;
  }

  // ===============================
  // 🔥 FOC sweep
  // ===============================
  if (args->argc == 1 && args->isStr(0, "sweep"))
  {
    cliPrintf("FOC sweep test\n");

    float angle = 0;

    while(cliKeepLoop())
    {
      motorFOC(angle, 0.5f);

      angle += 1.0f;
      if(angle >= 360.0f) angle = 0;
      delay(1);
    }
    ret = true;
  }

  // ===============================
  // 🔥 햅틱
  // ===============================
  if (args->argc == 1 && args->isStr(0, "haptic"))
  {
    cliPrintf("FOC detent haptic (Smooth mode)\n");

    float lpf_velocity = 0; // 속도 필터용 변수
    float alpha = 0.1f;     // 필터 계수 (0~1, 작을수록 부드러움)

    while(cliKeepLoop())
    {
      encoderUpdate();

      float mech = encoderGetAngle();
      float elec = getElectricalAngle();

      // 1. 목표 각도 계산 (60도 간격)
      float step = 60.0f;
      float target = roundf(mech / step) * step;
      float error = target - mech;

      // 2. 각도 Wrap-around 처리
      if(error > 180.0f) error -= 360.0f;
      if(error < -180.0f) error += 360.0f;

      // 3. 속도 노이즈 저감 (Low Pass Filter)
      float raw_velocity = encoderGetVelocity();
      lpf_velocity = (alpha * raw_velocity) + (1.0f - alpha) * lpf_velocity;

      // 4. PD 제어 게인 조정
      float Kp = 0.05f;
      float Kd = 0.002f; // Kd를 기존보다 낮추거나 필터링된 값을 사용

      // 5. 데드밴드 추가 (미세 떨림 방지)
      if (fabsf(error) < 0.5f) error = 0;

      float Vq = (Kp * error) - (Kd * lpf_velocity);

      // 6. 출력 제한 (안전)
      Vq = clamp(Vq);

      motorFOC(elec, Vq);

      // delay(1)을 넣거나 아예 빼서 루프 속도를 일정하게 유지
      // 만약 너무 빨리 돌면 delay(1) 추가
    }
  }

  // ========================== =====
  // 🔥 댐핑
  // ===============================
  if (args->argc == 1 && args->isStr(0, "damp"))
  {
    cliPrintf("FOC damping\n");

    while(cliKeepLoop())
    {
      encoderUpdate();

      float elec = getElectricalAngle();
      int8_t dir = encoderGetDir();

      float Vq = 0;

      if(dir > 0)      Vq = -0.3f;
      else if(dir < 0) Vq =  0.3f;

      motorFOC(elec, Vq);

    }
    ret = true;
  }

  // ===============================
  // 🔥 Vq 직접 테스트
  // ===============================
  if (args->argc == 2 && args->isStr(0, "vq"))
  {
    float vq = atof(args->getStr(1));

    cliPrintf("Vq test: %.2f\n", vq);

    while(cliKeepLoop())
    {
      encoderUpdate();
      float elec = getElectricalAngle();

      motorFOC(elec, vq);

      delay(1);

    }
    ret = true;
  }

  // ===============================
  // HELP
  // ===============================
  if (ret != true)
  {
    cliPrintf("tmc6300 fwd\n");
    cliPrintf("tmc6300 rev\n");
    cliPrintf("tmc6300 align\n");
    cliPrintf("tmc6300 elec\n");
    cliPrintf("tmc6300 foc\n");
    cliPrintf("tmc6300 sweep\n");
    cliPrintf("tmc6300 haptic\n");
    cliPrintf("tmc6300 damp\n");
    cliPrintf("tmc6300 vq [0~1]\n");
  }
}
#endif
#endif

#endif
