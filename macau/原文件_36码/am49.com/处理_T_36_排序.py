import datetime
import os

# 获取当前日期
current_date = datetime.datetime.now().strftime('%Y-%m-%d')

# 获取当前脚本所在的目录
current_directory = os.path.dirname(__file__)

# 构建相对路径
file_path = os.path.join(current_directory, '36码_[原].txt')

# 读取原始文件
with open(file_path, 'r') as file:
    lines = file.readlines()

# 将每一行的数字提取出来，并转换为列表
numbers = []
for line in lines:
    numbers += [int(x) for x in line.strip('[]\n').split('.')]

# 将数字排序
sorted_numbers = sorted(numbers)

# 将排序后的数字分成12个一组，形成新的行
sorted_lines = ['[' + '.'.join([f'{x:02}' for x in sorted_numbers[i:i+12]]) +
                ']' for i in range(0, len(sorted_numbers), 12)]

# 指定输出路径为当前目录下的 ""
output_path = '[新]_am49.com_36码/'

# 如果文件夹不存在，则创建文件夹
if not os.path.exists(output_path):
    os.makedirs(output_path)

# 将新的内容写入新的文件
with open(os.path.join(output_path, f'{current_date}_本期 36 码.txt'), 'w', encoding='utf-8') as file:
    file.write('\n'.join(sorted_lines))
