import re
# 파일 경로
import sys
import fncname
file_path = sys.argv[1]
res_path = sys.argv[2]


# 결과를 저장할 임시 리스트
movt = 0x0000
movw = 0x080C
#function_names = ["verify_benchmark","initialise_benchmark","benchmark","ludcmp","main","SystemClock_Config","MX_GPIO_Init","MX_I2C1_Init","MX_I2S3_Init","MX_SPI1_Init","MX_USART2_UART_Init","Error_Handler"]
function_names = fncname.fnc
# 파일 읽기
with open(file_path, 'r') as file:
    lines = file.readlines()

flag = 0
now_f = ""
callee = ""
calleeregs = ["r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12"]
movw = ""
movt = ""
pushs = ""
for i in range(len(lines)):
    for fn in function_names:
        if "@ -- Begin function " in lines[i]:
            buf = lines[i].split("@ -- Begin function ")
            buf = buf[1].replace("\n", "")
            if( fn == buf):
                print("function ON " + fn)
                now_f = fn
                flag = 1
    if (("@ -- End function" in lines[i]) and (flag == 1) ):
        print("function OFF " + now_f + "\n")
        flag = 0
    if(flag == 1):
        if(("push\t{lr}" in lines[i]) and not("bl" in lines[i+2])):
            print("ERRS ON ", now_f)
            print("moves " + lines[i-2] + " "+ lines[i-1] + " " + lines[i] +" to bl MasterBackward")
            movw = lines[i-2]
            movt = lines[i-1]
            pushs = lines[i]
            lines[i-2] = ""
            lines[i-1] = ""
            lines[i] = "\n"
        else:
            pass
        for fn in function_names: # bl masterforward 바꾸기
            
            if re.match(r"\tbl\t+" + fn , lines[i]):
                if(movw == ""):
                    print("Changed bl " + lines[i].replace("\n", "") + " to \tbl\tMasterForward in " + now_f )
                    lines[i] = "\tbl\tMasterForward\n"
                else:
                    print("There are ERRS! (arg changes for master forward)")
                    print("Changed bl " + lines[i].replace("\n", "") + " to " +movw + movt + pushs + "\tbl\tMasterForward\n " + now_f )
                    lines[i] = movw + movt + pushs + "\tbl\tMasterForward\n"
                    movw = ""
                    movt = ""
                    pushs = ""
                
            else:
                pass
        if("@ %bb.0:" in lines[i]):
            if((".save\t{r7, lr}" in lines[i+1]) or ("push\t{r7, lr}" in lines[i+1])):
                buf = lines[i+1].split("\t")
                callee = (buf[2].split("\n"))[0]
                print("Push is " + callee + " to in " + now_f )
            elif(("push\t" in lines[i+2])):
                buf = lines[i+2].split("\t")
                callee = (buf[2].split("\n"))[0]
                print("Push is " + callee + " in " + now_f )
        if (("bx\tlr" in lines[i]) or ("pop" in lines[i]) ):
            if((not(("Master" in lines[i+2])) and ("end" in lines[i+1])) or ("align" in lines[i+1]) ):
                if callee == "":
                    print("There is no callee..")
                    print("Changed \n" + lines[i].replace("\n", "") + "\n to\n\tbl\tMasterBackward; in " + now_f )
                    lines[i] = "\tbl\tMasterBackward\n"
                else:
                    if "pc" in callee:
                        callee.replace("pc", "lr")
                    print("There is callee and callee is " + callee)
                    print("Changed \n" + lines[i].replace("\n", "") + "\n to  \n\tpop\t" + callee + "\n\tbl\tMasterBackward; in " + now_f )
                    lines[i] = "\tpop\t" + callee + "\n\tbl\tMasterBackward\n"
                    callee = ""
                #print(fnctest)
        else:
            pass

# 결과를 파일에 쓰기
with open(res_path, 'w') as file:
    file.writelines(lines)
