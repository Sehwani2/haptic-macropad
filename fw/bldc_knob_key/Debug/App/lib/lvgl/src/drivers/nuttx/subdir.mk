################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/lib/lvgl/src/drivers/nuttx/lv_nuttx_cache.c \
../App/lib/lvgl/src/drivers/nuttx/lv_nuttx_entry.c \
../App/lib/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.c \
../App/lib/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.c \
../App/lib/lvgl/src/drivers/nuttx/lv_nuttx_lcd.c \
../App/lib/lvgl/src/drivers/nuttx/lv_nuttx_libuv.c \
../App/lib/lvgl/src/drivers/nuttx/lv_nuttx_profiler.c \
../App/lib/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.c 

OBJS += \
./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_cache.o \
./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_entry.o \
./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.o \
./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.o \
./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_lcd.o \
./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_libuv.o \
./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_profiler.o \
./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.o 

C_DEPS += \
./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_cache.d \
./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_entry.d \
./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.d \
./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.d \
./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_lcd.d \
./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_libuv.d \
./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_profiler.d \
./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.d 


# Each subdirectory must supply rules for building sources it contributes
App/lib/lvgl/src/drivers/nuttx/%.o App/lib/lvgl/src/drivers/nuttx/%.su App/lib/lvgl/src/drivers/nuttx/%.cyclo: ../App/lib/lvgl/src/drivers/nuttx/%.c App/lib/lvgl/src/drivers/nuttx/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/include" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/core" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_cdc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_msc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_hid" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-lib-2f-lvgl-2f-src-2f-drivers-2f-nuttx

clean-App-2f-lib-2f-lvgl-2f-src-2f-drivers-2f-nuttx:
	-$(RM) ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_cache.cyclo ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_cache.d ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_cache.o ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_cache.su ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_entry.cyclo ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_entry.d ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_entry.o ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_entry.su ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.cyclo ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.d ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.o ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.su ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.cyclo ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.d ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.o ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.su ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_lcd.cyclo ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_lcd.d ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_lcd.o ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_lcd.su ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_libuv.cyclo ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_libuv.d ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_libuv.o ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_libuv.su ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_profiler.cyclo ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_profiler.d ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_profiler.o ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_profiler.su ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.cyclo ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.d ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.o ./App/lib/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.su

.PHONY: clean-App-2f-lib-2f-lvgl-2f-src-2f-drivers-2f-nuttx

