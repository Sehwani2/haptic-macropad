################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/lib/lvgl/src/draw/lv_draw.c \
../App/lib/lvgl/src/draw/lv_draw_arc.c \
../App/lib/lvgl/src/draw/lv_draw_buf.c \
../App/lib/lvgl/src/draw/lv_draw_image.c \
../App/lib/lvgl/src/draw/lv_draw_label.c \
../App/lib/lvgl/src/draw/lv_draw_line.c \
../App/lib/lvgl/src/draw/lv_draw_mask.c \
../App/lib/lvgl/src/draw/lv_draw_rect.c \
../App/lib/lvgl/src/draw/lv_draw_triangle.c \
../App/lib/lvgl/src/draw/lv_draw_vector.c \
../App/lib/lvgl/src/draw/lv_image_decoder.c 

OBJS += \
./App/lib/lvgl/src/draw/lv_draw.o \
./App/lib/lvgl/src/draw/lv_draw_arc.o \
./App/lib/lvgl/src/draw/lv_draw_buf.o \
./App/lib/lvgl/src/draw/lv_draw_image.o \
./App/lib/lvgl/src/draw/lv_draw_label.o \
./App/lib/lvgl/src/draw/lv_draw_line.o \
./App/lib/lvgl/src/draw/lv_draw_mask.o \
./App/lib/lvgl/src/draw/lv_draw_rect.o \
./App/lib/lvgl/src/draw/lv_draw_triangle.o \
./App/lib/lvgl/src/draw/lv_draw_vector.o \
./App/lib/lvgl/src/draw/lv_image_decoder.o 

C_DEPS += \
./App/lib/lvgl/src/draw/lv_draw.d \
./App/lib/lvgl/src/draw/lv_draw_arc.d \
./App/lib/lvgl/src/draw/lv_draw_buf.d \
./App/lib/lvgl/src/draw/lv_draw_image.d \
./App/lib/lvgl/src/draw/lv_draw_label.d \
./App/lib/lvgl/src/draw/lv_draw_line.d \
./App/lib/lvgl/src/draw/lv_draw_mask.d \
./App/lib/lvgl/src/draw/lv_draw_rect.d \
./App/lib/lvgl/src/draw/lv_draw_triangle.d \
./App/lib/lvgl/src/draw/lv_draw_vector.d \
./App/lib/lvgl/src/draw/lv_image_decoder.d 


# Each subdirectory must supply rules for building sources it contributes
App/lib/lvgl/src/draw/%.o App/lib/lvgl/src/draw/%.su App/lib/lvgl/src/draw/%.cyclo: ../App/lib/lvgl/src/draw/%.c App/lib/lvgl/src/draw/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/include" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/core" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_cdc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_msc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_hid" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-lib-2f-lvgl-2f-src-2f-draw

clean-App-2f-lib-2f-lvgl-2f-src-2f-draw:
	-$(RM) ./App/lib/lvgl/src/draw/lv_draw.cyclo ./App/lib/lvgl/src/draw/lv_draw.d ./App/lib/lvgl/src/draw/lv_draw.o ./App/lib/lvgl/src/draw/lv_draw.su ./App/lib/lvgl/src/draw/lv_draw_arc.cyclo ./App/lib/lvgl/src/draw/lv_draw_arc.d ./App/lib/lvgl/src/draw/lv_draw_arc.o ./App/lib/lvgl/src/draw/lv_draw_arc.su ./App/lib/lvgl/src/draw/lv_draw_buf.cyclo ./App/lib/lvgl/src/draw/lv_draw_buf.d ./App/lib/lvgl/src/draw/lv_draw_buf.o ./App/lib/lvgl/src/draw/lv_draw_buf.su ./App/lib/lvgl/src/draw/lv_draw_image.cyclo ./App/lib/lvgl/src/draw/lv_draw_image.d ./App/lib/lvgl/src/draw/lv_draw_image.o ./App/lib/lvgl/src/draw/lv_draw_image.su ./App/lib/lvgl/src/draw/lv_draw_label.cyclo ./App/lib/lvgl/src/draw/lv_draw_label.d ./App/lib/lvgl/src/draw/lv_draw_label.o ./App/lib/lvgl/src/draw/lv_draw_label.su ./App/lib/lvgl/src/draw/lv_draw_line.cyclo ./App/lib/lvgl/src/draw/lv_draw_line.d ./App/lib/lvgl/src/draw/lv_draw_line.o ./App/lib/lvgl/src/draw/lv_draw_line.su ./App/lib/lvgl/src/draw/lv_draw_mask.cyclo ./App/lib/lvgl/src/draw/lv_draw_mask.d ./App/lib/lvgl/src/draw/lv_draw_mask.o ./App/lib/lvgl/src/draw/lv_draw_mask.su ./App/lib/lvgl/src/draw/lv_draw_rect.cyclo ./App/lib/lvgl/src/draw/lv_draw_rect.d ./App/lib/lvgl/src/draw/lv_draw_rect.o ./App/lib/lvgl/src/draw/lv_draw_rect.su ./App/lib/lvgl/src/draw/lv_draw_triangle.cyclo ./App/lib/lvgl/src/draw/lv_draw_triangle.d ./App/lib/lvgl/src/draw/lv_draw_triangle.o ./App/lib/lvgl/src/draw/lv_draw_triangle.su ./App/lib/lvgl/src/draw/lv_draw_vector.cyclo ./App/lib/lvgl/src/draw/lv_draw_vector.d ./App/lib/lvgl/src/draw/lv_draw_vector.o ./App/lib/lvgl/src/draw/lv_draw_vector.su ./App/lib/lvgl/src/draw/lv_image_decoder.cyclo ./App/lib/lvgl/src/draw/lv_image_decoder.d ./App/lib/lvgl/src/draw/lv_image_decoder.o ./App/lib/lvgl/src/draw/lv_image_decoder.su

.PHONY: clean-App-2f-lib-2f-lvgl-2f-src-2f-draw

