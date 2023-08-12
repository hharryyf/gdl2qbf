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
                        print(f'_exists({lv * 2 - 1}, {atom}).')
                    elif atom[:6] == 'moveL(':
                        print(f'_forall({lv * 2}, {atom}).')
                    else:
                        print(f'_exists({lv * 2 + 1}, {atom}).')