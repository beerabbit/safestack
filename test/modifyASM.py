import re
# 파일 경로
file_path = './test1.s'
res_path = './test1_buf.s'
# 결과를 저장할 임시 리스트
movt = 0x0000
movw = 0x080C
pattern = "^[A-Za-z0-9]+_+[0-9]+_FORPUSH:$"
function_names = ['a','b','c','main']
table = [['a_0_FORPUSH', '0x0', '0x118', ['0x14d', '0x187']], ['a_1_FORPUSH', '0x4', '0x128', ['0x189', '0x19b']], ['a_2_FORPUSH', '0x8', '0x142', ['0x14d', '0x187']], ['b_0_FORPUSH', '0xc', '0x180', ['0x189', '0x19b']], ['main_0_FORPUSH', '0x10', '0x1b0', ['0xf9', '0x14b']]]
# 파일 읽기
with open(file_path, 'r') as file:
    lines = file.readlines()


for i in range(len(lines)):
    if re.match(pattern, lines[i]):
        
        res = lines[i].replace("\n", "")
        res = res.replace(":", "")
        for j in table:
            if j[0] == res:
                lines[i+1] = "	movt	lr, #" + j[1] + "\n"
    for fn in function_names: # bl masterforward 바꾸기
        if re.match(r"\tbl\t+" + fn , lines[i]):
    
            lines[i] = "\tbl\tMasterForward\n"
        else:
            pass
    if (("bx\tlr" in lines[i]) or ("pop" in lines[i]) ):
        print(lines[i])
    else:
        pass

# 결과를 파일에 쓰기
with open(res_path, 'w') as file:
    file.writelines(lines)
