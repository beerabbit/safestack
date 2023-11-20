################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/main.c \
../Core/Src/stm32f4xx_hal_msp.c \
../Core/Src/stm32f4xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32f4xx.c 

OBJS += \
./Core/Src/main.o \
./Core/Src/stm32f4xx_hal_msp.o \
./Core/Src/stm32f4xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32f4xx.o 

C_DEPS += \
./Core/Src/main.d \
./Core/Src/stm32f4xx_hal_msp.d \
./Core/Src/stm32f4xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32f4xx.d 

Core/Src/%.o: ./Core/Src/%.s Core/Src/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -c -x assembler-with-cpp -MMD -MP -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

./Core/Src/%.s: ./Core/Src/%.bc Core/Src/subdir.mk
	llc "$<" -o "$@"

# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.bc Core/Src/%.su: ../Core/Src/%.c Core/Src/subdir.mk
	clang "$<" -S -Xclang -emit-llvm -mcpu=cortex-m4 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I/usr/lib/arm-none-eabi/include/ -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -MMD -MP -MF"$(@:%.bc=%.d)" -MT"$@" -mfpu=fpv4-sp-d16 -mlittle-endian -mfloat-abi=hard -mthumb -o "$@"
	/home/gagak/llvm-project/build/bin/opt -S -enable-new-pm=0 -load ~/llvm-project/build/lib/LLVMReverseStack.so -ReverseStack < "$@" > "$@.temp"
	mv "$@.temp" "$@"

clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/*.o ./Core/Src/*.temp ./Core/Src/main.d ./Core/Src/main.bc ./Core/Src/main.su ./Core/Src/stm32f4xx_hal_msp.d ./Core/Src/stm32f4xx_hal_msp.bc ./Core/Src/stm32f4xx_hal_msp.su ./Core/Src/stm32f4xx_it.d ./Core/Src/stm32f4xx_it.bc ./Core/Src/stm32f4xx_it.su ./Core/Src/syscalls.d ./Core/Src/syscalls.bc ./Core/Src/syscalls.su ./Core/Src/sysmem.d ./Core/Src/sysmem.bc ./Core/Src/sysmem.su ./Core/Src/system_stm32f4xx.d ./Core/Src/system_stm32f4xx.bc ./Core/Src/system_stm32f4xx.su

.PHONY: clean-Core-2f-Src

.PRECIOUS: ./Core/Src/%.s

