#include "TMC6300.h"

#ifdef _USE_HW_TCM6300

#include "encoder.h"
#include <math.h>
#include <stdlib.h> // abs()

#ifdef _USE_HW_CLI
#include "cli.h"
static void cliTmc6300(cli_args_t *args);
#endif

extern TIM_HandleTypeDef htim1;

float theta_offset = 0.0f;
#define POLE_PAIRS 7

#define SQRT3_2 0.8660254f
#define PWM_MAX 1999.0f   // TIM ARR 값

typedef struct {
  float lpf_velocity;
  float step_angle;
  bool  enabled;
} haptic_config_t;

static haptic_config_t haptic_ctrl = { .step_angle = 60.0f, .enabled = false };

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

// ===============================
// PWM 출력 및 SVPWM 오프셋 주입
// ===============================
void setPhasePWM(float Ua, float Ub, float Uc)
{
  if (Ua == 0.0f && Ub == 0.0f && Uc == 0.0f)
  {
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, 0);
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, 0);
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, 0);
    return;
  }

  // SVPWM 효과: 중간값을 찾아 오프셋을 뺌 (5V 전압 활용 극대화)
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

  // Clamp
  if(dutyA < 0) dutyA = 0; if(dutyA > 1) dutyA = 1;
  if(dutyB < 0) dutyB = 0; if(dutyB > 1) dutyB = 1;
  if(dutyC < 0) dutyC = 0; if(dutyC > 1) dutyC = 1;

  __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, dutyA * PWM_MAX);
  __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, dutyB * PWM_MAX);
  __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, dutyC * PWM_MAX);
}

// ===============================
// 하드웨어 초기화 및 부팅 정렬 실행
// ===============================
bool TMCInit(void)
{
  bool ret = true;

  // 1. 하드웨어가 완전히 켜질 때까지 모터 출력을 0
  __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, 0);
  __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, 0);
  __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, 0);

  // 타이머 PWM 채널 on
  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_1);
  HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_1);

  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_2);
  HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_2);

  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_3);
  HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_3);

  // 2. 인코더 하드웨어 리셋
  encoderReset();

  //(Dummy Loop)
  for(int i = 0; i < 300; i++)
  {
    encoderUpdate();
    delay(1);
  }

  // 3.첫 위치 마킹
  encoderUpdate();

  //모터 영점 정렬
  if (motorAlign() != true)
  {
    ret = false;
    setPhasePWM(0, 0, 0);
    return ret;
  }

  // 정렬 완료 후 초기 햅틱 상태 비활성
  TMC6300_SetHapticMode(false);

#ifdef _USE_HW_CLI
  cliAdd("tmc6300", cliTmc6300);
#endif

  return ret;
}

// ===============================
// Inverse Park & Clarke 변환
// ===============================
void inversePark(float Vd, float Vq, float theta, float *Valpha, float *Vbeta)
{
  float sin_t = sinf(theta);
  float cos_t = cosf(theta);

  *Valpha = Vd * cos_t - Vq * sin_t;
  *Vbeta  = Vd * sin_t + Vq * cos_t;
}

void inverseClarke(float Valpha, float Vbeta, float *Ua, float *Ub, float *Uc)
{
  *Ua = Valpha;
  *Ub = -0.5f * Valpha + SQRT3_2 * Vbeta;
  *Uc = -0.5f * Valpha - SQRT3_2 * Vbeta;
}


// ===============================
// FOC 메인 구동
// ===============================
void motorFOC(float theta_deg, float Vq)
{
  // +90도 위상
  float theta = deg2rad(theta_deg) + 1.5707963f;

  float Valpha, Vbeta, Ua, Ub, Uc;
  Vq = clamp(Vq);

  inversePark(0.0f, Vq, theta, &Valpha, &Vbeta);
  inverseClarke(Valpha, Vbeta, &Ua, &Ub, &Uc);

  setPhasePWM(Ua, Ub, Uc);
}

// ===============================
// 모터 영점 정렬
// ===============================
bool motorAlign(void)
{
  cliPrintf("Aligning Motor (Anti-Deadlock Kick Mode)...\n");

  float max_align_voltage = 1.2f;

  motorFOC(90.0f, max_align_voltage);
  delay(50);
  encoderUpdate();

  // 1. Soft Start 구간 (0.0f -> 1.2f까지 점차 오름)
  for(int i = 0; i < 600; i++) {
    float current_voltage = ((float)i / 600.0f) * max_align_voltage;
    motorFOC(0.0f, current_voltage);
    encoderUpdate();
    delay(2);
  }

  // 2. 고정 전압 유지 구간 (안착 대기)
  for(int i = 0; i < 200; i++) {
    motorFOC(0.0f, max_align_voltage);
    encoderUpdate();
    delay(2);
  }

  // 3. 자석이 완전히 락(Lock)된 상태에서 기계각 획득
  float mech = 0;
  for(int i = 0; i < 10; i++) {
    encoderUpdate();
    mech = encoderGetAngle();
    delay(5);
  }

  cliPrintf("Raw Mech Angle: %.4f\n", mech);

  // 4. 새로운 인코더 정방향 축 기준 오프셋 계산 및 양수 정규화
  theta_offset = (mech * (float)POLE_PAIRS);
  theta_offset = fmodf(theta_offset, 360.0f);
  if(theta_offset < 0.0f)
  {
    theta_offset += 360.0f;
  }

  cliPrintf("Final Offset: %.4f\n", theta_offset);

  // 정렬 완료 후 전류 차단
  setPhasePWM(0, 0, 0);
  return true;
}

// ===============================
// 실시간 FOC 위상 제어용 전기각 계산
// ===============================
float getElectricalAngle(void)
{
  float theta_mech = encoderGetAngle();
  float theta_elec = (theta_mech * (float)POLE_PAIRS) + theta_offset;

  theta_elec = fmodf(theta_elec, 360.0f);
  if(theta_elec < 0.0f) theta_elec += 360.0f;

  return theta_elec;
}

// ===============================
// 햅틱 제어 인터페이스 및 콜백 연동
// ===============================
void haptic_set_callback(haptic_callback_t cb) {
  haptic_event_cb = cb;
}

void TMC6300_SetHapticMode(bool enable) {
  haptic_ctrl.enabled = enable;
}

// ===============================
// 메인 루프 전용 상시 햅틱 업데이트 함수
// ===============================
void TMC6300_UpdateHaptic(void)
{
  // 비활성화 시 모터 전류를 완전히 차단하여 과열 방지
  if (!haptic_ctrl.enabled)
  {
    setPhasePWM(0, 0, 0);
    return;
  }

  float mech = encoderGetAngle();         // 0.0f ~ 360.0f 범위
  float elec = getElectricalAngle();
  float step = haptic_ctrl.step_angle;    // 60.0f

  // 현재 각도 기준의 인덱스 (0 ~ 5 범위에서 회전)
  int32_t current_index = (int32_t)roundf(mech / step);
  float target = (float)current_index * step;
  float error = target - mech;

  // 360도 연속성 보정 (Wrap-around 예외 처리)
  if(error > 180.0f)  error -= 360.0f;
  if(error < -180.0f) error += 360.0f;

  // 1. 속도 노이즈 필터 (LPF)
  float alpha = 0.05f;
  haptic_ctrl.lpf_velocity = (alpha * encoderGetVelocity()) + (1.0f - alpha) * haptic_ctrl.lpf_velocity;

  // 2. PD 제어 게인 및 데드밴드 설정
  float Kp = 0.06f;
  float Kd = 0.001f;

  if (fabsf(error) < 1.0f) error = 0.0f;

  float Vq_target = (Kp * error) - (Kd * haptic_ctrl.lpf_velocity);

  // 3. 전압 급격 변화 제한 (Ramp 제어)
  static float last_vq = 0;
  float max_step = 0.02f;

  if (Vq_target - last_vq > max_step)  Vq_target = last_vq + max_step;
  if (Vq_target - last_vq < -max_step) Vq_target = last_vq - max_step;
  last_vq = Vq_target;

  // 4. 상시 안전 구동을 위한 최종 출력 스케일 캡 제한 (-0.5f ~ 0.5f)
  if (Vq_target > 0.5f)  Vq_target = 0.5f;
  if (Vq_target < -0.5f) Vq_target = -0.5f;

  // 5. 인덱스 틱 변화 감지 및 360도 오버/언더플로우 예외 처리
  if (current_index != last_index) {
    int32_t diff = current_index - last_index;
    int32_t max_index_count = (int32_t)(360.0f / step); // 60도 간격이면 총 6개 격자

    if (diff <= -(max_index_count - 1)) {
      diff += max_index_count;
    }
    else if (diff >= (max_index_count - 1)) {
      diff -= max_index_count;
    }

    if (diff != 0 && abs(diff) < 3 && haptic_event_cb != NULL) {
      haptic_event_cb(diff);
    }

    last_index = current_index;
  }

  // 최종 FOC 구동 출력
  motorFOC(elec, Vq_target);
}

// ===============================
// 6-Step 테스트 전용 레거시 코드 (유지)
// ===============================
void motorStep(uint8_t step, uint16_t pwm)
{
  switch(step)
  {
  case 0:
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, pwm);
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, 0);
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, 0);
    break;
  case 1:
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, pwm);
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, 0);
    break;
  case 2:
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, pwm);
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, 0);
    break;
  case 3:
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, pwm);
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, 0);
    break;
  case 4:
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, pwm);
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, 0);
    break;
  case 5:
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, pwm);
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, 0);
    break;
  }
}

void motorRun(int8_t dir, uint16_t pwm, uint16_t delay_ms)
{
  static int8_t step = 0;
  motorStep(step, pwm);

  if(dir > 0) {
    step++;
    if(step >= 6) step = 0;
  } else {
    step--;
    if(step < 0) step = 5;
  }
  delay(delay_ms);
}

// ===============================
// CLI 명령어 분기 루틴 (클린화 완료)
// ===============================
#ifdef _USE_HW_CLI
void cliTmc6300(cli_args_t *args)
{
  bool ret = false;

  if (args->argc == 1 && args->isStr(0, "fwd")) {
    cliPrintf("motor forward (6-step)\n");
    while(cliKeepLoop()) { motorRun(+1, 700, 10); }
    ret = true;
  }

  if (args->argc == 1 && args->isStr(0, "rev")) {
    cliPrintf("motor reverse (6-step)\n");
    while(cliKeepLoop()) { motorRun(-1, 700, 10); }
    ret = true;
  }

  if (args->argc == 1 && args->isStr(0, "align")) {
    if (motorAlign() == true) cliPrintf("Motor Alignment Success!\n");
    else cliPrintf("Motor Alignment Failed!\n");
    ret = true;
  }

  if (args->argc == 1 && args->isStr(0, "elec")) {
    cliPrintf("electrical angle monitor\n");
    while(cliKeepLoop()) {
      encoderUpdate();
      cliPrintf("mech: %.2f / elec: %.2f\n", encoderGetAngle(), getElectricalAngle());
      delay(50);
    }
    ret = true;
  }

  if (args->argc == 1 && args->isStr(0, "foc")) {
    cliPrintf("FOC constant torque (30%%)\n");
    while(cliKeepLoop()) {
      encoderUpdate();
      motorFOC(getElectricalAngle(), 0.3f);
      delay(1);
    }
    ret = true;
  }

  if (args->argc == 1 && args->isStr(0, "sweep")) {
    cliPrintf("FOC sweep test\n");
    float angle = 0;
    while(cliKeepLoop()) {
      motorFOC(angle, 0.5f);
      angle += 1.0f;
      if(angle >= 360.0f) angle = 0;
      delay(1);
    }
    ret = true;
  }

  if (args->argc == 1 && args->isStr(0, "haptic")) {
    cliPrintf("FOC detent haptic (Smooth mode) -> CLI Intercept\n");
    TMC6300_SetHapticMode(true);
    while(cliKeepLoop()) {
      encoderUpdate();
      TMC6300_UpdateHaptic();
    }
    TMC6300_SetHapticMode(false);
    setPhasePWM(0, 0, 0);
    ret = true;
  }

  if (args->argc == 1 && args->isStr(0, "damp")) {
    cliPrintf("FOC damping\n");
    while(cliKeepLoop()) {
      encoderUpdate();
      float vq_val = (encoderGetDir() > 0) ? -0.3f : ((encoderGetDir() < 0) ? 0.3f : 0.0f);
      motorFOC(getElectricalAngle(), vq_val);
    }
    ret = true;
  }

  if (args->argc == 2 && args->isStr(0, "vq")) {
    float vq = atof(args->getStr(1));
    cliPrintf("Vq test: %.2f\n", vq);
    while(cliKeepLoop()) {
      encoderUpdate();
      motorFOC(getElectricalAngle(), vq);
      delay(1);
    }
    ret = true;
  }

  if (ret != true) {
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
