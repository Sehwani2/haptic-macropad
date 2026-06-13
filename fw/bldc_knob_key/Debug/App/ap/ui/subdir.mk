################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/ap/ui/ui_home.c \
../App/ap/ui/ui_macro.c \
../App/ap/ui/ui_manager.c 

OBJS += \
./App/ap/ui/ui_home.o \
./App/ap/ui/ui_macro.o \
./App/ap/ui/ui_manager.o 

C_DEPS += \
./App/ap/ui/ui_home.d \
./App/ap/ui/ui_macro.d \
./App/ap/ui/ui_manager.d 


# Each subdirectory must supply rules for building sources it contributes
App/ap/ui/%.o App/ap/ui/%.su App/ap/ui/%.cyclo: ../App/ap/ui/%.c App/ap/ui/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/include" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/core" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_cdc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_msc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_hid" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-ap-2f-ui

clean-App-2f-ap-2f-ui:
	-$(RM) ./App/ap/ui/ui_home.cyclo ./App/ap/ui/ui_home.d ./App/ap/ui/ui_home.o ./App/ap/ui/ui_home.su ./App/ap/ui/ui_macro.cyclo ./App/ap/ui/ui_macro.d ./App/ap/ui/ui_macro.o ./App/ap/ui/ui_macro.su ./App/ap/ui/ui_manager.cyclo ./App/ap/ui/ui_manager.d ./App/ap/ui/ui_manager.o ./App/ap/ui/ui_manager.su

.PHONY: clean-App-2f-ap-2f-ui

