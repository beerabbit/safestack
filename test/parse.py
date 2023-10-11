from capstone import *
import os

def string_to_hex(str):
    return int("0x" + str,16)

def get_function_info(filename):
    #types = ['Num','Value','Size','Type','Bind','Vis','Ndx','Name']
    data = []
    split_list = []
    readelfs = "readelf -s " + filename  + " | awk '/FUNC/ {print $"
    for i in range(1,9):
        req = readelfs + str(i) + "}'"
        stream = os.popen(req)
        res = stream.read()
        data.append(res)
        buf = data[i-1].split("\n")
        num = len(buf)-1
        buf.pop()
        split_list.append(buf)
        
    res = []
    for i in range(0,num):
        buf = []
        for j in range(0,8):
            buf.append(split_list[j][i])
        res.append(buf)
    return res
# i[7] = function Name
'''
    1. Function Name으로 Function Addr과 Size 구하기
    2. .text에서 capstone돌려서 return address 구하기
'''

func_info = get_function_info("test1.elf")
f_name = ["a","b","c","main"]
for i in func_info:
    function_name = i[7]
    function_start = i[1]
    function_size = i[2]
    for j in f_name:
        if j == function_name:
            print(j)
            print(function_start)
            print(function_size)
            print("=====")
        



'''for k in range(0, len(func_info)):
    function_name = func_info[k][7]
    function_addr = string_to_hex(func_info[k][1])
    function_size = int(func_info[k][2])
    offset = function_addr - flash_addr
    print("Function Name >> ", function_name)
    print("Function Addr >> ", hex(function_addr))
    print("Function Size >> ", hex(function_size))
    print("Offset Size >> ", hex(offset))
    pos = res[offset-1:offset+function_size]
    md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
    for i in md.disasm(pos, function_addr):
        #print("0x%x:\t%s\t%s" %(i.address, i.mnemonic, i.op_str))
        print("%s %s" %(i.mnemonic, i.op_str))
        if(i.mnemonic == "push"):
            bl_count += 1
'''