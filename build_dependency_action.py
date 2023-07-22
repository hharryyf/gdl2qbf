import queue

bad = ['log_domain(', 'time_domain(', 'move_time_domain(', 'move_domain(', '_']
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

state = 0

universal = {}
exist = {}
exist_o = {}

with open('smodels.txt') as f:
    for line in f:
        line = line.strip()
        if line == '0':
            state += 1
            continue
        if state == 1:
            line = line.split()
            _, atom = int(line[0]), line[1]
            ok = True
            for b in bad:
                if atom[:len(b)] == b:
                    ok = False
            if ok:
                newl = atom.replace('(', ',').replace(')',',').split(',')
                lv = -1
                for i in range(len(newl) - 1, -1, -1):
                    if len(newl[i]) and newl[i] != '\n':
                        lv = int(newl[i])
                        break
                if lv != -1:
                    if atom[:13] == 'does(xplayer,':
                        if lv in exist:
                            exist[lv].append(atom)
                        else:
                            exist[lv] = []
                            exist[lv].append(atom)
                    elif atom[:6] == 'moveL(':
                        if lv in universal:
                            universal[lv].append(atom)
                        else:
                            universal[lv] = []
                            universal[lv].append(atom)
                    elif atom[:13] == 'does(oplayer,':
                        if lv in exist_o:
                            exist_o[lv].append(atom)
                        else:
                            exist_o[lv] = []
                            exist_o[lv].append(atom)

univ = list(universal.items())
univ.sort()
exist = list(exist.items())
exist.sort()
exist_o = list(exist_o.items())
exist_o.sort()

i = 1
for tup in univ:
    for it in tup[1]:
        print(f'_forall({i*2}, {it}).')
    i += 1

for tup in exist:
    lv = 2 * len(univ) + 1
    ok = False
    for i in range(0, len(univ), 1):
        if tup[0] <= univ[i][0]:
            ok = True
            for it in tup[1]:
                print(f'_exists({2 * i + 1}, {it}).')
            break

    if ok == False:
        for it in tup[1]:
            print(f'_exists({lv}, {it}).')

for tup in exist_o:
    lv = 1
    ok = False
    for i in range(len(univ) - 1, -1, -1):
        if tup[0] >= univ[i][0]:
            ok = True
            lv = 2 * i + 3
            for it in tup[1]:
                print(f'_exists({lv}, {it}).')
            break

    if ok == False:
        for it in tup[1]:
            print(f'_exists({lv}, {it}).')
