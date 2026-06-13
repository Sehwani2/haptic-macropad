################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/lib/lvgl/src/libs/fsdrv/lv_fs_cbfs.c \
../App/lib/lvgl/src/libs/fsdrv/lv_fs_fatfs.c \
../App/lib/lvgl/src/libs/fsdrv/lv_fs_littlefs.c \
../App/lib/lvgl/src/libs/fsdrv/lv_fs_memfs.c \
../App/lib/lvgl/src/libs/fsdrv/lv_fs_posix.c \
../App/lib/lvgl/src/libs/fsdrv/lv_fs_stdio.c \
../App/lib/lvgl/src/libs/fsdrv/lv_fs_win32.c 

OBJS += \
./App/lib/lvgl/src/libs/fsdrv/lv_fs_cbfs.o \
./App/lib/lvgl/src/libs/fsdrv/lv_fs_fatfs.o \
./App/lib/lvgl/src/libs/fsdrv/lv_fs_littlefs.o \
./App/lib/lvgl/src/libs/fsdrv/lv_fs_memfs.o \
./App/lib/lvgl/src/libs/fsdrv/lv_fs_posix.o \
./App/lib/lvgl/src/libs/fsdrv/lv_fs_stdio.o \
./App/lib/lvgl/src/libs/fsdrv/lv_fs_win32.o 

C_DEPS += \
./App/lib/lvgl/src/libs/fsdrv/lv_fs_cbfs.d \
./App/lib/lvgl/src/libs/fsdrv/lv_fs_fatfs.d \
./App/lib/lvgl/src/libs/fsdrv/lv_fs_littlefs.d \
./App/lib/lvgl/src/libs/fsdrv/lv_fs_memfs.d \
./App/lib/lvgl/src/libs/fsdrv/lv_fs_posix.d \
./App/lib/lvgl/src/libs/fsdrv/lv_fs_stdio.d \
./App/lib/lvgl/src/libs/fsdrv/lv_fs_win32.d 


# Each subdirectory must supply rules for building sources it contributes
App/lib/lvgl/src/libs/fsdrv/%.o App/lib/lvgl/src/libs/fsdrv/%.su App/lib/lvgl/src/libs/fsdrv/%.cyclo: ../App/lib/lvgl/src/libs/fsdrv/%.c App/lib/lvgl/src/libs/fsdrv/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/include" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/core" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_cdc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_msc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_hid" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-lib-2f-lvgl-2f-src-2f-libs-2f-fsdrv

clean-App-2f-lib-2f-lvgl-2f-src-2f-libs-2f-fsdrv:
	-$(RM) ./App/lib/lvgl/src/libs/fsdrv/lv_fs_cbfs.cyclo ./App/lib/lvgl/src/libs/fsdrv/lv_fs_cbfs.d ./App/lib/lvgl/src/libs/fsdrv/lv_fs_cbfs.o ./App/lib/lvgl/src/libs/fsdrv/lv_fs_cbfs.su ./App/lib/lvgl/src/libs/fsdrv/lv_fs_fatfs.cyclo ./App/lib/lvgl/src/libs/fsdrv/lv_fs_fatfs.d ./App/lib/lvgl/src/libs/fsdrv/lv_fs_fatfs.o ./App/lib/lvgl/src/libs/fsdrv/lv_fs_fatfs.su ./App/lib/lvgl/src/libs/fsdrv/lv_fs_littlefs.cyclo ./App/lib/lvgl/src/libs/fsdrv/lv_fs_littlefs.d ./App/lib/lvgl/src/libs/fsdrv/lv_fs_littlefs.o ./App/lib/lvgl/src/libs/fsdrv/lv_fs_littlefs.su ./App/lib/lvgl/src/libs/fsdrv/lv_fs_memfs.cyclo ./App/lib/lvgl/src/libs/fsdrv/lv_fs_memfs.d ./App/lib/lvgl/src/libs/fsdrv/lv_fs_memfs.o ./App/lib/lvgl/src/libs/fsdrv/lv_fs_memfs.su ./App/lib/lvgl/src/libs/fsdrv/lv_fs_posix.cyclo ./App/lib/lvgl/src/libs/fsdrv/lv_fs_posix.d ./App/lib/lvgl/src/libs/fsdrv/lv_fs_posix.o ./App/lib/lvgl/src/libs/fsdrv/lv_fs_posix.su ./App/lib/lvgl/src/libs/fsdrv/lv_fs_stdio.cyclo ./App/lib/lvgl/src/libs/fsdrv/lv_fs_stdio.d ./App/lib/lvgl/src/libs/fsdrv/lv_fs_stdio.o ./App/lib/lvgl/src/libs/fsdrv/lv_fs_stdio.su ./App/lib/lvgl/src/libs/fsdrv/lv_fs_win32.cyclo ./App/lib/lvgl/src/libs/fsdrv/lv_fs_win32.d ./App/lib/lvgl/src/libs/fsdrv/lv_fs_win32.o ./App/lib/lvgl/src/libs/fsdrv/lv_fs_win32.su

.PHONY: clean-App-2f-lib-2f-lvgl-2f-src-2f-libs-2f-fsdrv

