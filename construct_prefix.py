import sys 
import re
level = 0
    
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
            if line[:5] == 'true(':
                lv -= 1
            else:
                lv += 1
        if lv <= level:
            print('_exists(' + str(lv) + ',' + str(line) + ').')
            #print('{' + str(line) + '}.')
