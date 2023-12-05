import sys
l = []
file = sys.argv[1]
with open(file, 'r') as f:
    for line in f:
        l.append(line.strip())

l.sort()

for v in l:
    print(v)