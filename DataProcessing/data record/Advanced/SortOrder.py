def process_file(input_path, output_path):
    # 从输入文件中读取数据
    with open(input_path, 'r', encoding='utf-8') as file:
        lines = [line.strip() for line in file.readlines()]

    formatted_data = ""

    current_period = ""
    current_numbers = []

    # 遍历每一行数据
    for line in lines:
        if "期" in line:
            # 当遇到新的一期时，将前一期的数据整理并添加到formatted_data中
            if current_period and current_numbers:
                formatted_data += f"第{current_period}：{','.join(current_numbers)}\n"
                current_numbers = []  # 重置当前号码列表
            current_period = line.split('（')[0]  # 去掉开奖时间
        elif line.isdigit():
            current_numbers.append(line)  # 将数字添加到当前号码列表中
        elif line == "特":
            current_numbers.append("特")  # 遇到特殊号码时，将其添加到当前号码列表中
    
    # 处理最后一期的数据
    if current_period and current_numbers:
        formatted_data += f"第{current_period}：{','.join(current_numbers)}\n"

    # 将整理后的数据反转顺序
    formatted_data = formatted_data.strip().split('\n')
    formatted_data = '\n'.join(reversed(formatted_data))

    # 将整理后的数据写入新的文件
    with open(output_path, 'w', encoding='utf-8') as file:
        file.write(formatted_data)

# 指定输入和输出路径
input_path = 'C:/Users/71081/Desktop/RawData.txt'
output_path = 'C:/Users/71081/Desktop/New_Data.txt'

# 处理文件
process_file(input_path, output_path)
