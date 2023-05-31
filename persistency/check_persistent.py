import os
import sys

if len(sys.argv) != 2:
    print('Usage: python check_persistent.py [game_name]')

game = sys.argv[1]

com0 = f'clingo 2-player-turn-common-v2.lp  {game}/{game}.lp {game}/{game}-log-domain.lp persistent.lp'
os.system(f"bash -c '{com0}'")
