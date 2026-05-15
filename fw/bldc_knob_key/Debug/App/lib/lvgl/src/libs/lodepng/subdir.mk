################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/lib/lvgl/src/libs/lodepng/lodepng.c \
../App/lib/lvgl/src/libs/lodepng/lv_lodepng.c 

OBJS += \
./App/lib/lvgl/src/libs/lodepng/lodepng.o \
./App/lib/lvgl/src/libs/lodepng/lv_lodepng.o 

C_DEPS += \
./App/lib/lvgl/src/libs/lodepng/lodepng.d \
./App/lib/lvgl/src/libs/lodepng/lv_lodepng.d 


# Each subdirectory must supply rules for building sources it contributes
App/lib/lvgl/src/libs/lodepng/%.o App/lib/lvgl/src/libs/lodepng/%.su App/lib/lvgl/src/libs/lodepng/%.cyclo: ../App/lib/lvgl/src/libs/lodepng/%.c App/lib/lvgl/src/libs/lodepng/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/include" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I"C:/stm32/balancing_robot/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/core" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_cdc" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_msc" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_hid" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-lib-2f-lvgl-2f-src-2f-libs-2f-lodepng

clean-App-2f-lib-2f-lvgl-2f-src-2f-libs-2f-lodepng:
	-$(RM) ./App/lib/lvgl/src/libs/lodepng/lodepng.cyclo ./App/lib/lvgl/src/libs/lodepng/lodepng.d ./App/lib/lvgl/src/libs/lodepng/lodepng.o ./App/lib/lvgl/src/libs/lodepng/lodepng.su ./App/lib/lvgl/src/libs/lodepng/lv_lodepng.cyclo ./App/lib/lvgl/src/libs/lodepng/lv_lodepng.d ./App/lib/lvgl/src/libs/lodepng/lv_lodepng.o ./App/lib/lvgl/src/libs/lodepng/lv_lodepng.su

.PHONY: clean-App-2f-lib-2f-lvgl-2f-src-2f-libs-2f-lodepng

