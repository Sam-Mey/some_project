def process_file(input_path, output_path):
    with open(input_path, 'r', encoding='utf-8') as file:
        lines = [line.strip() for line in file.readlines()]

    formatted_data = ""

    current_period = ""
    current_numbers = []

    for line in lines:
        if "期" in line:
            if current_period and current_numbers:
                formatted_data += f"{current_period}：{', '.join(current_numbers)}\n"
                current_numbers = []
            current_period = line
        elif line.isdigit():
            current_numbers.append(line)
        elif line == "特":
            current_numbers.append("特")
    
    if current_period and current_numbers:
        formatted_data += f"{current_period}：{', '.join(current_numbers)}\n"

    with open(output_path, 'w', encoding='utf-8') as file:
        file.write(formatted_data)

# 指定输入和输出路径
input_path = 'C:/Users/71081/Desktop/Macau.txt'
output_path = 'C:/Users/71081/Desktop/New_Macau.txt'

# 处理文件
process_file(input_path, output_path)
