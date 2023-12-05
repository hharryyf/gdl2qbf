# TODO, construct the dependency graph
import sys

predicate = []

if len(sys.argv) >= 2:
    for i in range(1, len(sys.argv)):
        predicate.append(sys.argv[i])

curr = ''

vertices = set()
visited = set()
edge = {}

for line in sys.stdin:
    line = line.strip()
    if len(line) == 0:
        continue
    # this is a comment
    if line[0] == '%':
        continue
    
    if len(curr) != 0:
        curr += ' '
    curr += line
    if curr[-1] == '.':
        #print(curr)
        state = 0
        sm = 0
        head = ''
        body = ''
        has_body = False
        for i in range(0, len(curr)):
            if curr[i] == ':' or curr[i] == '-':
                if head != '':
                    vertices.add(head)
                body = ''
                state = 1
                has_body = True
            else:
                if curr[i] == '(':
                    sm += 1
                elif curr[i] == ')':
                    sm -= 1
                
                if state == 0 and sm == 0 and curr[i] != ')' and curr[i] != '.' and curr[i] != ' ':
                    head += curr[i]
                
                if state == 1 and sm == 0:
                    if curr[i] == ' ' or curr[i] == '.' or curr[i] == ')' or curr[i] == ',':
                        if body == '' or body == 'not' or body[0] < 'a' or body[0] > 'z':
                            body = ''
                            continue
                        else:
                            vertices.add(body)
                            if (body != 'does' or head != 'true') and head != body:
                                if body in edge:
                                    if head != '':
                                        edge[body].add(head)
                                else:
                                    edge[body] = set()
                                    edge[body].add(head)
                        body = ''
                    else:
                        body += curr[i]
        
        if has_body == False and head != '':
            vertices.add(head)

        #print(head)
        curr = ''
#print(vertices)
#print(edge)

vertices.add('terminated')
edge['terminal'] = set()
edge['terminal'].add('terminated')

def dfs(v):
    visited.add(v)
    if v in edge:
        for nxt in edge[v]:
            if nxt not in visited:
                dfs(nxt)


for v in predicate:
    if v not in visited:
        dfs(v)

vertices.remove('time_domain')
vertices.remove('move_time_domain')

for v in visited:
    print(v + '(')
print(0)
complement = set()
for v in vertices:
    if v not in visited:
        print(v + '(')
print(0)