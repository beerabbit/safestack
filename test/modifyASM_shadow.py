import re
# 파일 경로
import sys
import fncname
file_path = sys.argv[1]
res_path = sys.argv[2]


# 결과를 저장할 임시 리스트
movt = 0x0000
movw = 0x080C

function_names = fncname.fnc
# 파일 읽기
with open(file_path, 'r') as file:
    lines = file.readlines()

flag = 0
now_f = ""
callee = ""
calleeregs = ["r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12"]
err_idx = 0
err_idx_stop = 0
app_stop = 0
swapbuf = []
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
        if(("bl\t" in lines[i]) and not("@" in lines[i])):
            for fn in function_names:
                if((fn in lines[i]) and not("@APP" in lines[i+1])):

                    err_idx = i+1
    if(err_idx != 0):
        if("@APP" in lines[i]):
            err_idx_stop = i
            print("ERRS..")
            for j in range(err_idx, err_idx_stop):
                swapbuf.append(lines[j])
            
        if("@NO_APP" in lines[i]):
            size = err_idx_stop - err_idx
            app_stop = i
            #456123 -> 
            app_buf = []
            for j in range(err_idx_stop, app_stop):
                app_buf.append(lines[j])
            cnt = 0
            for j in range(err_idx_stop - size, app_stop - size):
                lines[j] = app_buf[cnt]
                print(lines[j])
                cnt += 1
            cnt = 0
            for j in range(app_stop - size, app_stop):
                lines[j] = swapbuf[cnt]
                print(lines[j])
                cnt += 1
            cnt = 0
            err_idx = 0
            err_idx_stop = 0



           

# 결과를 파일에 쓰기
with open(res_path, 'w') as file:
    file.writelines(lines)
