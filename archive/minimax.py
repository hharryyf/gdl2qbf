from pyswip import Prolog

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


class Solver:
    def __init__(self, name, file, depth):
        self.board = Board(name, file)
        self.player = name
        self.depth = depth
        self.table = {}
    
    def minimax(self, depth, s_true):
        self.board.add_facts(s_true)
        if self.board.is_terminate():
            reward = self.board.get_reward()
            self.board.remove_facts(s_true)
            if reward == 100:
                return 1
            return 0

        state = tuple(s_true)
        if state in self.table:
            entry = self.table[state]
            if entry[0] >= depth or entry[1] == 1:
                self.board.remove_facts(s_true)
                return entry[1]    

        if depth == 0:
            self.board.remove_facts(s_true)
            return 0

        legal_actions, x_sz, o_sz = self.board.get_legal()
        self.board.remove_facts(s_true)
        if x_sz == 0 or o_sz == 0:
            print('Invalid Game description')
            exit(1)
        if x_sz > 1 and o_sz > 1:
            print('Not a turn-taking game')
            exit(1)
        
        reward = -1
        if o_sz == 1:
            for move in legal_actions:
                self.board.add_facts(move)
                self.board.add_facts(s_true)
                s_next = self.board.get_next()
                self.board.remove_facts(s_true)
                self.board.remove_facts(move)
                if reward == -1:
                    reward = self.minimax(depth - 1, s_next)
                else:
                    reward = max(reward, self.minimax(depth - 1, s_next))
                if reward == 1:
                    break
        else:
            for move in legal_actions:
                self.board.add_facts(move)
                self.board.add_facts(s_true)
                s_next = self.board.get_next()
                self.board.remove_facts(s_true)
                self.board.remove_facts(move)
                if reward == -1:
                    reward = self.minimax(depth - 1, s_next)
                else:
                    reward = min(reward, self.minimax(depth - 1, s_next))
                if reward == 0:
                    break
        
        if len(self.table) <= 1000000:
            self.table[state] = (depth, reward)
        return reward


    def solve(self):
        role = self.board.get_role()
        if self.player not in role:
            print(f'{self.player} is not a valid role')
            exit(1)
        if len(role) != 2:
            print('The game is not a two-player game')
            exit(1)
        s_init = self.board.get_init()
        return self.minimax(self.depth, s_init)
