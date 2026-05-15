
#include "timer.h"

#ifdef _USE_HW_TIMER

extern TIM_HandleTypeDef htim10;

volatile timer_flag_t task = {0};



bool timerInit(void)
{
  bool ret = true;

  HAL_TIM_Base_Start_IT(&htim10);

  return ret;
}

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
    if(htim->Instance == TIM10)
    {
        static uint32_t cnt_1ms  = 0;
        static uint32_t cnt_5ms  = 0;
        static uint32_t cnt_10ms = 0;
        static uint32_t cnt_15ms  = 0;
        static uint32_t cnt_20ms = 0;
        static uint32_t cnt_50ms = 0;
        static uint32_t cnt_100ms = 0;
        static uint32_t cnt_500ms = 0;

        // 1ms
        cnt_1ms++;
        task.flag_1ms = true;
        // 5ms
        cnt_5ms++;
        if(cnt_5ms >= 5)
        {
            cnt_5ms = 0;
            task.flag_5ms = true;
        }
        // 10ms
        cnt_10ms++;
        if(cnt_10ms >= 10)
        {
            cnt_10ms = 0;
            task.flag_10ms = true;
        }
        // 15ms
        cnt_15ms++;
        if(cnt_15ms >= 15)
        {
            cnt_15ms = 0;
            task.flag_15ms = true;
        }
        // 20ms
        cnt_20ms++;
        if(cnt_20ms >= 20)
        {
            cnt_20ms = 0;
            task.flag_20ms = true;
        }
        // 50ms
        cnt_50ms++;
        if(cnt_50ms >= 50)
        {
            cnt_50ms = 0;
            task.flag_50ms = true;
        }
        //100ms
        cnt_100ms++;
        if(cnt_100ms >= 100)
        {
          cnt_100ms = 0;
          task.flag_100ms = true;
        }

        // 500ms
        cnt_500ms++;
        if(cnt_500ms >= 500)
        {
            cnt_500ms = 0;
            task.flag_500ms = true;
        }
    }
}

bool timerGetFlag_1ms(void)
{
    if(task.flag_1ms)
    {
        task.flag_1ms = false;
        return true;
    }
    return false;
}

bool timerGetFlag_5ms(void)
{
    if(task.flag_5ms)
    {
        task.flag_5ms = false;
        return true;
    }
    return false;
}

bool timerGetFlag_10ms(void)
{
    if(task.flag_10ms)
    {
        task.flag_10ms = false;
        return true;
    }
    return false;
}

bool timerGetFlag_15ms(void)
{
    if(task.flag_15ms)
    {
        task.flag_15ms = false;
        return true;
    }
    return false;
}

bool timerGetFlag_20ms(void)
{
    if(task.flag_20ms)
    {
        task.flag_20ms = false;
        return true;
    }
    return false;
}

bool timerGetFlag_50ms(void)
{
    if(task.flag_50ms)
    {
        task.flag_50ms = false;
        return true;
    }
    return false;
}

bool timerGetFlag_100ms(void)
{
    if(task.flag_100ms)
    {
        task.flag_100ms = false;
        return true;
    }
    return false;
}

bool timerGetFlag_500ms(void)
{
    if(task.flag_500ms)
    {
        task.flag_500ms = false;
        return true;
    }
    return false;
}

#endif

