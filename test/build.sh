cd ../build/
ninja
cd ../test
../build/bin/clang -S -emit-llvm -I /usr/lib/arm-none-eabi/include/ -mcpu=cortex-m4 -std=gnu11 -O0 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb  test.c -o test.bc
../build/bin/opt -S --bugpoint-enable-legacy-pm -load ../build/lib/LLVMMasterCFI.so --Safestacktest < test.bc > test1.bc
#../build/bin/opt -S --bugpoint-enable-legacy-pm -load ../build/lib/LLVMMasterCFI.so --masterCFI < test.bc > test1.bc
#../build/bin/opt -S --bugpoint-enable-legacy-pm -load ../build/lib/LLVMMasterCFI.so --Master_secondCFI < test1.bc > test2.bc
../build/bin/llc test1.bc -O0
arm-none-eabi-gcc test1.s -o test2.elf -mthumb -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mcpu=cortex-m4 --specs=nosys.specs -O0
