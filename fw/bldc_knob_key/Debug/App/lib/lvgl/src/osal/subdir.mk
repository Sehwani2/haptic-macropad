################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/lib/lvgl/src/osal/lv_cmsis_rtos2.c \
../App/lib/lvgl/src/osal/lv_freertos.c \
../App/lib/lvgl/src/osal/lv_mqx.c \
../App/lib/lvgl/src/osal/lv_os.c \
../App/lib/lvgl/src/osal/lv_os_none.c \
../App/lib/lvgl/src/osal/lv_pthread.c \
../App/lib/lvgl/src/osal/lv_rtthread.c \
../App/lib/lvgl/src/osal/lv_windows.c 

OBJS += \
./App/lib/lvgl/src/osal/lv_cmsis_rtos2.o \
./App/lib/lvgl/src/osal/lv_freertos.o \
./App/lib/lvgl/src/osal/lv_mqx.o \
./App/lib/lvgl/src/osal/lv_os.o \
./App/lib/lvgl/src/osal/lv_os_none.o \
./App/lib/lvgl/src/osal/lv_pthread.o \
./App/lib/lvgl/src/osal/lv_rtthread.o \
./App/lib/lvgl/src/osal/lv_windows.o 

C_DEPS += \
./App/lib/lvgl/src/osal/lv_cmsis_rtos2.d \
./App/lib/lvgl/src/osal/lv_freertos.d \
./App/lib/lvgl/src/osal/lv_mqx.d \
./App/lib/lvgl/src/osal/lv_os.d \
./App/lib/lvgl/src/osal/lv_os_none.d \
./App/lib/lvgl/src/osal/lv_pthread.d \
./App/lib/lvgl/src/osal/lv_rtthread.d \
./App/lib/lvgl/src/osal/lv_windows.d 


# Each subdirectory must supply rules for building sources it contributes
App/lib/lvgl/src/osal/%.o App/lib/lvgl/src/osal/%.su App/lib/lvgl/src/osal/%.cyclo: ../App/lib/lvgl/src/osal/%.c App/lib/lvgl/src/osal/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/include" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/core" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_cdc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_msc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_hid" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-lib-2f-lvgl-2f-src-2f-osal

clean-App-2f-lib-2f-lvgl-2f-src-2f-osal:
	-$(RM) ./App/lib/lvgl/src/osal/lv_cmsis_rtos2.cyclo ./App/lib/lvgl/src/osal/lv_cmsis_rtos2.d ./App/lib/lvgl/src/osal/lv_cmsis_rtos2.o ./App/lib/lvgl/src/osal/lv_cmsis_rtos2.su ./App/lib/lvgl/src/osal/lv_freertos.cyclo ./App/lib/lvgl/src/osal/lv_freertos.d ./App/lib/lvgl/src/osal/lv_freertos.o ./App/lib/lvgl/src/osal/lv_freertos.su ./App/lib/lvgl/src/osal/lv_mqx.cyclo ./App/lib/lvgl/src/osal/lv_mqx.d ./App/lib/lvgl/src/osal/lv_mqx.o ./App/lib/lvgl/src/osal/lv_mqx.su ./App/lib/lvgl/src/osal/lv_os.cyclo ./App/lib/lvgl/src/osal/lv_os.d ./App/lib/lvgl/src/osal/lv_os.o ./App/lib/lvgl/src/osal/lv_os.su ./App/lib/lvgl/src/osal/lv_os_none.cyclo ./App/lib/lvgl/src/osal/lv_os_none.d ./App/lib/lvgl/src/osal/lv_os_none.o ./App/lib/lvgl/src/osal/lv_os_none.su ./App/lib/lvgl/src/osal/lv_pthread.cyclo ./App/lib/lvgl/src/osal/lv_pthread.d ./App/lib/lvgl/src/osal/lv_pthread.o ./App/lib/lvgl/src/osal/lv_pthread.su ./App/lib/lvgl/src/osal/lv_rtthread.cyclo ./App/lib/lvgl/src/osal/lv_rtthread.d ./App/lib/lvgl/src/osal/lv_rtthread.o ./App/lib/lvgl/src/osal/lv_rtthread.su ./App/lib/lvgl/src/osal/lv_windows.cyclo ./App/lib/lvgl/src/osal/lv_windows.d ./App/lib/lvgl/src/osal/lv_windows.o ./App/lib/lvgl/src/osal/lv_windows.su

.PHONY: clean-App-2f-lib-2f-lvgl-2f-src-2f-osal

