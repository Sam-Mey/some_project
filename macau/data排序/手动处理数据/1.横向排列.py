# 读取输入文件
with open(r'C:\your\path\Desktop\input.txt', 'r', encoding='utf-8') as file:
    content = file.readlines()

# 将内容处理成横向排列
output_lines = []
current_period = None
animals = {}

for line in content:
    line = line.strip()
    if line.startswith("第"):
        if current_period:
            output_lines.append(" ".join(current_period))
        current_period = [line + "："]
    elif line.isnumeric():
        current_number = line
    elif line.isalpha() and len(line) == 1:
        current_animal = line
        current_period.append(f"{current_number} {current_animal}")

# 处理最后一期
if current_period:
    output_lines.append(" ".join(current_period))

# 将处理后的内容写入输出文件
with open(r'C:\your\path\Desktop\output.txt', 'w', encoding='utf-8') as file:
    file.write('\n'.join(output_lines))
