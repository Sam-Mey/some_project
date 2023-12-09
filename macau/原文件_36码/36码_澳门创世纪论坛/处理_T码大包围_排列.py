import datetime
import os
import re

# 获取当前日期并格式化为年-月-日的形式
current_date = datetime.datetime.now().strftime('%Y-%m-%d')

# 获取当前脚本所在的目录
current_directory = os.path.dirname(__file__)

# 构建相对路径
file_path = os.path.join(current_directory, 'T码大包围_[原].txt')

# 读取原始文件并过滤空字符和逗号
with open(file_path, 'r', encoding='utf-8') as file:
    content = file.read().replace('&#8203;``【oaicite:0】``&#8203;', '').replace(',', '')

# 匹配连续的两位数字并转换为整数
numbers = [int(match) for match in re.findall(r'\d{2}', content)]

# 将数字排序
sorted_numbers = sorted(numbers)

# 将排序后的数字分成12个一组，形成新的行
sorted_lines = ['[' + '.'.join([f'{x:02d}' for x in sorted_numbers[i:i+12]]) +
                ']' for i in range(0, len(sorted_numbers), 12)]

# 指定输出路径为当前目录下的 ""
output_path = '处理后_36码/[新]_澳门创世纪论坛/'

# 如果文件夹不存在，则创建文件夹
if not os.path.exists(output_path):
    os.makedirs(output_path)

# 将新的内容写入新的文件
with open(os.path.join(output_path, f'{current_date}_331期繁华梦里★36码★.txt'), 'w', encoding='utf-8') as file:
    file.write('\n'.join(sorted_lines))
