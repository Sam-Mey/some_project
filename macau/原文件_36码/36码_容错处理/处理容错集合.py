import os
import datetime
from collections import Counter

# 获取当前脚本所在的目录
current_directory = os.path.dirname(__file__)

# 构建相对路径
file_path = os.path.join(current_directory, 'T_码大包围集合_[源].txt')

# 读取原始文件
with open(file_path, 'r') as file:
    lines = file.readlines()

# 去除空行，处理每行的数字并转换为整数
all_numbers = []
for line in lines:
    line = line.strip()
    if line:
        numbers = [int(num) for num in line[1:-1].split('.') if num.isdigit()]
        all_numbers.extend(numbers)

# 使用 Counter 统计数字出现的次数
counts = Counter(all_numbers)

# --------------------------------设置重复次数--------------------------------------

# 找出重复出现三次的数字
repeated_numbers = [num for num,
                    count in counts.items() if count == 2]  # "3" 代表三次

# ---------------------------------------------------------------------------------

# 按照原格式排序重复的数字
sorted_repeated_numbers = sorted(repeated_numbers)

# 将排序后的数字按照原格式重新组合成行，每行包含12个数字
sorted_lines = [
    '[' + '.'.join([f'{x:02}' for x in sorted_repeated_numbers[i:i+12]]) + ']\n'
    for i in range(0, len(sorted_repeated_numbers), 12)
]

# 获取当前日期
current_date = datetime.datetime.now().strftime('%Y-%m-%d')

# 指定输出路径为当前目录下的 "number36"
output_path = 'T码_精选/'

# 如果文件夹不存在，则创建文件夹
if not os.path.exists(output_path):
    os.makedirs(output_path)

# 指定新文件的文件名格式
output_file_name = f'{current_date}_本期_精选_号码.txt'

# 将新的内容写入新的文件
output_file_path = os.path.join(output_path, output_file_name)
with open(output_file_path, 'w', encoding='utf-8') as file:
    file.write(''.join(sorted_lines))

print(f"已将重复出现三次的数字按原格式排序，并写入新文件 '{output_file_name}' 中。")
