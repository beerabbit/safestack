rm ./Results/*.bin

cp ~/safestack/test/Results/main_freertos.c ~/safestack/test/freertos/Core/Src/main.c
cd ~/safestack/test/freertos/Debug
make clean
make all -j 16
cp freertos.elf ~/safestack/test/Results/freertos.elf
cd ~/safestack/test/



cp ~/safestack/test/Results/main_freertos.c ~/safestack/test/freertos_origin/Core/Src/main.c
cd ~/safestack/test/freertos_origin/Debug
make clean
make all -j 16
cd ~/safestack/test/
python3 MakeFncTbl_freertos.py