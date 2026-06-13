################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/lib/lvgl/src/drivers/x11/lv_x11_display.c \
../App/lib/lvgl/src/drivers/x11/lv_x11_input.c 

OBJS += \
./App/lib/lvgl/src/drivers/x11/lv_x11_display.o \
./App/lib/lvgl/src/drivers/x11/lv_x11_input.o 

C_DEPS += \
./App/lib/lvgl/src/drivers/x11/lv_x11_display.d \
./App/lib/lvgl/src/drivers/x11/lv_x11_input.d 


# Each subdirectory must supply rules for building sources it contributes
App/lib/lvgl/src/drivers/x11/%.o App/lib/lvgl/src/drivers/x11/%.su App/lib/lvgl/src/drivers/x11/%.cyclo: ../App/lib/lvgl/src/drivers/x11/%.c App/lib/lvgl/src/drivers/x11/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/include" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/core" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_cdc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_msc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_hid" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-lib-2f-lvgl-2f-src-2f-drivers-2f-x11

clean-App-2f-lib-2f-lvgl-2f-src-2f-drivers-2f-x11:
	-$(RM) ./App/lib/lvgl/src/drivers/x11/lv_x11_display.cyclo ./App/lib/lvgl/src/drivers/x11/lv_x11_display.d ./App/lib/lvgl/src/drivers/x11/lv_x11_display.o ./App/lib/lvgl/src/drivers/x11/lv_x11_display.su ./App/lib/lvgl/src/drivers/x11/lv_x11_input.cyclo ./App/lib/lvgl/src/drivers/x11/lv_x11_input.d ./App/lib/lvgl/src/drivers/x11/lv_x11_input.o ./App/lib/lvgl/src/drivers/x11/lv_x11_input.su

.PHONY: clean-App-2f-lib-2f-lvgl-2f-src-2f-drivers-2f-x11

