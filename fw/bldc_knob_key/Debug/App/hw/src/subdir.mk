################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/hw/src/TMC6300.c \
../App/hw/src/button.c \
../App/hw/src/cdc.c \
../App/hw/src/encoder.c \
../App/hw/src/fat_fs.c \
../App/hw/src/gpio.c \
../App/hw/src/lcd.c \
../App/hw/src/led.c \
../App/hw/src/lvgl.c \
../App/hw/src/sd.c \
../App/hw/src/st7789.c \
../App/hw/src/timer.c \
../App/hw/src/uart.c \
../App/hw/src/usb.c 

OBJS += \
./App/hw/src/TMC6300.o \
./App/hw/src/button.o \
./App/hw/src/cdc.o \
./App/hw/src/encoder.o \
./App/hw/src/fat_fs.o \
./App/hw/src/gpio.o \
./App/hw/src/lcd.o \
./App/hw/src/led.o \
./App/hw/src/lvgl.o \
./App/hw/src/sd.o \
./App/hw/src/st7789.o \
./App/hw/src/timer.o \
./App/hw/src/uart.o \
./App/hw/src/usb.o 

C_DEPS += \
./App/hw/src/TMC6300.d \
./App/hw/src/button.d \
./App/hw/src/cdc.d \
./App/hw/src/encoder.d \
./App/hw/src/fat_fs.d \
./App/hw/src/gpio.d \
./App/hw/src/lcd.d \
./App/hw/src/led.d \
./App/hw/src/lvgl.d \
./App/hw/src/sd.d \
./App/hw/src/st7789.d \
./App/hw/src/timer.d \
./App/hw/src/uart.d \
./App/hw/src/usb.d 


# Each subdirectory must supply rules for building sources it contributes
App/hw/src/%.o App/hw/src/%.su App/hw/src/%.cyclo: ../App/hw/src/%.c App/hw/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/include" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/core" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_cdc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_msc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_hid" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-hw-2f-src

clean-App-2f-hw-2f-src:
	-$(RM) ./App/hw/src/TMC6300.cyclo ./App/hw/src/TMC6300.d ./App/hw/src/TMC6300.o ./App/hw/src/TMC6300.su ./App/hw/src/button.cyclo ./App/hw/src/button.d ./App/hw/src/button.o ./App/hw/src/button.su ./App/hw/src/cdc.cyclo ./App/hw/src/cdc.d ./App/hw/src/cdc.o ./App/hw/src/cdc.su ./App/hw/src/encoder.cyclo ./App/hw/src/encoder.d ./App/hw/src/encoder.o ./App/hw/src/encoder.su ./App/hw/src/fat_fs.cyclo ./App/hw/src/fat_fs.d ./App/hw/src/fat_fs.o ./App/hw/src/fat_fs.su ./App/hw/src/gpio.cyclo ./App/hw/src/gpio.d ./App/hw/src/gpio.o ./App/hw/src/gpio.su ./App/hw/src/lcd.cyclo ./App/hw/src/lcd.d ./App/hw/src/lcd.o ./App/hw/src/lcd.su ./App/hw/src/led.cyclo ./App/hw/src/led.d ./App/hw/src/led.o ./App/hw/src/led.su ./App/hw/src/lvgl.cyclo ./App/hw/src/lvgl.d ./App/hw/src/lvgl.o ./App/hw/src/lvgl.su ./App/hw/src/sd.cyclo ./App/hw/src/sd.d ./App/hw/src/sd.o ./App/hw/src/sd.su ./App/hw/src/st7789.cyclo ./App/hw/src/st7789.d ./App/hw/src/st7789.o ./App/hw/src/st7789.su ./App/hw/src/timer.cyclo ./App/hw/src/timer.d ./App/hw/src/timer.o ./App/hw/src/timer.su ./App/hw/src/uart.cyclo ./App/hw/src/uart.d ./App/hw/src/uart.o ./App/hw/src/uart.su ./App/hw/src/usb.cyclo ./App/hw/src/usb.d ./App/hw/src/usb.o ./App/hw/src/usb.su

.PHONY: clean-App-2f-hw-2f-src

