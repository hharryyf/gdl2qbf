import os

cmd = 'python find_move_domain_v5.py game.lp > game-log-domain-v5.lp'

os.system(f"bash -c '{cmd}'")

cmd = 'clingo --output=smodels 2-player-turn-common-v8.lp  game.lp game-log-domain-v5.lp  > smodels.txt'

os.system(f"bash -c '{cmd}'")

cmd = 'python build_dependency.py > extra-quantifier.lp'

os.system(f"bash -c '{cmd}'")

cmd = 'clingo --output=smodels 2-player-turn-common-v8.lp  game.lp game-log-domain-v5.lp extra-quantifier.lp | python qasp2qbf.py | lp2normal2 | lp2acyc | lp2sat | python qasp2qbf.py --cnf2qdimacs > out_plain.txt'

os.system(f"bash -c '{cmd}'")

