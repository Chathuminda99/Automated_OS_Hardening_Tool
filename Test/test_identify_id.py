import re

id_pattern = re.compile(r'^\d+\.\d+\.\d+(\.\d+)?')
# Sample text with IDs at the beginning of some lines
Description = ""

# pattern = r'"(\d+\.\d+(\.\d+){0,2})"'
for line in Description[1:10].split('\n'):
    match = id_pattern.match(line)
    if match:
        print("ID found:", match.group())



# # I need to get the ID from the below type of line. Modify the code.

# 