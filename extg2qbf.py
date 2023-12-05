import os
import sys
import time

gamefile = 'game.lp'

if len(sys.argv) > 1:
    gamefile = sys.argv[1]

cmd = f'python find_move_domain_v5.py {gamefile} > game-log-domain-v5.lp'

os.system(f"bash -c '{cmd}'")

cmd = f'clingo --output=smodels 2-player-turn-common-v8.lp  {gamefile} game-log-domain-v5.lp  > smodels.txt'

os.system(f"bash -c '{cmd}'")

cmd = 'python build_dependency.py > extra-quantifier.lp'

os.system(f"bash -c '{cmd}'")

cmd = f'clingo --output=smodels 2-player-turn-common-v8.lp  {gamefile} game-log-domain-v5.lp extra-quantifier.lp | python qasp2qbf.py | lp2normal2 | lp2acyc | lp2sat | python qasp2qbf.py --cnf2qdimacs > game.qdimacs'

os.system(f"bash -c '{cmd}'")

cmd = 'bloqqer --keep=0 game.qdimacs > game_bloqqer.qdimacs'

print('Bloqqer preprocessing start')

start = time.time()

os.system(f"bash -c '{cmd}'")

end = time.time()

print(f'Bloqqer finishes in {round(end - start, 2)}s')
