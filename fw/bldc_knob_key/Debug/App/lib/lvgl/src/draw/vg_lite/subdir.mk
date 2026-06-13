################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/lib/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.c \
../App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite.c \
../App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.c \
../App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.c \
../App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.c \
../App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.c \
../App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.c \
../App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.c \
../App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.c \
../App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.c \
../App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.c \
../App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.c \
../App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.c \
../App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.c \
../App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_grad.c \
../App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_math.c \
../App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_path.c \
../App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_pending.c \
../App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.c \
../App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_utils.c 

OBJS += \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.o \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite.o \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.o \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.o \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.o \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.o \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.o \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.o \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.o \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.o \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.o \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.o \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.o \
./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.o \
./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_grad.o \
./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_math.o \
./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_path.o \
./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_pending.o \
./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.o \
./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_utils.o 

C_DEPS += \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.d \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite.d \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.d \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.d \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.d \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.d \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.d \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.d \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.d \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.d \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.d \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.d \
./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.d \
./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.d \
./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_grad.d \
./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_math.d \
./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_path.d \
./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_pending.d \
./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.d \
./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_utils.d 


# Each subdirectory must supply rules for building sources it contributes
App/lib/lvgl/src/draw/vg_lite/%.o App/lib/lvgl/src/draw/vg_lite/%.su App/lib/lvgl/src/draw/vg_lite/%.cyclo: ../App/lib/lvgl/src/draw/vg_lite/%.c App/lib/lvgl/src/draw/vg_lite/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/include" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/core" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_cdc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_msc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_hid" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-vg_lite

clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-vg_lite:
	-$(RM) ./App/lib/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.cyclo ./App/lib/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.d ./App/lib/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.o ./App/lib/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.su ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite.cyclo ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite.d ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite.o ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite.su ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.cyclo ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.d ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.o ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.su ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.cyclo ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.d ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.o ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.su ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.cyclo ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.d ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.o ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.su ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.cyclo ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.d ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.o ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.su ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.cyclo ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.d ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.o ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.su ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.cyclo ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.d ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.o ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.su ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.cyclo ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.d ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.o ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.su ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.cyclo ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.d ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.o ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.su ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.cyclo ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.d ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.o ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.su ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.cyclo ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.d ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.o ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.su ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.cyclo ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.d ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.o ./App/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.su ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.cyclo ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.d ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.o ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.su ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_grad.cyclo ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_grad.d ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_grad.o ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_grad.su ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_math.cyclo ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_math.d ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_math.o ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_math.su ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_path.cyclo ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_path.d ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_path.o ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_path.su ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_pending.cyclo ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_pending.d ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_pending.o ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_pending.su ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.cyclo ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.d ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.o ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.su ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_utils.cyclo ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_utils.d ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_utils.o ./App/lib/lvgl/src/draw/vg_lite/lv_vg_lite_utils.su

.PHONY: clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-vg_lite

