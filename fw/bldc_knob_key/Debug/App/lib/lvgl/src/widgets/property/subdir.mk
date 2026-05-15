################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/lib/lvgl/src/widgets/property/lv_dropdown_properties.c \
../App/lib/lvgl/src/widgets/property/lv_image_properties.c \
../App/lib/lvgl/src/widgets/property/lv_keyboard_properties.c \
../App/lib/lvgl/src/widgets/property/lv_label_properties.c \
../App/lib/lvgl/src/widgets/property/lv_obj_properties.c \
../App/lib/lvgl/src/widgets/property/lv_roller_properties.c \
../App/lib/lvgl/src/widgets/property/lv_style_properties.c \
../App/lib/lvgl/src/widgets/property/lv_textarea_properties.c 

OBJS += \
./App/lib/lvgl/src/widgets/property/lv_dropdown_properties.o \
./App/lib/lvgl/src/widgets/property/lv_image_properties.o \
./App/lib/lvgl/src/widgets/property/lv_keyboard_properties.o \
./App/lib/lvgl/src/widgets/property/lv_label_properties.o \
./App/lib/lvgl/src/widgets/property/lv_obj_properties.o \
./App/lib/lvgl/src/widgets/property/lv_roller_properties.o \
./App/lib/lvgl/src/widgets/property/lv_style_properties.o \
./App/lib/lvgl/src/widgets/property/lv_textarea_properties.o 

C_DEPS += \
./App/lib/lvgl/src/widgets/property/lv_dropdown_properties.d \
./App/lib/lvgl/src/widgets/property/lv_image_properties.d \
./App/lib/lvgl/src/widgets/property/lv_keyboard_properties.d \
./App/lib/lvgl/src/widgets/property/lv_label_properties.d \
./App/lib/lvgl/src/widgets/property/lv_obj_properties.d \
./App/lib/lvgl/src/widgets/property/lv_roller_properties.d \
./App/lib/lvgl/src/widgets/property/lv_style_properties.d \
./App/lib/lvgl/src/widgets/property/lv_textarea_properties.d 


# Each subdirectory must supply rules for building sources it contributes
App/lib/lvgl/src/widgets/property/%.o App/lib/lvgl/src/widgets/property/%.su App/lib/lvgl/src/widgets/property/%.cyclo: ../App/lib/lvgl/src/widgets/property/%.c App/lib/lvgl/src/widgets/property/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/include" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I"C:/stm32/balancing_robot/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/core" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_cdc" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_msc" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_hid" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-lib-2f-lvgl-2f-src-2f-widgets-2f-property

clean-App-2f-lib-2f-lvgl-2f-src-2f-widgets-2f-property:
	-$(RM) ./App/lib/lvgl/src/widgets/property/lv_dropdown_properties.cyclo ./App/lib/lvgl/src/widgets/property/lv_dropdown_properties.d ./App/lib/lvgl/src/widgets/property/lv_dropdown_properties.o ./App/lib/lvgl/src/widgets/property/lv_dropdown_properties.su ./App/lib/lvgl/src/widgets/property/lv_image_properties.cyclo ./App/lib/lvgl/src/widgets/property/lv_image_properties.d ./App/lib/lvgl/src/widgets/property/lv_image_properties.o ./App/lib/lvgl/src/widgets/property/lv_image_properties.su ./App/lib/lvgl/src/widgets/property/lv_keyboard_properties.cyclo ./App/lib/lvgl/src/widgets/property/lv_keyboard_properties.d ./App/lib/lvgl/src/widgets/property/lv_keyboard_properties.o ./App/lib/lvgl/src/widgets/property/lv_keyboard_properties.su ./App/lib/lvgl/src/widgets/property/lv_label_properties.cyclo ./App/lib/lvgl/src/widgets/property/lv_label_properties.d ./App/lib/lvgl/src/widgets/property/lv_label_properties.o ./App/lib/lvgl/src/widgets/property/lv_label_properties.su ./App/lib/lvgl/src/widgets/property/lv_obj_properties.cyclo ./App/lib/lvgl/src/widgets/property/lv_obj_properties.d ./App/lib/lvgl/src/widgets/property/lv_obj_properties.o ./App/lib/lvgl/src/widgets/property/lv_obj_properties.su ./App/lib/lvgl/src/widgets/property/lv_roller_properties.cyclo ./App/lib/lvgl/src/widgets/property/lv_roller_properties.d ./App/lib/lvgl/src/widgets/property/lv_roller_properties.o ./App/lib/lvgl/src/widgets/property/lv_roller_properties.su ./App/lib/lvgl/src/widgets/property/lv_style_properties.cyclo ./App/lib/lvgl/src/widgets/property/lv_style_properties.d ./App/lib/lvgl/src/widgets/property/lv_style_properties.o ./App/lib/lvgl/src/widgets/property/lv_style_properties.su ./App/lib/lvgl/src/widgets/property/lv_textarea_properties.cyclo ./App/lib/lvgl/src/widgets/property/lv_textarea_properties.d ./App/lib/lvgl/src/widgets/property/lv_textarea_properties.o ./App/lib/lvgl/src/widgets/property/lv_textarea_properties.su

.PHONY: clean-App-2f-lib-2f-lvgl-2f-src-2f-widgets-2f-property

