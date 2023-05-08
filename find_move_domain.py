import sys

state = 0
moves = set()
moveL = set()
for line in sys.stdin:
    line = line.strip()
    if line == '0':
        state += 1
    elif state == 1:
        atom = line.split()[-1]
        if atom[:5] == 'does(':
            ss = 0
            sm = 0
            does3 = atom[5:-1]
            interest = ''
            for s in does3:    
                if s == '(':
                    sm += 1
                elif s == ')':
                    sm -= 1
                if sm == 0 and s == ',':
                    ss += 1
                if ss == 1:
                    if sm != 0 or s != ',':
                        interest += s
            
            if interest == 'noop':
                continue
            moves.add('move_domain(' + interest + ')')
            moveL.add(interest)

movelist = list(moves)
moveL = list(moveL)

tol, lenl = 0, len(movelist) + 1

while (1 << tol) < lenl:
    tol += 1

print(f'log_domain(1..{tol}).')

print()

j = 0
for i in range(1, 1 << tol):
    if j < len(moveL):
        print(f'does(P, {moveL[j]}, T) :- ', end='')
        for k in range(0, tol):
            if ((i >> k) & 1) == 0:
                print('not ', end='')
            if k == tol - 1:
                print(f'moveL(P,{k+1},T' + ').')
            else:
                print(f'moveL(P,{k+1},T' + '), ', end='')
    else:
        print('cheat(T) :- ', end='')
        for k in range(0, tol):
            if ((i >> k) & 1) == 0:
                print('not ', end='')
            if k == tol - 1:
                print(f'moveL(oplayer,{k+1},T' + ').')
            else:
                print(f'moveL(oplayer,{k+1},T' + '), ', end='')
    j += 1

print()

for move in moves:
    print(move + '.')
print()
