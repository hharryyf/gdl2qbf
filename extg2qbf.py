import os
import sys
import time
import queue


def print_2_player_asp(current, other, file):
    '''
        current is the current player
        other is the other player
        if empty, current = 'xplayer', other = 'oplayer'

        Output the (unquantified) answer set program that models the 2 player game, excluding the logrithmic encoding
        of the universal player to "file"
    '''
    f = open(file=file, mode='w')
    print("timedomain(1).",file=f)
    print("timedomain(T+1) :- movetimedomain(T).",file=f)
    print(file=f)
    print("% logarithmic encoding",file=f)
    print(f"{{moveL({other}, M, T) : log_domain(M)}} :- movetimedomain(T).",file=f)
    print(file=f)
    print("% additional constraints for the GDL encoding.",file=f)
    print("terminated(T) :- terminal(T).",file=f)
    print("terminated(T) :- terminated(T-1), timedomain(T).",file=f)
    print(file=f)
    print(":- does(P,M,T), not legal(P,M,T).",file=f)
    print(file=f)
    print("% existential player must take a move at its turn",file=f)
    print("1 {does(P,M,T) : move_domain(P, M)} 1 :- not terminated(T), movetimedomain(T), role(P).",file=f)
    print(":- terminated(T), does(P,M,T).",file=f)
    print("% game must terminate",file=f)
    print(":- 0 {terminated(T) : timedomain(T)} 0.",file=f)
    print("% current player player must reach goal 100",file=f)
    print(f":- terminated(T), not terminated(T-1), not goal({current}, 100 ,T).",file=f)
    print("% existential player is not going to cheat",file=f)
    print(f":- terminated(1), not goal({current}, 100 ,1).",file=f)
    f.close()


def logarithmic_encoding(gamefile, current, other, logfile):
    '''
        The logarithmic encoding function
        Read a game description gamefile in ASP
        Encode other player's action logarithmically, and output the encoding to logfile
    '''
    curr_player = current
    other_player = other
    state = 0
    moves, moveL, moveO, moveX  = set(), set(), set(), set()
    
    cmd1 = f'clingo --output=smodels {gamefile} move-domain.lp > move_smodels.txt'
    os.system(f"bash -c '{cmd1}'")

    xturn, oturn = set(), set()
    logfile = open(file=logfile,mode='w')

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
                    ss, sm = 0, 0
                    does3 = atom[6:-1]
                    interest, player, TT = '', '', ''
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
                        
    for mv in moveX:
        moves.add(f'move_domain({curr_player},' + mv + ')')

    for mv in moveO:
        moves.add(f'move_domain({other_player},' + mv + ')')
        moveL.add(mv)

    moveL = list(moveL)
    moves = list(moves)
    moves.sort()
    moveL.sort()
    
    tol, lenl = 0, len(moveL)
    while (1 << tol) < lenl:
        tol += 1

    print(f'log_domain(1..{tol}).', file=logfile)
    print(file=logfile)

    j = 0
    for i in range(0, 1 << tol):
        if j < len(moveL):
            print(f'does({other_player}, {moveL[j]}, T) :- ', end='', file=logfile)
            for k in range(0, tol):
                if ((i >> k) & 1) == 0:
                    print('not ', end='', file=logfile)
                if k == tol - 1:
                    if i == 0:
                        print(f'moveL({other_player},{k+1},T' + '), ' + f'legal({other_player}, {moveL[j]}, T), movetimedomain(T), not terminated(T).', file=logfile)
                    else:
                        print(f'moveL({other_player},{k+1},T' + '), ' + f'legal({other_player}, {moveL[j]}, T), movetimedomain(T), not terminated(T).', file=logfile)
                else:
                    print(f'moveL({other_player},{k+1},T' + '), ', end='', file=logfile)
        j += 1

    print(file=logfile)
    for move in moves:
        print(move + '.', file=logfile)
    print(file=logfile)
    logfile.close()

def build_quantifier(current, other, gamefile, logfile, quantifier):
    '''
        Construct the quantifier prefix of the QASP based on the encoding method GD
        specify the gamefile, the logarithmic encoding file, output to the quantifier file
    '''

    cmd = f'clingo --output=smodels 2-player-turn-common-v8.lp  {gamefile} {logfile}  > smodels.txt'
    os.system(f"bash -c '{cmd}'")

    outputfile = open(file=quantifier, mode='w')

    bad = ['log_domain(', 'timedomain(', 'movetimedomain(', 'move_domain(', '_']
    state, mxv = 0, 0
    edge = set()
    vertex, universal, exist = {}, {}, {}

    with open('smodels.txt') as f:
        for line in f:
            line = line.strip()
            if line == '0':
                state += 1
                continue
            if state == 0:
                line = list(map(int, line.split()))
                # normal rule
                # head number_of_lit number_of_neg_lit [negative lit] [positive lit]
                if line[0] == 1:
                    head = line[1]
                    for i in range(4, len(line)):
                        if line[i] == 1:
                            print('Unexpected Error')
                            exit(1)
                        edge.add((line[i], head))
                # head number_of_lit number_of_neg_lit bound [negative lit] [positive lit]
                elif line[0] == 2:
                    head = line[1]
                    for i in range(5, len(line)):
                        edge.add((line[i], head))
                # number_of_head [head] number_of_lit number_of_neg_lit [negative lit] [positive lit]
                elif line[0] == 3:
                    head_num = line[1]
                    head = []
                    for i in range(2, head_num + 2):
                        head.append(line[i])
                    # this part can be optimized
                    for i in range(head_num + 4, len(line)):
                        for h in head:
                            edge.add((line[i], h))
                else:
                    print('Cannot handle rule of type 4+ in Clingo!')
                    exit(1)
            elif state == 1:
                line = line.split()
                vid, atom = int(line[0]), line[1]
                ok = True
                for b in bad:
                    if atom[:len(b)] == b:
                        ok = False
                if ok:
                    mxv = max(mxv, vid)
                    newl = atom.replace('(', ',').replace(')',',').split(',')
                    lencurr = len(f'does({current},')
                    if atom[:lencurr] != f'does({current},' and atom[:6] != 'moveL(':
                        vertex[vid] = (atom, -1)
                        continue

                    lv = -1
                    for i in range(len(newl) - 1, -1, -1):
                        if len(newl[i]) and newl[i] != '\n':
                            lv = int(newl[i])
                            break
                    if lv != -1:
                        vertex[vid] = (atom, lv)
                        if atom[:lencurr] == f'does({current},':
                            if lv in exist:
                                exist[lv].append(vid)
                            else:
                                exist[lv] = []
                                exist[lv].append(vid)
                        elif atom[:6] == 'moveL(':
                            if lv in universal:
                                universal[lv].append(vid)
                            else:
                                universal[lv] = []
                                universal[lv].append(vid)

    for e in edge:
        mxv = max(mxv, max(e[0], e[1]))

    univ_out = []
    exist_in = []
    for univ in universal.items():
        lv = univ[0]
        univ_out.append((lv, mxv + 1))
        for uv in univ[1]:
            edge.add((uv, mxv + 1))
        mxv += 1

    for exi in exist.items():
        lv = exi[0]
        exist_in.append((lv, mxv + 1))
        for ex in exi[1]:
            edge.add((mxv + 1, ex))
        mxv += 1

    univ_out.sort()
    exist_in.sort()

    luniv, lexist = len(univ_out), len(exist_in)
    i, j = luniv - 1, lexist - 1
    while i >= 0:
        while j >= 0 and exist_in[j][0] > univ_out[i][0]:
            edge.add((univ_out[i][1], exist_in[j][1]))
            j -= 1
        i -= 1

    graph = []
    visited = []
    for i in range(0, mxv + 1):
        graph.append([])
        visited.append(-1)

    for e in edge:
        graph[e[0]].append(e[1])

    def bfs(v, uv, depth):
        q = queue.Queue()
        q.put(v)
        while q.empty() == False:
            curr = q.get()
            if visited[curr] == 1:
                continue
            if uv != curr and curr in vertex:
                print(f'_exists({depth},{vertex[curr][0]}).', file=outputfile)
            visited[curr] = 1

            for nxt in graph[curr]:
                if visited[nxt] != 1:
                    q.put(nxt)

    for i in range(luniv - 1, -1, -1):
        for uv in universal[univ_out[i][0]]:
            print(f'_forall({i * 2 + 2},{vertex[uv][0]}).', file=outputfile)
        for uv in universal[univ_out[i][0]]:
            if visited[uv] != 1:
                bfs(uv, uv, i * 2 + 3)

    for i in range(1, mxv + 1):
        if i in vertex and visited[i] != 1:
            print(f'_exists(1,{vertex[i][0]}).', file=outputfile)

    outputfile.close()


def gdl2qbf(current, other, gamefile, preprocess=True):
    curr_player = current
    other_player = other
    encodefile = '2-player-turn-common-v8.lp'

    print_2_player_asp(current=curr_player, other=other_player, file=encodefile)
    logarithmic_encoding(gamefile, curr_player, other_player, 'game-log-domain-v5.lp')
    build_quantifier(curr_player, other_player, gamefile, 'game-log-domain-v5.lp', 'extra-quantifier.lp')
    cmd = f'clingo --output=smodels 2-player-turn-common-v8.lp  {gamefile} game-log-domain-v5.lp extra-quantifier.lp | python qasp2qbf.py | lp2normal2 | lp2acyc | lp2sat | python qasp2qbf.py --cnf2qdimacs > game.qdimacs'
    os.system(f"bash -c '{cmd}'")

    if preprocess == True:
        cmd = 'bloqqer --keep=0 game.qdimacs > game_bloqqer.qdimacs'
        print('Bloqqer preprocessing start')
        start = time.time()
        os.system(f"bash -c '{cmd}'")
        end = time.time()
        print(f'Bloqqer finishes in {round(end - start, 2)}s')

if __name__ == "__main__":
    if len(sys.argv) != 5:
        print("Usage: python extg2qba.py [path to the Ext(G) gamefile] [current player] [other player] [True|False]")
        exit(1)


    if sys.argv[4].lower() == 'true':
        gdl2qbf(sys.argv[2], sys.argv[3], sys.argv[1], True)
    else:
        gdl2qbf(sys.argv[2], sys.argv[3], sys.argv[1], False)