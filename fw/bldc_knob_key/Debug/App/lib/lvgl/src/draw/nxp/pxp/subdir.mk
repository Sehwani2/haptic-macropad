################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/lib/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.c \
../App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp.c \
../App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.c \
../App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.c \
../App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.c \
../App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.c \
../App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_osa.c \
../App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_utils.c 

OBJS += \
./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.o \
./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp.o \
./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.o \
./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.o \
./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.o \
./App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.o \
./App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_osa.o \
./App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_utils.o 

C_DEPS += \
./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.d \
./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp.d \
./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.d \
./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.d \
./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.d \
./App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.d \
./App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_osa.d \
./App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_utils.d 


# Each subdirectory must supply rules for building sources it contributes
App/lib/lvgl/src/draw/nxp/pxp/%.o App/lib/lvgl/src/draw/nxp/pxp/%.su App/lib/lvgl/src/draw/nxp/pxp/%.cyclo: ../App/lib/lvgl/src/draw/nxp/pxp/%.c App/lib/lvgl/src/draw/nxp/pxp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/bldc_knob_key/App/ap" -I"C:/stm32/balancing_robot/bldc_knob_key/App/common" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw" -I"C:/stm32/balancing_robot/bldc_knob_key/App/common/include" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/include" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I"C:/stm32/balancing_robot/bldc_knob_key/App/lib" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/core" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_cdc" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_msc" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/usb/usb_hid" -I"C:/stm32/balancing_robot/bldc_knob_key/App/hw/src/lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-pxp

clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-pxp:
	-$(RM) ./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.cyclo ./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.d ./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.o ./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.su ./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp.cyclo ./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp.d ./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp.o ./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp.su ./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.cyclo ./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.d ./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.o ./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.su ./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.cyclo ./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.d ./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.o ./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.su ./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.cyclo ./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.d ./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.o ./App/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.su ./App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.cyclo ./App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.d ./App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.o ./App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.su ./App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_osa.cyclo ./App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_osa.d ./App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_osa.o ./App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_osa.su ./App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_utils.cyclo ./App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_utils.d ./App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_utils.o ./App/lib/lvgl/src/draw/nxp/pxp/lv_pxp_utils.su

.PHONY: clean-App-2f-lib-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-pxp

