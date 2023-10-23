# 파일 경로
file_path = '/home/creaker00/llvm-project/noret/Debug/Core/Src/main.s'
res_path = '/home/creaker00/llvm-project/noret/Debug/Core/Src/main.s'
# 결과를 저장할 임시 리스트
output_lines = []

# 파일 읽기
with open(file_path, 'r') as file:
    lines = file.readlines()

i = 0
for line in lines:
    if "Entry:" in line:
        output_lines[i-2] = "	b master_\n"
        output_lines.append(line)
        i+=1
    output_lines.append(line)
    i+= 1
i = 0
for line in output_lines:
    if "RETURN:" in line:
        output_lines.insert(i+1, "	b master_retn\n")
    i+= 1


# 결과를 파일에 쓰기
with open(res_path, 'w') as file:
    file.writelines(output_lines)
