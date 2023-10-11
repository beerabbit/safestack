../build/bin/clang -S -emit-llvm -I /usr/lib/arm-none-eabi/include/ -mcpu=cortex-m4 -std=gnu11 -O0 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb  test.c -o test.bc
../build/bin/opt -S --bugpoint-enable-legacy-pm -load ../build/lib/LLVMMasterCFI.so --masterCFI < test.bc > test1.bc
../build/bin/llc test1.bc
arm-none-eabi-gcc test1.s -o test1.elf -mthumb -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mcpu=cortex-m4 --specs=nosys.specs
