import queue

bad = ['log_domain(', 'time_domain(', 'move_time_domain(', 'move_domain(', '_']
with open('static_rel.txt', 'r') as f:
    lines = f.readlines()
    #print(lines)
    state = 0
    for line in lines:
        line = line.strip()
        if line == '0':
            state += 1
        else:
            if state == 1:
                bad.append(line)

state = 0

edge = set()

vertex = {}

universal = {}
exist = {}
mxv = 0

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
                print('NO NO NO!')
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
                lv = -1
                for i in range(len(newl) - 1, -1, -1):
                    if len(newl[i]) and newl[i] != '\n':
                        lv = int(newl[i])
                        break
                if lv != -1:
                    vertex[vid] = (atom, lv)
                    if atom[:13] == 'does(xplayer,':
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

luniv = len(univ_out)
lexist = len(exist_in)
i = luniv - 1
j = lexist - 1
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
            print(f'_exists({depth},{vertex[curr][0]}).')
        visited[curr] = 1

        for nxt in graph[curr]:
            if visited[nxt] != 1:
                q.put(nxt)

for i in range(luniv - 1, -1, -1):
    for uv in universal[univ_out[i][0]]:
        print(f'_forall({i * 2 + 2},{vertex[uv][0]}).')
    for uv in universal[univ_out[i][0]]:
        if visited[uv] != 1:
            bfs(uv, uv, i * 2 + 3)

for i in range(1, mxv + 1):
    if i in vertex and visited[i] != 1:
        print(f'_exists(1,{vertex[i][0]}).')

# with open("graph.txt", "w") as f:
#     print(mxv, len(vertex), len(edge), file=f)
#     for v in vertex.items():
#         print(v[0], v[1][0], v[1][1], file=f)
#     for e in edge:
#         print(e[0], e[1], file=f)
#     for uv in universal.items():
#         print(len(uv[1]), uv[0], file=f)
#         for u in uv[1]:
#             print(u, end=' ', file=f)
#         print('', file=f)
