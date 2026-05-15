################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/lib/lvgl/src/core/lv_group.c \
../App/lib/lvgl/src/core/lv_obj.c \
../App/lib/lvgl/src/core/lv_obj_class.c \
../App/lib/lvgl/src/core/lv_obj_draw.c \
../App/lib/lvgl/src/core/lv_obj_event.c \
../App/lib/lvgl/src/core/lv_obj_id_builtin.c \
../App/lib/lvgl/src/core/lv_obj_pos.c \
../App/lib/lvgl/src/core/lv_obj_property.c \
../App/lib/lvgl/src/core/lv_obj_scroll.c \
../App/lib/lvgl/src/core/lv_obj_style.c \
../App/lib/lvgl/src/core/lv_obj_style_gen.c \
../App/lib/lvgl/src/core/lv_obj_tree.c \
../App/lib/lvgl/src/core/lv_refr.c 

OBJS += \
./App/lib/lvgl/src/core/lv_group.o \
./App/lib/lvgl/src/core/lv_obj.o \
./App/lib/lvgl/src/core/lv_obj_class.o \
./App/lib/lvgl/src/core/lv_obj_draw.o \
./App/lib/lvgl/src/core/lv_obj_event.o \
./App/lib/lvgl/src/core/lv_obj_id_builtin.o \
./App/lib/lvgl/src/core/lv_obj_pos.o \
./App/lib/lvgl/src/core/lv_obj_property.o \
./App/lib/lvgl/src/core/lv_obj_scroll.o \
./App/lib/lvgl/src/core/lv_obj_style.o \
./App/lib/lvgl/src/core/lv_obj_style_gen.o \
./App/lib/lvgl/src/core/lv_obj_tree.o \
./App/lib/lvgl/src/core/lv_refr.o 

C_DEPS += \
./App/lib/lvgl/src/core/lv_group.d \
./App/lib/lvgl/src/core/lv_obj.d \
./App/lib/lvgl/src/core/lv_obj_class.d \
./App/lib/lvgl/src/core/lv_obj_draw.d \
./App/lib/lvgl/src/core/lv_obj_event.d \
./App/lib/lvgl/src/core/lv_obj_id_builtin.d \
./App/lib/lvgl/src/core/lv_obj_pos.d \
./App/lib/lvgl/src/core/lv_obj_property.d \
./App/lib/lvgl/src/core/lv_obj_scroll.d \
./App/lib/lvgl/src/core/lv_obj_style.d \
./App/lib/lvgl/src/core/lv_obj_style_gen.d \
./App/lib/lvgl/src/core/lv_obj_tree.d \
./App/lib/lvgl/src/core/lv_refr.d 


# Each subdirectory must supply rules for building sources it contributes
App/lib/lvgl/src/core/%.o App/lib/lvgl/src/core/%.su App/lib/lvgl/src/core/%.cyclo: ../App/lib/lvgl/src/core/%.c App/lib/lvgl/src/core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/include" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I"C:/stm32/balancing_robot/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/core" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_cdc" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_msc" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_hid" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-lib-2f-lvgl-2f-src-2f-core

clean-App-2f-lib-2f-lvgl-2f-src-2f-core:
	-$(RM) ./App/lib/lvgl/src/core/lv_group.cyclo ./App/lib/lvgl/src/core/lv_group.d ./App/lib/lvgl/src/core/lv_group.o ./App/lib/lvgl/src/core/lv_group.su ./App/lib/lvgl/src/core/lv_obj.cyclo ./App/lib/lvgl/src/core/lv_obj.d ./App/lib/lvgl/src/core/lv_obj.o ./App/lib/lvgl/src/core/lv_obj.su ./App/lib/lvgl/src/core/lv_obj_class.cyclo ./App/lib/lvgl/src/core/lv_obj_class.d ./App/lib/lvgl/src/core/lv_obj_class.o ./App/lib/lvgl/src/core/lv_obj_class.su ./App/lib/lvgl/src/core/lv_obj_draw.cyclo ./App/lib/lvgl/src/core/lv_obj_draw.d ./App/lib/lvgl/src/core/lv_obj_draw.o ./App/lib/lvgl/src/core/lv_obj_draw.su ./App/lib/lvgl/src/core/lv_obj_event.cyclo ./App/lib/lvgl/src/core/lv_obj_event.d ./App/lib/lvgl/src/core/lv_obj_event.o ./App/lib/lvgl/src/core/lv_obj_event.su ./App/lib/lvgl/src/core/lv_obj_id_builtin.cyclo ./App/lib/lvgl/src/core/lv_obj_id_builtin.d ./App/lib/lvgl/src/core/lv_obj_id_builtin.o ./App/lib/lvgl/src/core/lv_obj_id_builtin.su ./App/lib/lvgl/src/core/lv_obj_pos.cyclo ./App/lib/lvgl/src/core/lv_obj_pos.d ./App/lib/lvgl/src/core/lv_obj_pos.o ./App/lib/lvgl/src/core/lv_obj_pos.su ./App/lib/lvgl/src/core/lv_obj_property.cyclo ./App/lib/lvgl/src/core/lv_obj_property.d ./App/lib/lvgl/src/core/lv_obj_property.o ./App/lib/lvgl/src/core/lv_obj_property.su ./App/lib/lvgl/src/core/lv_obj_scroll.cyclo ./App/lib/lvgl/src/core/lv_obj_scroll.d ./App/lib/lvgl/src/core/lv_obj_scroll.o ./App/lib/lvgl/src/core/lv_obj_scroll.su ./App/lib/lvgl/src/core/lv_obj_style.cyclo ./App/lib/lvgl/src/core/lv_obj_style.d ./App/lib/lvgl/src/core/lv_obj_style.o ./App/lib/lvgl/src/core/lv_obj_style.su ./App/lib/lvgl/src/core/lv_obj_style_gen.cyclo ./App/lib/lvgl/src/core/lv_obj_style_gen.d ./App/lib/lvgl/src/core/lv_obj_style_gen.o ./App/lib/lvgl/src/core/lv_obj_style_gen.su ./App/lib/lvgl/src/core/lv_obj_tree.cyclo ./App/lib/lvgl/src/core/lv_obj_tree.d ./App/lib/lvgl/src/core/lv_obj_tree.o ./App/lib/lvgl/src/core/lv_obj_tree.su ./App/lib/lvgl/src/core/lv_refr.cyclo ./App/lib/lvgl/src/core/lv_refr.d ./App/lib/lvgl/src/core/lv_refr.o ./App/lib/lvgl/src/core/lv_refr.su

.PHONY: clean-App-2f-lib-2f-lvgl-2f-src-2f-core

