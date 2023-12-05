from clyngor import solve
import sys 
import time

if len(sys.argv) < 3:
    print('usage: python find_turn.py game depth [optional configuration file]')
    exit(1)

game = sys.argv[1]
depth = int(sys.argv[2])
optional = ''

if len(sys.argv) == 4:
    optional = sys.argv[3]


print('_other_player(xplayer,oplayer). _other_player(oplayer,xplayer).')
print()

answer = solve(files=(f'{game}/{game}.lp', f'{optional}', 'proof-turn-taking.lp'), nb_model=1)

cnt = 0 
cnt1 = 0
for ans in answer:
    cnt += 1
    print(ans)
if cnt == 1:
    print('not turn-taking game')
    exit(1)

timelimit = 10

for i in range(1, depth + 1):
    start = time.time()
    cnt = 0
    answer = solve(files=(f'{game}/{game}.lp', f'{optional}', 'check_turn_player.lp'), nb_model=1, inline=f'step({i}). tplayer(oplayer). move_time_domain(1..{depth}).', time_limit=timelimit+1)
    for ans in answer:
        #print(ans)
        cnt += 1
    end = time.time()
    ok = False
    if end - start <= timelimit:
        if cnt == 0:
            print(f'_player_turn(xplayer, {i}) :- move_time_domain({i}).')
            ok = True
        else:
            start = time.time()
            cnt = 0
            answer = solve(files=(f'{game}/{game}.lp', f'{optional}', 'check_turn_player.lp'), nb_model=1, inline=f'step({i}). tplayer(xplayer). move_time_domain(1..{depth}).', time_limit=timelimit+1)
            for ans in answer:
                #print(ans)
                cnt += 1
            end = time.time()
            if cnt == 0 and end - start <= timelimit:
                ok = True
                print(f'_player_turn(oplayer, {i}) :- move_time_domain({i}).')
    else:
        start = time.time()
        cnt = 0
        answer = solve(files=(f'{game}/{game}.lp', f'{optional}', 'check_turn_player.lp'), nb_model=1, inline=f'step({i}). tplayer(xplayer).', time_limit=timelimit+1)
        for ans in answer:
            #print(ans)
            cnt += 1
        end = time.time()
        if end - start <= timelimit:
            if cnt == 0:
                ok = True
                print(f'_player_turn(oplayer, {i}) :- move_time_domain({i}).')
        
    if ok == False:
        print(f'% Game not strictly turn-taking after move {i}')
        break
        #print(f'_player_turn(oplayer, {i}) :- move_time_domain({i}).')
        #print(f'_player_turn(xplayer, {i}) :- move_time_domain({i}).')
