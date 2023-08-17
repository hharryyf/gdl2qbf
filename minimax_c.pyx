from pyswip import Prolog

cdef class Board:
    cdef public:
        str player
        object prolog
    def __init__(self, player, game_name):
        self.player = player
        self.prolog = Prolog()
        self.prolog.consult(game_name)

    cpdef list get_role(self):
        cdef list result = list(self.prolog.query('role(X)'))
        cdef set p = set()
        cdef dict res
        for res in result:
            p.add(res['X'])
        
        return list(p)

    cpdef tuple get_legal(self):
        cdef list result = list(self.prolog.query('legal(X, Y)')) 
        cdef set p1 = set()
        cdef set p2 = set()
        cdef dict res
        cdef str mv1 
        cdef str mv2
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
        
    cpdef bint is_terminate(self):
        if len(list(self.prolog.query('terminal'))):
            return True
        return False

    cpdef int get_reward(self):
        cdef int reward = int(list(self.prolog.query(f'goal({self.player}, X)'))[0]['X'])
        return reward 
    
    cpdef add_facts(self, list facts):
        cdef int i
        for i in range(0, len(facts)):
            self.prolog.assertz(facts[i])

    cpdef remove_facts(self, list facts):
        cdef int i
        for i in range(0, len(facts)):
            self.prolog.retractall(facts[i])

    cpdef list get_next(self):
        cdef list fact = list(self.prolog.query('next(X)'))
        cdef list result = []
        cdef str nxt
        cdef int i 
        for i in range(len(fact)):
            nxt = fact[i]['X']
            result.append(f'true({nxt})')
        result = list(set(result))
        result.sort()
        return result

    cpdef list get_init(self):
        cdef list fact = list(self.prolog.query('init(X)'))
        cdef list result = []
        cdef str nxt
        cdef int i 
        for i in range(len(fact)):
            nxt = fact[i]['X']
            result.append(f'true({nxt})')
        result = list(set(result))
        result.sort()
        return result

cdef class Solver:
    cdef public:
        Board board 
        str player 
        int depth
        dict table 
    
    def __init__(self, name, file, depth):
        self.board = Board(name, file)
        self.player = name
        self.depth = depth
        self.table = {}
    
    cpdef int minimax(self, int depth, list s_true):
        cdef int reward
        cdef tuple state
        cdef tuple entry
        cdef list legal_actions 
        cdef list move
        cdef int x_sz 
        cdef int o_sz

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


    cpdef int solve(self):
        cpdef list role = self.board.get_role()
        if self.player not in role:
            print(f'{self.player} is not a valid role')
            exit(1)
        if len(role) != 2:
            print('The game is not a two-player game')
            exit(1)
        cpdef list s_init = self.board.get_init()
        return self.minimax(self.depth, s_init)
