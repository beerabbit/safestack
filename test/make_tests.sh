cp ~/safestack/test/Results/main.c ~/safestack/test/noret/Core/Src/main.c
cd ./noret/Debug
make clean
make all -j 16
cp noret.elf ~/safestack/test/Results/noret.elf

cp ~/safestack/test/Results/main.c ~/safestack/test/noret_origin/Core/Src/main.c
cd ~/safestack/test/noret_origin/Debug
make clean
make all -j 16
cd ~/safestack/test/
rm ./Results/*.bin
python3 MakeFncTbl.py

cp ~/safestack/test/Results/main.c ~/safestack/test/origin/Core/Src/main.c
cd ~/safestack/test/origin/Debug
make clean
make all -j 16
cp noret.elf ~/safestack/test/Results/original.elf
cd ~/safestack/test/Results/
arm-none-eabi-objcopy -O binary noret.elf noret.bin
arm-none-eabi-objcopy -O binary original.elf original.bin
FSIZE=$(wc -c "/home/creaker00/safestack/test/Results/noret.bin" | awk '{print $1}')
FSIZE1=$(wc -c "/home/creaker00/safestack/test/Results/original.bin" | awk '{print $1}')
RES=$(expr $FSIZE - $FSIZE1)
echo "noret : $FSIZE"
echo "origin : $FSIZE1"
echo "SIZE : $RES"