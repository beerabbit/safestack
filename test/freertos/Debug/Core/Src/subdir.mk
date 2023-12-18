################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/freertos.c \
../Core/Src/main.c \
../Core/Src/stm32f4xx_hal_msp.c \
../Core/Src/stm32f4xx_hal_timebase_tim.c \
../Core/Src/stm32f4xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32f4xx.c 

OBJS += \
./Core/Src/freertos.o \
./Core/Src/main.o \
./Core/Src/stm32f4xx_hal_msp.o \
./Core/Src/stm32f4xx_hal_timebase_tim.o \
./Core/Src/stm32f4xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32f4xx.o 

C_DEPS += \
./Core/Src/freertos.d \
./Core/Src/main.d \
./Core/Src/stm32f4xx_hal_msp.d \
./Core/Src/stm32f4xx_hal_timebase_tim.d \
./Core/Src/stm32f4xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32f4xx.d 


main = main.bc
# Each subdirectory must supply rules for building sources it contributes

Core/Src/%.o: Core/Src/%.s Core/Src/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -c -x assembler-with-cpp -MMD -MP -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"


	

Core/Src/%.s: Core/Src/%.bc Core/Src/subdir.mk
	/home/creaker00/safestack/build/bin/llc "$<" -o "$@"

Core/Src/main.s: Core/Src/main.bc Core/Src/subdir.mk
	/home/creaker00/safestack/build/bin/llc "$<" -o "$@"
	python3 /home/creaker00/safestack/test/modifyASM.py /home/creaker00/safestack/test/freertos/Debug/Core/Src/main.s /home/creaker00/safestack/test/freertos/Debug/Core/Src/main_res.s
	cp /home/creaker00/safestack/test/freertos/Debug/Core/Src/main.s /home/creaker00/safestack/test/freertos/Debug/Core/Src/main_origin.s
	mv /home/creaker00/safestack/test/freertos/Debug/Core/Src/main_res.s /home/creaker00/safestack/test/freertos/Debug/Core/Src/main.s


Core/Src/%.bc: ../Core/Src/%.c Core/Src/subdir.mk
		/home/creaker00/safestack/build/bin/clang -S -emit-llvm "$<" -I/usr/lib/arm-none-eabi/include/ -I../USB_HOST/App -I../USB_HOST/Target -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -mcpu=cortex-m4 -std=gnu11 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -I../USB_HOST/App -I../USB_HOST/Target -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.bc=%.d)" -MT"$@" -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

Core/Src/main.bc: ../Core/Src/main.c Core/Src/subdir.mk
	/home/creaker00/safestack/build/bin/clang -S -emit-llvm "$<" -I/usr/lib/arm-none-eabi/include/ -I../USB_HOST/App -I../USB_HOST/Target -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -mcpu=cortex-m4 -std=gnu11 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -I../USB_HOST/App -I../USB_HOST/Target -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.bc=%.d)" -MT"$@" -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
	~/safestack/build/bin/opt -S --bugpoint-enable-legacy-pm -load ~/safestack/build/lib/LLVMMasterCFI.so --masterCFI < /home/creaker00/safestack/test/freertos/Debug/Core/Src/main.bc > /home/creaker00/safestack/test/freertos/Debug/Core/Src/main1.bc		
	mv /home/creaker00/safestack/test/freertos/Debug/Core/Src/main1.bc /home/creaker00/safestack/test/freertos/Debug/Core/Src/main.bc


clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/*.bc ./Core/Src/*.s ./Core/Src/main.su ./Core/Src/stm32f4xx_hal_msp.d ./Core/Src/stm32f4xx_hal_msp.o ./Core/Src/stm32f4xx_hal_msp.su ./Core/Src/stm32f4xx_it.d ./Core/Src/stm32f4xx_it.o ./Core/Src/stm32f4xx_it.su ./Core/Src/syscalls.d ./Core/Src/syscalls.o ./Core/Src/syscalls.su ./Core/Src/sysmem.d ./Core/Src/sysmem.o ./Core/Src/sysmem.su ./Core/Src/system_stm32f4xx.d ./Core/Src/system_stm32f4xx.o ./Core/Src/system_stm32f4xx.su

.PHONY: clean-Core-2f-Src

.PRECIOUS: Core/Src/%.s Core/Src/%.bc
