import sys
import time
from minimax_c import Solver

if len(sys.argv) != 4:
    print('Usage: python run_minimax_solver.py [game-file-path] [player-name] [depth-limit]')
    exit(1)


solver = Solver(sys.argv[2], sys.argv[1], int(sys.argv[3]))


start = time.time()
result = solver.solve()
end = time.time()
if result == 1:
    print('SAT')
else:
    print('UNSAT')
print()
print(f'Transposition table size: {len(solver.table)}')
print()
print(f'Time consumed: {round(end - start, 3)}')
