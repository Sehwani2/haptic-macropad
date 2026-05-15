################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/lib/lvgl/src/draw/nxp/vglite/lv_draw_buf_vglite.c \
../App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite.c \
../App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.c \
../App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_border.c \
../App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_fill.c \
../App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_img.c \
../App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_label.c \
../App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_layer.c \
../App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_line.c \
../App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_triangle.c \
../App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_buf.c \
../App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_matrix.c \
../App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_path.c \
../App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_utils.c 

OBJS += \
./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_buf_vglite.o \
./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite.o \
./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.o \
./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_border.o \
./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_fill.o \
./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_img.o \
./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_label.o \
./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_layer.o \
./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_line.o \
./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_triangle.o \
./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_buf.o \
./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_matrix.o \
./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_path.o \
./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_utils.o 

C_DEPS += \
./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_buf_vglite.d \
./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite.d \
./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.d \
./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_border.d \
./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_fill.d \
./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_img.d \
./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_label.d \
./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_layer.d \
./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_line.d \
./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_triangle.d \
./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_buf.d \
./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_matrix.d \
./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_path.d \
./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_utils.d 


# Each subdirectory must supply rules for building sources it contributes
App/lib/lvgl/src/draw/nxp/vglite/%.o App/lib/lvgl/src/draw/nxp/vglite/%.su App/lib/lvgl/src/draw/nxp/vglite/%.cyclo: ../App/lib/lvgl/src/draw/nxp/vglite/%.c App/lib/lvgl/src/draw/nxp/vglite/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/include" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I"C:/stm32/balancing_robot/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/core" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_cdc" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_msc" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_hid" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-vglite

clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-vglite:
	-$(RM) ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_buf_vglite.cyclo ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_buf_vglite.d ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_buf_vglite.o ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_buf_vglite.su ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite.cyclo ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite.d ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite.o ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite.su ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.cyclo ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.d ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.o ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.su ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_border.cyclo ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_border.d ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_border.o ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_border.su ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_fill.cyclo ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_fill.d ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_fill.o ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_fill.su ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_img.cyclo ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_img.d ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_img.o ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_img.su ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_label.cyclo ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_label.d ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_label.o ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_label.su ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_layer.cyclo ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_layer.d ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_layer.o ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_layer.su ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_line.cyclo ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_line.d ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_line.o ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_line.su ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_triangle.cyclo ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_triangle.d ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_triangle.o ./App/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_triangle.su ./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_buf.cyclo ./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_buf.d ./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_buf.o ./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_buf.su ./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_matrix.cyclo ./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_matrix.d ./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_matrix.o ./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_matrix.su ./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_path.cyclo ./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_path.d ./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_path.o ./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_path.su ./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_utils.cyclo ./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_utils.d ./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_utils.o ./App/lib/lvgl/src/draw/nxp/vglite/lv_vglite_utils.su

.PHONY: clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-vglite

