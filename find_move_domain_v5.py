import sys
import os

state = 0
moves = set()
moveL = set()
moveL1 = set()
moveO = set()
moveX = set()
curr_player = 'xplayer'
other_player = 'oplayer'

if len(sys.argv) < 2:
    print('Usage: python find_move_domain_v5.py [all the game encoding files]')
    exit(1)

if len(sys.argv) >= 4:
    curr_player = sys.argv[2]
    other_player = sys.argv[3]

cmd1 = 'clingo --output=smodels '
file = f'{sys.argv[1]} move-domain.lp > move_smodels.txt'


cmd1 += file

os.system(f"bash -c '{cmd1}'")


xturn = set()
oturn = set()
    
with open('move_smodels.txt', 'r') as f:
    for line in f:
        line = line.strip()
        if line == '0':
            state += 1
        elif state == 1:
            atom = line.split()[-1]
            if atom[:15] == 'movetimedomain(':
                xturn.add(int(atom[15:-1]))
                oturn.add(int(atom[15:-1]))

state = 0

with open('move_smodels.txt', 'r') as ff:
    for line in ff:
        line = line.strip()
        if line == '0':
            state += 1
        elif state == 1:
            atom = line.split()[-1]
            if atom[:6] == 'legal(':
                ss = 0
                sm = 0
                does3 = atom[6:-1]
                interest = ''
                player = ''
                TT = ''
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
                    if ss == 0:
                        player += s
                    if ss == 2:
                        TT += s
                
                TT = int(TT[1:])
                
                if player == curr_player and TT in xturn:
                    moveX.add(interest)
                elif player == other_player and TT in oturn:
                    moveO.add(interest)
                    

lit = sys.argv[1:].copy()
lit.append('move-domain.lp')

for mv in moveX:
    moves.add(f'move_domain({curr_player},' + mv + ')')

for mv in moveO:
    moves.add(f'move_domain({other_player},' + mv + ')')
    moveL.add(mv)

movelist = list(moves)
moveL = list(moveL)
moves = list(moves)
moves.sort()
moveL.sort()
movelist.sort()

tol, lenl = 0, len(moveL)

while (1 << tol) < lenl:
    tol += 1

print(f'log_domain(1..{tol}).')

print()

j = 0
for i in range(0, 1 << tol):
    if j < len(moveL):
        print(f'does({other_player}, {moveL[j]}, T) :- ', end='')
        for k in range(0, tol):
            if ((i >> k) & 1) == 0:
                print('not ', end='')
            if k == tol - 1:
                if i == 0:
                    print(f'moveL({other_player},{k+1},T' + '), ' + f'legal({other_player}, {moveL[j]}, T), movetimedomain(T), not terminated(T).')
                else:
                    print(f'moveL({other_player},{k+1},T' + '), ' + f'legal({other_player}, {moveL[j]}, T), movetimedomain(T), not terminated(T).')
            else:
                print(f'moveL({other_player},{k+1},T' + '), ', end='')
    j += 1

print()

for move in moves:
    print(move + '.')
print()
