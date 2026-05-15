################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../App/lib/lvgl/src/draw/sw/blend/helium/lv_blend_helium.S 

OBJS += \
./App/lib/lvgl/src/draw/sw/blend/helium/lv_blend_helium.o 

S_UPPER_DEPS += \
./App/lib/lvgl/src/draw/sw/blend/helium/lv_blend_helium.d 


# Each subdirectory must supply rules for building sources it contributes
App/lib/lvgl/src/draw/sw/blend/helium/%.o: ../App/lib/lvgl/src/draw/sw/blend/helium/%.S App/lib/lvgl/src/draw/sw/blend/helium/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -I"C:/stm32/balancing_robot/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/include" -I"C:/stm32/balancing_robot/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/lvgl" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend-2f-helium

clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend-2f-helium:
	-$(RM) ./App/lib/lvgl/src/draw/sw/blend/helium/lv_blend_helium.d ./App/lib/lvgl/src/draw/sw/blend/helium/lv_blend_helium.o

.PHONY: clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend-2f-helium

