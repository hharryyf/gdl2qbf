from pyswip import Prolog
import sys
import time
class Board:
    def __init__(self, player, game_name):
        self.player = player
        self.prolog = Prolog()
        self.prolog.consult(game_name)

    def get_role(self):
        result = list(self.prolog.query('role(X)'))
        p = set()
        for res in result:
            p.add(res['X'])
        
        return list(p)

    def get_legal(self):
        result = list(self.prolog.query('legal(X, Y)')) 
        p1 = set()
        p2 = set()
        for res in result:
            if res['X'] == self.player:
                p1.add(f"does({res['X']},{res['Y']})")
            else:
                p2.add(f"does({res['X']},{res['Y']})")

        result = []
        for mv1 in p1:
            for mv2 in p2:
                result.append([mv1, mv2])
        result.sort()
        return result, len(p1), len(p2)       
        
    def is_terminate(self):
        if len(list(self.prolog.query('terminal'))):
            return True
        return False

    def get_reward(self):
        reward = int(list(self.prolog.query(f'goal({self.player}, X)'))[0]['X'])
        return reward 
    
    def add_facts(self, facts):
        for mv in facts:
            self.prolog.assertz(mv)

    def remove_facts(self, facts):
        for mv in facts:
            self.prolog.retractall(mv)

    def get_next(self):
        fact = list(self.prolog.query('next(X)'))
        result = []
        for l in fact:
            nxt = l['X']
            result.append(f'true({nxt})')
        result.sort()
        result = list(set(result))
        return result

    def get_init(self):
        fact = list(self.prolog.query('init(X)'))
        result = []
        for l in fact:
            nxt = l['X']
            result.append(f'true({nxt})')
        result = list(set(result))
        result.sort()
        return result

if len(sys.argv) != 4:
    print('Usage: python minimax.py game-file-path player-name depth-limit')
    exit(1)


player = sys.argv[2]
board = Board(sys.argv[2], sys.argv[1])
table = {}

def minimax(depth, s_true):
    board.add_facts(s_true)
    if board.is_terminate():
        reward = board.get_reward()
        board.remove_facts(s_true)
        if reward == 100:
            return 1, 'nil'
        return 0, 'nil'

    state = tuple(s_true)
    if state in table:
        entry = table[state]
        if entry[0] >= depth or entry[1] == 1:
            board.remove_facts(s_true)
            return entry[1], 'nil'    

    if depth == 0:
        board.remove_facts(s_true)
        return 0, 'nil'

    legal_actions, x_sz, o_sz = board.get_legal()
    board.remove_facts(s_true)
    if x_sz == 0 or o_sz == 0:
        print('Invalid Game description')
        exit(1)
    if x_sz > 1 and o_sz > 1:
        print('Not a turn-taking game')
        exit(1)
    
    reward, action = -1, 'nil'
    if o_sz == 1:
        for move in legal_actions:
            board.add_facts(move)
            board.add_facts(s_true)
            s_next = board.get_next()
            board.remove_facts(s_true)
            board.remove_facts(move)
            nxtr = minimax(depth - 1, s_next)
            nxt = nxtr[0]
            if reward == -1:
                reward = nxt
                action = move
            elif reward < nxt:
                reward = nxt
                action = move
            if reward == 1:
                break
    else:
        for move in legal_actions:
            board.add_facts(move)
            board.add_facts(s_true)
            s_next = board.get_next()
            board.remove_facts(s_true)
            board.remove_facts(move)
            nxtr = minimax(depth - 1, s_next)
            nxt = nxtr[0]
            if reward == -1:
                reward = nxt
                action = move 
            elif reward > nxt:
                reward = nxt
                action = move
            if reward == 0:
                break
    
    if len(table) <= 1000000:
        table[state] = (depth, reward)
    return reward, action

def solve():
    role = board.get_role()
    if player not in role:
        print(f'{player} is not a valid role')
        exit(1)
    if len(role) != 2:
        print('The game is not a two-player game')
        exit(1)
    s_init = board.get_init()
    return minimax(int(sys.argv[3]), s_init)

start = time.time()
result = solve()
end = time.time()
if result[0] == 1:
    print('SAT',result[1])
else:
    print('UNSAT')
print()
print(f'Transposition table size: {len(table)}')
print()
print(f'Time consumed: {round(end - start, 3)}')
