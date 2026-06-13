################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend.c \
../App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.c \
../App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.c \
../App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.c \
../App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.c \
../App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.c \
../App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.c 

OBJS += \
./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend.o \
./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.o \
./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.o \
./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.o \
./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.o \
./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.o \
./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.o 

C_DEPS += \
./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend.d \
./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.d \
./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.d \
./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.d \
./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.d \
./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.d \
./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.d 


# Each subdirectory must supply rules for building sources it contributes
App/lib/lvgl/src/draw/sw/blend/%.o App/lib/lvgl/src/draw/sw/blend/%.su App/lib/lvgl/src/draw/sw/blend/%.cyclo: ../App/lib/lvgl/src/draw/sw/blend/%.c App/lib/lvgl/src/draw/sw/blend/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/include" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/core" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_cdc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_msc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_hid" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend

clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend:
	-$(RM) ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend.cyclo ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend.d ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend.o ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend.su ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.cyclo ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.d ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.o ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.su ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.cyclo ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.d ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.o ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.su ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.cyclo ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.d ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.o ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.su ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.cyclo ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.d ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.o ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.su ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.cyclo ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.d ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.o ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.su ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.cyclo ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.d ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.o ./App/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.su

.PHONY: clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend

