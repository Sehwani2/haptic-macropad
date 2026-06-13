################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/hw/src/usb/usb_msc/usbd_desc.c \
../App/hw/src/usb/usb_msc/usbd_msc.c \
../App/hw/src/usb/usb_msc/usbd_msc_bot.c \
../App/hw/src/usb/usb_msc/usbd_msc_data.c \
../App/hw/src/usb/usb_msc/usbd_msc_scsi.c \
../App/hw/src/usb/usb_msc/usbd_storage_if.c 

OBJS += \
./App/hw/src/usb/usb_msc/usbd_desc.o \
./App/hw/src/usb/usb_msc/usbd_msc.o \
./App/hw/src/usb/usb_msc/usbd_msc_bot.o \
./App/hw/src/usb/usb_msc/usbd_msc_data.o \
./App/hw/src/usb/usb_msc/usbd_msc_scsi.o \
./App/hw/src/usb/usb_msc/usbd_storage_if.o 

C_DEPS += \
./App/hw/src/usb/usb_msc/usbd_desc.d \
./App/hw/src/usb/usb_msc/usbd_msc.d \
./App/hw/src/usb/usb_msc/usbd_msc_bot.d \
./App/hw/src/usb/usb_msc/usbd_msc_data.d \
./App/hw/src/usb/usb_msc/usbd_msc_scsi.d \
./App/hw/src/usb/usb_msc/usbd_storage_if.d 


# Each subdirectory must supply rules for building sources it contributes
App/hw/src/usb/usb_msc/%.o App/hw/src/usb/usb_msc/%.su App/hw/src/usb/usb_msc/%.cyclo: ../App/hw/src/usb/usb_msc/%.c App/hw/src/usb/usb_msc/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/include" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/core" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_cdc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_msc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_hid" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-hw-2f-src-2f-usb-2f-usb_msc

clean-App-2f-hw-2f-src-2f-usb-2f-usb_msc:
	-$(RM) ./App/hw/src/usb/usb_msc/usbd_desc.cyclo ./App/hw/src/usb/usb_msc/usbd_desc.d ./App/hw/src/usb/usb_msc/usbd_desc.o ./App/hw/src/usb/usb_msc/usbd_desc.su ./App/hw/src/usb/usb_msc/usbd_msc.cyclo ./App/hw/src/usb/usb_msc/usbd_msc.d ./App/hw/src/usb/usb_msc/usbd_msc.o ./App/hw/src/usb/usb_msc/usbd_msc.su ./App/hw/src/usb/usb_msc/usbd_msc_bot.cyclo ./App/hw/src/usb/usb_msc/usbd_msc_bot.d ./App/hw/src/usb/usb_msc/usbd_msc_bot.o ./App/hw/src/usb/usb_msc/usbd_msc_bot.su ./App/hw/src/usb/usb_msc/usbd_msc_data.cyclo ./App/hw/src/usb/usb_msc/usbd_msc_data.d ./App/hw/src/usb/usb_msc/usbd_msc_data.o ./App/hw/src/usb/usb_msc/usbd_msc_data.su ./App/hw/src/usb/usb_msc/usbd_msc_scsi.cyclo ./App/hw/src/usb/usb_msc/usbd_msc_scsi.d ./App/hw/src/usb/usb_msc/usbd_msc_scsi.o ./App/hw/src/usb/usb_msc/usbd_msc_scsi.su ./App/hw/src/usb/usb_msc/usbd_storage_if.cyclo ./App/hw/src/usb/usb_msc/usbd_storage_if.d ./App/hw/src/usb/usb_msc/usbd_storage_if.o ./App/hw/src/usb/usb_msc/usbd_storage_if.su

.PHONY: clean-App-2f-hw-2f-src-2f-usb-2f-usb_msc

