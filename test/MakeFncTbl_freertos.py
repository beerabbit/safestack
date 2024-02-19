from elftools.elf.elffile import ELFFile
from capstone import *
from pwn import *
import struct
import sys
import fncname
elf = ELF("/home/creaker00/safestack/test/freertos_origin/Debug/freertos.elf")
output = "/home/creaker00/safestack/test/Results/output_"
movt = 0x080C0000
movtext = 0x08000000
#function_names = ["verify_benchmark","initialise_benchmark","benchmark","ludcmp","main","SystemClock_Config","MX_GPIO_Init","MX_I2C1_Init","MX_I2S3_Init","MX_SPI1_Init","MX_USART2_UART_Init","Error_Handler"]
function_names = fncname.fnc
eof = []
# retn address -> 각각 table index가 됨
# functino offset -> 함수의 위치
# function size -> 사이즈
def check_call_destination(addr):
    for i in function_names:
        function_addr = elf.functions[i].address
        if function_addr == addr:
            return i
    if(addr == elf.functions['MasterBackward'].address):
        return "EOF"
    return 0

def function_start_size_end_addr(function_name):
    res = []
    function_size = elf.functions[function_name].size
    function_addr = elf.functions[function_name].address
    code = elf.get_section_by_name('.text')
    text_addr = elf.get_section_by_name('.text').header.sh_addr
    function_offset = function_addr - text_addr
    res.append(hex(function_offset+text_addr))
    res.append(hex(text_addr + function_offset+function_size))
    ops = code.data()
    pos = ops[function_offset-1 : function_offset + function_size]
    md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
    retnbuf = []
    call_retn_fair = []
    for i in md.disasm(pos, function_addr):          
        if(i.mnemonic == "bl"):
            call_des = check_call_destination(int(i.op_str[1:],16))    
            if(call_des != "EOF" and call_des != 0):
                call_return_fair = [call_des, hex(text_addr + i.address+4-text_addr)]
                retnbuf.append(call_return_fair)
            else:
                eof.append(hex(text_addr + i.address+4-text_addr))
    res.append(retnbuf)
    return res


function_table = []
# {function_name : [function_start : function_end]}
function_info = {}
analysis_table = []
for i in function_names:
    buf = function_start_size_end_addr(i)
    function_info[i] = [buf[0], buf[1]]
    analysis_table.append([i,buf[2]])

for i in function_names:
    for j in eof:
        if( function_info[i][1] == j ):
            eof.remove(j)

'''
if( len(eof) > 0):
    for i in function_names:
        mins = function_info[i][0]
        maxs = function_info[i][1]
        for j in eof:
            if( (mins < j) and (maxs > j) ):
                print("Errs at " + i + " changes " + maxs + " to " + j)
                function_info[i][1] = j
                eof.remove(j)
'''


print("==============")
print(function_info)
print(analysis_table)
for i in analysis_table:
    print(i)
print("==============")
cnt = 0
for i in analysis_table:
    buf = []
    function_name = i[0]
    data = i[1]
    for k in data:
        call_name = k[0]
        if call_name != 0:
            return_value = k[1]
            buf.append(function_name+str(cnt))
            buf.append(hex(movt))
            buf.append(return_value)
            buf.append(function_info[call_name])
            function_table.append(buf)
            buf = []
            cnt += 1
            movt += 4
        else:
            pass

print(function_table)
print("===============")

f = open(output + str(len(function_table)*3*4) + "_freertos.bin", 'wb')
for i in function_table:
    print(i[2] + " " + i[3][0] + " " + i[3][1])
    ret = struct.pack('I', int(i[2],16))
    togo = struct.pack('I', int(i[3][0],16))
    togo_end = struct.pack('I', int(i[3][1],16))
    
    f.write(ret)
    f.write(togo)
    f.write(togo_end)
f.close()
