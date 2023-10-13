from elftools.elf.elffile import ELFFile
from capstone import *
from pwn import *

elf = ELF("./test1.elf")
movt = 0x0000
movw = 0x080C
function_names = ['a','b','c','main']
# retn address -> 각각 table index가 됨
# functino offset -> 함수의 위치
# function size -> 사이즈
def check_call_destination(addr):
    for i in function_names:
        function_addr = elf.functions[i].address
        if function_addr == addr:
            return i
    return 0

def function_start_size_end_addr(function_name):
    res = []
    function_size = elf.functions[function_name].size
    function_addr = elf.functions[function_name].address
    code = elf.get_section_by_name('.text')
    text_addr = elf.get_section_by_name('.text').header.sh_addr
    function_offset = function_addr - text_addr
    res.append(hex(function_offset))
    res.append(hex(function_offset+function_size))
    ops = code.data()
    pos = ops[function_offset-1 : function_offset + function_size]
    md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
    retnbuf = []
    call_retn_fair = []
    for i in md.disasm(pos, function_addr):        
        #print(f'0x{i.address:x}:\t{i.mnemonic}\t{i.op_str}')    
        if(i.mnemonic == "bl"):
            call_des = check_call_destination(int(i.op_str[1:],16))
            call_return_fair = [call_des, hex(i.address+4-1-text_addr)]
            retnbuf.append(call_return_fair)
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
print("==============")
print(function_info)
print(analysis_table)
print("==============")
for i in analysis_table:
    cnt = 0
    buf = []
    function_name = i[0]
    data = i[1]
    for k in data:
        call_name = k[0]
        if call_name != 0:
            return_value = k[1]
            buf.append(function_name+"_"+str(cnt)+"_"+"FORPUSH")
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
