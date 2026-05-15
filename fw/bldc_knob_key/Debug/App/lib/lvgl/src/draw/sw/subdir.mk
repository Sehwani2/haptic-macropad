################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/lib/lvgl/src/draw/sw/lv_draw_sw.c \
../App/lib/lvgl/src/draw/sw/lv_draw_sw_arc.c \
../App/lib/lvgl/src/draw/sw/lv_draw_sw_border.c \
../App/lib/lvgl/src/draw/sw/lv_draw_sw_box_shadow.c \
../App/lib/lvgl/src/draw/sw/lv_draw_sw_fill.c \
../App/lib/lvgl/src/draw/sw/lv_draw_sw_gradient.c \
../App/lib/lvgl/src/draw/sw/lv_draw_sw_img.c \
../App/lib/lvgl/src/draw/sw/lv_draw_sw_letter.c \
../App/lib/lvgl/src/draw/sw/lv_draw_sw_line.c \
../App/lib/lvgl/src/draw/sw/lv_draw_sw_mask.c \
../App/lib/lvgl/src/draw/sw/lv_draw_sw_mask_rect.c \
../App/lib/lvgl/src/draw/sw/lv_draw_sw_transform.c \
../App/lib/lvgl/src/draw/sw/lv_draw_sw_triangle.c \
../App/lib/lvgl/src/draw/sw/lv_draw_sw_vector.c 

OBJS += \
./App/lib/lvgl/src/draw/sw/lv_draw_sw.o \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_arc.o \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_border.o \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_box_shadow.o \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_fill.o \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_gradient.o \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_img.o \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_letter.o \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_line.o \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_mask.o \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_mask_rect.o \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_transform.o \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_triangle.o \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_vector.o 

C_DEPS += \
./App/lib/lvgl/src/draw/sw/lv_draw_sw.d \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_arc.d \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_border.d \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_box_shadow.d \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_fill.d \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_gradient.d \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_img.d \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_letter.d \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_line.d \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_mask.d \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_mask_rect.d \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_transform.d \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_triangle.d \
./App/lib/lvgl/src/draw/sw/lv_draw_sw_vector.d 


# Each subdirectory must supply rules for building sources it contributes
App/lib/lvgl/src/draw/sw/%.o App/lib/lvgl/src/draw/sw/%.su App/lib/lvgl/src/draw/sw/%.cyclo: ../App/lib/lvgl/src/draw/sw/%.c App/lib/lvgl/src/draw/sw/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/include" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I"C:/stm32/balancing_robot/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/core" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_cdc" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_msc" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_hid" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-sw

clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-sw:
	-$(RM) ./App/lib/lvgl/src/draw/sw/lv_draw_sw.cyclo ./App/lib/lvgl/src/draw/sw/lv_draw_sw.d ./App/lib/lvgl/src/draw/sw/lv_draw_sw.o ./App/lib/lvgl/src/draw/sw/lv_draw_sw.su ./App/lib/lvgl/src/draw/sw/lv_draw_sw_arc.cyclo ./App/lib/lvgl/src/draw/sw/lv_draw_sw_arc.d ./App/lib/lvgl/src/draw/sw/lv_draw_sw_arc.o ./App/lib/lvgl/src/draw/sw/lv_draw_sw_arc.su ./App/lib/lvgl/src/draw/sw/lv_draw_sw_border.cyclo ./App/lib/lvgl/src/draw/sw/lv_draw_sw_border.d ./App/lib/lvgl/src/draw/sw/lv_draw_sw_border.o ./App/lib/lvgl/src/draw/sw/lv_draw_sw_border.su ./App/lib/lvgl/src/draw/sw/lv_draw_sw_box_shadow.cyclo ./App/lib/lvgl/src/draw/sw/lv_draw_sw_box_shadow.d ./App/lib/lvgl/src/draw/sw/lv_draw_sw_box_shadow.o ./App/lib/lvgl/src/draw/sw/lv_draw_sw_box_shadow.su ./App/lib/lvgl/src/draw/sw/lv_draw_sw_fill.cyclo ./App/lib/lvgl/src/draw/sw/lv_draw_sw_fill.d ./App/lib/lvgl/src/draw/sw/lv_draw_sw_fill.o ./App/lib/lvgl/src/draw/sw/lv_draw_sw_fill.su ./App/lib/lvgl/src/draw/sw/lv_draw_sw_gradient.cyclo ./App/lib/lvgl/src/draw/sw/lv_draw_sw_gradient.d ./App/lib/lvgl/src/draw/sw/lv_draw_sw_gradient.o ./App/lib/lvgl/src/draw/sw/lv_draw_sw_gradient.su ./App/lib/lvgl/src/draw/sw/lv_draw_sw_img.cyclo ./App/lib/lvgl/src/draw/sw/lv_draw_sw_img.d ./App/lib/lvgl/src/draw/sw/lv_draw_sw_img.o ./App/lib/lvgl/src/draw/sw/lv_draw_sw_img.su ./App/lib/lvgl/src/draw/sw/lv_draw_sw_letter.cyclo ./App/lib/lvgl/src/draw/sw/lv_draw_sw_letter.d ./App/lib/lvgl/src/draw/sw/lv_draw_sw_letter.o ./App/lib/lvgl/src/draw/sw/lv_draw_sw_letter.su ./App/lib/lvgl/src/draw/sw/lv_draw_sw_line.cyclo ./App/lib/lvgl/src/draw/sw/lv_draw_sw_line.d ./App/lib/lvgl/src/draw/sw/lv_draw_sw_line.o ./App/lib/lvgl/src/draw/sw/lv_draw_sw_line.su ./App/lib/lvgl/src/draw/sw/lv_draw_sw_mask.cyclo ./App/lib/lvgl/src/draw/sw/lv_draw_sw_mask.d ./App/lib/lvgl/src/draw/sw/lv_draw_sw_mask.o ./App/lib/lvgl/src/draw/sw/lv_draw_sw_mask.su ./App/lib/lvgl/src/draw/sw/lv_draw_sw_mask_rect.cyclo ./App/lib/lvgl/src/draw/sw/lv_draw_sw_mask_rect.d ./App/lib/lvgl/src/draw/sw/lv_draw_sw_mask_rect.o ./App/lib/lvgl/src/draw/sw/lv_draw_sw_mask_rect.su ./App/lib/lvgl/src/draw/sw/lv_draw_sw_transform.cyclo ./App/lib/lvgl/src/draw/sw/lv_draw_sw_transform.d ./App/lib/lvgl/src/draw/sw/lv_draw_sw_transform.o ./App/lib/lvgl/src/draw/sw/lv_draw_sw_transform.su ./App/lib/lvgl/src/draw/sw/lv_draw_sw_triangle.cyclo ./App/lib/lvgl/src/draw/sw/lv_draw_sw_triangle.d ./App/lib/lvgl/src/draw/sw/lv_draw_sw_triangle.o ./App/lib/lvgl/src/draw/sw/lv_draw_sw_triangle.su ./App/lib/lvgl/src/draw/sw/lv_draw_sw_vector.cyclo ./App/lib/lvgl/src/draw/sw/lv_draw_sw_vector.d ./App/lib/lvgl/src/draw/sw/lv_draw_sw_vector.o ./App/lib/lvgl/src/draw/sw/lv_draw_sw_vector.su

.PHONY: clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-sw

