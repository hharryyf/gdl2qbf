import sys 
import re
level = 0

minus_one = set()
bad = []
with open('static_rel.txt', 'r') as f:
    lines = f.readlines()
    #print(lines)
    state = 0
    for line in lines:
        line = line.strip()
        if line == '0':
            state += 1
        else:
            if state == 1:
                bad.append(line)


with open('no_does.txt', 'r') as f:
    lines = f.readlines()
    #print(lines)
    state = 0
    for line in lines:
        line = line.strip()
        if line == '0':
            state += 1
        else:
            if state == 1 and line not in bad:
                minus_one.add(line)

if 'cheat(' in minus_one:
    minus_one.remove('cheat(')

if len(sys.argv) == 2:
    level = int(sys.argv[1])

for line in sys.stdin:
    line = line.strip()
    newl = line.replace('(',',').replace(')',',').split(',')
    lv = -1
    for i in range(len(newl) - 1, -1, -1):
        if len(newl[i]) and newl[i] != '\n':
            lv = int(newl[i])
            break
    if lv != -1:
        #if lv == 1:
        if lv % 2 == 0:
            for prev_ok in minus_one:
                if line[:len(prev_ok)] == prev_ok:
                    lv -= 1
                    break
            else:
                lv += 1
        if lv <= level:
            print('_exists(' + str(lv) + ',' + str(line) + ').')
            #print('{' + str(line) + '}.')
