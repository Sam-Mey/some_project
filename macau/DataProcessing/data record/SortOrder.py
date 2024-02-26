import os

def process_file(input_path, output_path):
    # 从输入文件中读取数据
    with open(input_path, 'r', encoding='utf-8') as file:
        lines = [line.strip() for line in file.readlines()]

    formatted_data = ""

    current_period = ""
    current_draw_time = ""
    current_draw_data = []

    # 遍历每一行数据
    for line in lines:
        if line.startswith("第 "):  # 检查是否是期号的行
            # 当遇到新的一期时，将前一期的数据整理并添加到formatted_data中
            if current_period and current_draw_data:
                formatted_data += f"第 {current_period} 期: {', '.join(current_draw_data)}\n"
                current_draw_data = []  # 重置当前号码和动物列表

            # 提取期号和开奖时间
            tokens = line.split()
            current_period = tokens[1]
            current_draw_time = tokens[2] if len(tokens) > 2 else ""
        elif line.isdigit():
            # 将数字和对应的动物添加到当前号码和动物列表中
            number = line
            animal = lines[lines.index(line) + 1].strip()
            current_draw_data.append(f"{number} ({animal})")

    # 将整理后的数据反转顺序
    formatted_data = formatted_data.strip().split('\n')
    formatted_data = '\n'.join(reversed(formatted_data))

    # 将整理后的数据写入新的文件
    with open(output_path, 'w', encoding='utf-8') as file:
        file.write(formatted_data)

# 获取当前脚本所在目录
current_directory = os.path.dirname(os.path.realpath(__file__))

# 指定输入和输出路径为当前目录下的文件
input_path = os.path.join(current_directory, 'RawData.txt')
output_path = os.path.join(current_directory, 'New_Data.txt')

# 处理文件
process_file(input_path, output_path)
