################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/hw/src/lvgl/lv_port_disp.c \
../App/hw/src/lvgl/lv_port_fs.c \
../App/hw/src/lvgl/lv_port_indev.c 

OBJS += \
./App/hw/src/lvgl/lv_port_disp.o \
./App/hw/src/lvgl/lv_port_fs.o \
./App/hw/src/lvgl/lv_port_indev.o 

C_DEPS += \
./App/hw/src/lvgl/lv_port_disp.d \
./App/hw/src/lvgl/lv_port_fs.d \
./App/hw/src/lvgl/lv_port_indev.d 


# Each subdirectory must supply rules for building sources it contributes
App/hw/src/lvgl/%.o App/hw/src/lvgl/%.su App/hw/src/lvgl/%.cyclo: ../App/hw/src/lvgl/%.c App/hw/src/lvgl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/include" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I"C:/stm32/balancing_robot/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/core" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_cdc" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_msc" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_hid" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-hw-2f-src-2f-lvgl

clean-App-2f-hw-2f-src-2f-lvgl:
	-$(RM) ./App/hw/src/lvgl/lv_port_disp.cyclo ./App/hw/src/lvgl/lv_port_disp.d ./App/hw/src/lvgl/lv_port_disp.o ./App/hw/src/lvgl/lv_port_disp.su ./App/hw/src/lvgl/lv_port_fs.cyclo ./App/hw/src/lvgl/lv_port_fs.d ./App/hw/src/lvgl/lv_port_fs.o ./App/hw/src/lvgl/lv_port_fs.su ./App/hw/src/lvgl/lv_port_indev.cyclo ./App/hw/src/lvgl/lv_port_indev.d ./App/hw/src/lvgl/lv_port_indev.o ./App/hw/src/lvgl/lv_port_indev.su

.PHONY: clean-App-2f-hw-2f-src-2f-lvgl

