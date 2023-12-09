import datetime
import os

# 获取当前日期
current_date = datetime.datetime.now().strftime('%Y-%m-%d')

# 获取当前脚本所在的目录
current_directory = os.path.dirname(__file__)

# 构建相对路径
file_path = os.path.join(current_directory, 'T_码大包围_[原创].txt')

# 读取原始文件
with open(file_path, 'r') as file:
    lines = file.readlines()

# 提取数字并排序
numbers = []
for line in lines:
    nums = line.split()
    for num in nums:
        if num.isdigit():
            numbers.append(int(num))

sorted_numbers = sorted(numbers)

# 格式化为每行12个数字的格式，并用"[]"包裹
formatted_numbers = [f"{num:02d}" for num in sorted_numbers]
chunks = [formatted_numbers[i:i + 12]
          for i in range(0, len(formatted_numbers), 12)]
wrapped_lines = ['[' + '.'.join(chunk) + ']' for chunk in chunks]

# 指定输出路径为当前目录下的新文件夹
output_path = '处理后_36码/[新]_原创_36码/'

# 如果文件夹不存在，则创建文件夹
if not os.path.exists(output_path):
    os.makedirs(output_path)

# 将新的内容写入新的文件
with open(os.path.join(output_path, f'{current_date}_本期_[新]_36_码_[原创].txt'), 'w', encoding='utf-8') as file:
    file.write('\n'.join(wrapped_lines))
