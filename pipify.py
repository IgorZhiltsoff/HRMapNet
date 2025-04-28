with open('pip.txt') as file:
    lines = [line.rstrip() for line in file] 

lines = lines[1:]

newlines = [
    f"pip install {line.replace(' ', '==', 1).replace(' ', '')}"
    for line in lines
]

with open('reqs.txt', 'w') as file:
    file.write('\n'.join(newlines))