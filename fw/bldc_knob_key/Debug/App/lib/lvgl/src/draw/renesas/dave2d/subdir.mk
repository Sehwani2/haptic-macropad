################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.c \
../App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.c \
../App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.c \
../App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.c \
../App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.c \
../App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.c \
../App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.c \
../App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.c \
../App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.c \
../App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.c 

OBJS += \
./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.o \
./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.o \
./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.o \
./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.o \
./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.o \
./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.o \
./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.o \
./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.o \
./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.o \
./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.o 

C_DEPS += \
./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.d \
./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.d \
./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.d \
./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.d \
./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.d \
./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.d \
./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.d \
./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.d \
./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.d \
./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.d 


# Each subdirectory must supply rules for building sources it contributes
App/lib/lvgl/src/draw/renesas/dave2d/%.o App/lib/lvgl/src/draw/renesas/dave2d/%.su App/lib/lvgl/src/draw/renesas/dave2d/%.cyclo: ../App/lib/lvgl/src/draw/renesas/dave2d/%.c App/lib/lvgl/src/draw/renesas/dave2d/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/include" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/core" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_cdc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_msc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_hid" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-renesas-2f-dave2d

clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-renesas-2f-dave2d:
	-$(RM) ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.cyclo ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.d ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.o ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.su ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.cyclo ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.d ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.o ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.su ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.cyclo ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.d ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.o ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.su ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.cyclo ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.d ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.o ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.su ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.cyclo ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.d ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.o ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.su ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.cyclo ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.d ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.o ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.su ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.cyclo ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.d ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.o ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.su ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.cyclo ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.d ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.o ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.su ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.cyclo ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.d ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.o ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.su ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.cyclo ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.d ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.o ./App/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.su

.PHONY: clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-renesas-2f-dave2d

