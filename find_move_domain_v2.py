import sys

state = 0
moves = set()
moveL = set()
curr_player = 'xplayer'
other_player = 'oplayer'

for line in sys.stdin:
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

            
            if interest == 'noop':
                continue

            TT = int(TT[1:])
            if TT % 2 == 1 and player == curr_player:
                moves.add('move_domain(' + interest + ')')
                moveL.add(interest)
            elif TT % 2 == 0 and player == other_player:
                moves.add('move_domain(' + interest + ')')
                moveL.add(interest)
            # print(player, interest, TT)

movelist = list(moves)
moveL = list(moveL)

tol, lenl = 0, len(movelist)

while (1 << tol) < lenl:
    tol += 1

print(f'log_domain(1..{tol}).')

print()

j = 0
for i in range(0, 1 << tol):
    if j < len(moveL):
        print(f'does(oplayer, {moveL[j]}, T) :- ', end='')
        for k in range(0, tol):
            if ((i >> k) & 1) == 0:
                print('not ', end='')
            if k == tol - 1:
                if i == 0:
                    print(f'moveL(oplayer,{k+1},T' + '), ' + f'legal(oplayer, {moveL[j]}, T), _player_turn(oplayer, T).')
                else:
                    print(f'moveL(oplayer,{k+1},T' + '), ' + f'legal(oplayer, {moveL[j]}, T).')
            else:
                print(f'moveL(oplayer,{k+1},T' + '), ', end='')
    j += 1

print()

for move in moves:
    print(move + '.')
print()
