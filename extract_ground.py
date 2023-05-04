import sys
import re
state = 0

for line in sys.stdin:
    line = line.strip()
    if line == '0':
        state += 1
    elif state == 1:
        atom = line.split()[-1]
        if atom[:5] != 'moveL' and atom[:2] != 'x(' and atom[:2] != 'y(' and atom[:5] != 'succ(' and atom[:11] != 'time_domain' and atom[0] != '_' and atom[:4] != 'role' and atom[:5] != 'move_' and atom[:4] != 'log_':
            if atom[:5] != 'cell(' and atom[:13] != 'distinctCell(' and atom[:6] != 'xindex' and atom[:6] != 'yindex' and atom[:9] != 'xplusplus' and atom[:9] != 'yplusplus' and atom[:8] != 'plusplus' and atom[:5] != 'index':
                print(atom)

