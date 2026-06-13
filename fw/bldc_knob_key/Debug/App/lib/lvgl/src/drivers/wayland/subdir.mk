################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/lib/lvgl/src/drivers/wayland/lv_wayland.c \
../App/lib/lvgl/src/drivers/wayland/lv_wayland_smm.c 

OBJS += \
./App/lib/lvgl/src/drivers/wayland/lv_wayland.o \
./App/lib/lvgl/src/drivers/wayland/lv_wayland_smm.o 

C_DEPS += \
./App/lib/lvgl/src/drivers/wayland/lv_wayland.d \
./App/lib/lvgl/src/drivers/wayland/lv_wayland_smm.d 


# Each subdirectory must supply rules for building sources it contributes
App/lib/lvgl/src/drivers/wayland/%.o App/lib/lvgl/src/drivers/wayland/%.su App/lib/lvgl/src/drivers/wayland/%.cyclo: ../App/lib/lvgl/src/drivers/wayland/%.c App/lib/lvgl/src/drivers/wayland/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/include" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/core" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_cdc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_msc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_hid" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-lib-2f-lvgl-2f-src-2f-drivers-2f-wayland

clean-App-2f-lib-2f-lvgl-2f-src-2f-drivers-2f-wayland:
	-$(RM) ./App/lib/lvgl/src/drivers/wayland/lv_wayland.cyclo ./App/lib/lvgl/src/drivers/wayland/lv_wayland.d ./App/lib/lvgl/src/drivers/wayland/lv_wayland.o ./App/lib/lvgl/src/drivers/wayland/lv_wayland.su ./App/lib/lvgl/src/drivers/wayland/lv_wayland_smm.cyclo ./App/lib/lvgl/src/drivers/wayland/lv_wayland_smm.d ./App/lib/lvgl/src/drivers/wayland/lv_wayland_smm.o ./App/lib/lvgl/src/drivers/wayland/lv_wayland_smm.su

.PHONY: clean-App-2f-lib-2f-lvgl-2f-src-2f-drivers-2f-wayland

