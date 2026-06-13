################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/lib/lvgl/src/misc/lv_anim.c \
../App/lib/lvgl/src/misc/lv_anim_timeline.c \
../App/lib/lvgl/src/misc/lv_area.c \
../App/lib/lvgl/src/misc/lv_array.c \
../App/lib/lvgl/src/misc/lv_async.c \
../App/lib/lvgl/src/misc/lv_bidi.c \
../App/lib/lvgl/src/misc/lv_color.c \
../App/lib/lvgl/src/misc/lv_color_op.c \
../App/lib/lvgl/src/misc/lv_event.c \
../App/lib/lvgl/src/misc/lv_fs.c \
../App/lib/lvgl/src/misc/lv_ll.c \
../App/lib/lvgl/src/misc/lv_log.c \
../App/lib/lvgl/src/misc/lv_lru.c \
../App/lib/lvgl/src/misc/lv_math.c \
../App/lib/lvgl/src/misc/lv_matrix.c \
../App/lib/lvgl/src/misc/lv_palette.c \
../App/lib/lvgl/src/misc/lv_profiler_builtin.c \
../App/lib/lvgl/src/misc/lv_rb.c \
../App/lib/lvgl/src/misc/lv_style.c \
../App/lib/lvgl/src/misc/lv_style_gen.c \
../App/lib/lvgl/src/misc/lv_templ.c \
../App/lib/lvgl/src/misc/lv_text.c \
../App/lib/lvgl/src/misc/lv_text_ap.c \
../App/lib/lvgl/src/misc/lv_timer.c \
../App/lib/lvgl/src/misc/lv_utils.c 

OBJS += \
./App/lib/lvgl/src/misc/lv_anim.o \
./App/lib/lvgl/src/misc/lv_anim_timeline.o \
./App/lib/lvgl/src/misc/lv_area.o \
./App/lib/lvgl/src/misc/lv_array.o \
./App/lib/lvgl/src/misc/lv_async.o \
./App/lib/lvgl/src/misc/lv_bidi.o \
./App/lib/lvgl/src/misc/lv_color.o \
./App/lib/lvgl/src/misc/lv_color_op.o \
./App/lib/lvgl/src/misc/lv_event.o \
./App/lib/lvgl/src/misc/lv_fs.o \
./App/lib/lvgl/src/misc/lv_ll.o \
./App/lib/lvgl/src/misc/lv_log.o \
./App/lib/lvgl/src/misc/lv_lru.o \
./App/lib/lvgl/src/misc/lv_math.o \
./App/lib/lvgl/src/misc/lv_matrix.o \
./App/lib/lvgl/src/misc/lv_palette.o \
./App/lib/lvgl/src/misc/lv_profiler_builtin.o \
./App/lib/lvgl/src/misc/lv_rb.o \
./App/lib/lvgl/src/misc/lv_style.o \
./App/lib/lvgl/src/misc/lv_style_gen.o \
./App/lib/lvgl/src/misc/lv_templ.o \
./App/lib/lvgl/src/misc/lv_text.o \
./App/lib/lvgl/src/misc/lv_text_ap.o \
./App/lib/lvgl/src/misc/lv_timer.o \
./App/lib/lvgl/src/misc/lv_utils.o 

C_DEPS += \
./App/lib/lvgl/src/misc/lv_anim.d \
./App/lib/lvgl/src/misc/lv_anim_timeline.d \
./App/lib/lvgl/src/misc/lv_area.d \
./App/lib/lvgl/src/misc/lv_array.d \
./App/lib/lvgl/src/misc/lv_async.d \
./App/lib/lvgl/src/misc/lv_bidi.d \
./App/lib/lvgl/src/misc/lv_color.d \
./App/lib/lvgl/src/misc/lv_color_op.d \
./App/lib/lvgl/src/misc/lv_event.d \
./App/lib/lvgl/src/misc/lv_fs.d \
./App/lib/lvgl/src/misc/lv_ll.d \
./App/lib/lvgl/src/misc/lv_log.d \
./App/lib/lvgl/src/misc/lv_lru.d \
./App/lib/lvgl/src/misc/lv_math.d \
./App/lib/lvgl/src/misc/lv_matrix.d \
./App/lib/lvgl/src/misc/lv_palette.d \
./App/lib/lvgl/src/misc/lv_profiler_builtin.d \
./App/lib/lvgl/src/misc/lv_rb.d \
./App/lib/lvgl/src/misc/lv_style.d \
./App/lib/lvgl/src/misc/lv_style_gen.d \
./App/lib/lvgl/src/misc/lv_templ.d \
./App/lib/lvgl/src/misc/lv_text.d \
./App/lib/lvgl/src/misc/lv_text_ap.d \
./App/lib/lvgl/src/misc/lv_timer.d \
./App/lib/lvgl/src/misc/lv_utils.d 


# Each subdirectory must supply rules for building sources it contributes
App/lib/lvgl/src/misc/%.o App/lib/lvgl/src/misc/%.su App/lib/lvgl/src/misc/%.cyclo: ../App/lib/lvgl/src/misc/%.c App/lib/lvgl/src/misc/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/include" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/core" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_cdc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_msc" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/usb/usb_hid" -I"C:/stm32/balancing_robot/haptic-macropad/fw/bldc_knob_key/App/hw/src/lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-lib-2f-lvgl-2f-src-2f-misc

clean-App-2f-lib-2f-lvgl-2f-src-2f-misc:
	-$(RM) ./App/lib/lvgl/src/misc/lv_anim.cyclo ./App/lib/lvgl/src/misc/lv_anim.d ./App/lib/lvgl/src/misc/lv_anim.o ./App/lib/lvgl/src/misc/lv_anim.su ./App/lib/lvgl/src/misc/lv_anim_timeline.cyclo ./App/lib/lvgl/src/misc/lv_anim_timeline.d ./App/lib/lvgl/src/misc/lv_anim_timeline.o ./App/lib/lvgl/src/misc/lv_anim_timeline.su ./App/lib/lvgl/src/misc/lv_area.cyclo ./App/lib/lvgl/src/misc/lv_area.d ./App/lib/lvgl/src/misc/lv_area.o ./App/lib/lvgl/src/misc/lv_area.su ./App/lib/lvgl/src/misc/lv_array.cyclo ./App/lib/lvgl/src/misc/lv_array.d ./App/lib/lvgl/src/misc/lv_array.o ./App/lib/lvgl/src/misc/lv_array.su ./App/lib/lvgl/src/misc/lv_async.cyclo ./App/lib/lvgl/src/misc/lv_async.d ./App/lib/lvgl/src/misc/lv_async.o ./App/lib/lvgl/src/misc/lv_async.su ./App/lib/lvgl/src/misc/lv_bidi.cyclo ./App/lib/lvgl/src/misc/lv_bidi.d ./App/lib/lvgl/src/misc/lv_bidi.o ./App/lib/lvgl/src/misc/lv_bidi.su ./App/lib/lvgl/src/misc/lv_color.cyclo ./App/lib/lvgl/src/misc/lv_color.d ./App/lib/lvgl/src/misc/lv_color.o ./App/lib/lvgl/src/misc/lv_color.su ./App/lib/lvgl/src/misc/lv_color_op.cyclo ./App/lib/lvgl/src/misc/lv_color_op.d ./App/lib/lvgl/src/misc/lv_color_op.o ./App/lib/lvgl/src/misc/lv_color_op.su ./App/lib/lvgl/src/misc/lv_event.cyclo ./App/lib/lvgl/src/misc/lv_event.d ./App/lib/lvgl/src/misc/lv_event.o ./App/lib/lvgl/src/misc/lv_event.su ./App/lib/lvgl/src/misc/lv_fs.cyclo ./App/lib/lvgl/src/misc/lv_fs.d ./App/lib/lvgl/src/misc/lv_fs.o ./App/lib/lvgl/src/misc/lv_fs.su ./App/lib/lvgl/src/misc/lv_ll.cyclo ./App/lib/lvgl/src/misc/lv_ll.d ./App/lib/lvgl/src/misc/lv_ll.o ./App/lib/lvgl/src/misc/lv_ll.su ./App/lib/lvgl/src/misc/lv_log.cyclo ./App/lib/lvgl/src/misc/lv_log.d ./App/lib/lvgl/src/misc/lv_log.o ./App/lib/lvgl/src/misc/lv_log.su ./App/lib/lvgl/src/misc/lv_lru.cyclo ./App/lib/lvgl/src/misc/lv_lru.d ./App/lib/lvgl/src/misc/lv_lru.o ./App/lib/lvgl/src/misc/lv_lru.su ./App/lib/lvgl/src/misc/lv_math.cyclo ./App/lib/lvgl/src/misc/lv_math.d ./App/lib/lvgl/src/misc/lv_math.o ./App/lib/lvgl/src/misc/lv_math.su ./App/lib/lvgl/src/misc/lv_matrix.cyclo ./App/lib/lvgl/src/misc/lv_matrix.d ./App/lib/lvgl/src/misc/lv_matrix.o ./App/lib/lvgl/src/misc/lv_matrix.su ./App/lib/lvgl/src/misc/lv_palette.cyclo ./App/lib/lvgl/src/misc/lv_palette.d ./App/lib/lvgl/src/misc/lv_palette.o ./App/lib/lvgl/src/misc/lv_palette.su ./App/lib/lvgl/src/misc/lv_profiler_builtin.cyclo ./App/lib/lvgl/src/misc/lv_profiler_builtin.d ./App/lib/lvgl/src/misc/lv_profiler_builtin.o ./App/lib/lvgl/src/misc/lv_profiler_builtin.su ./App/lib/lvgl/src/misc/lv_rb.cyclo ./App/lib/lvgl/src/misc/lv_rb.d ./App/lib/lvgl/src/misc/lv_rb.o ./App/lib/lvgl/src/misc/lv_rb.su ./App/lib/lvgl/src/misc/lv_style.cyclo ./App/lib/lvgl/src/misc/lv_style.d ./App/lib/lvgl/src/misc/lv_style.o ./App/lib/lvgl/src/misc/lv_style.su ./App/lib/lvgl/src/misc/lv_style_gen.cyclo ./App/lib/lvgl/src/misc/lv_style_gen.d ./App/lib/lvgl/src/misc/lv_style_gen.o ./App/lib/lvgl/src/misc/lv_style_gen.su ./App/lib/lvgl/src/misc/lv_templ.cyclo ./App/lib/lvgl/src/misc/lv_templ.d ./App/lib/lvgl/src/misc/lv_templ.o ./App/lib/lvgl/src/misc/lv_templ.su ./App/lib/lvgl/src/misc/lv_text.cyclo ./App/lib/lvgl/src/misc/lv_text.d ./App/lib/lvgl/src/misc/lv_text.o ./App/lib/lvgl/src/misc/lv_text.su ./App/lib/lvgl/src/misc/lv_text_ap.cyclo ./App/lib/lvgl/src/misc/lv_text_ap.d ./App/lib/lvgl/src/misc/lv_text_ap.o ./App/lib/lvgl/src/misc/lv_text_ap.su ./App/lib/lvgl/src/misc/lv_timer.cyclo ./App/lib/lvgl/src/misc/lv_timer.d ./App/lib/lvgl/src/misc/lv_timer.o ./App/lib/lvgl/src/misc/lv_timer.su ./App/lib/lvgl/src/misc/lv_utils.cyclo ./App/lib/lvgl/src/misc/lv_utils.d ./App/lib/lvgl/src/misc/lv_utils.o ./App/lib/lvgl/src/misc/lv_utils.su

.PHONY: clean-App-2f-lib-2f-lvgl-2f-src-2f-misc

