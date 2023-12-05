import sys
file = sys.argv[1]
with open(file, 'r') as f:
    var = 0
    clause = 0
    block = 0
    univ = 0
    for line in f:
        line = line.strip()
        if line[0] == 'e' or line[0] == 'a' or line[0] == 'p':
            if line[0] == 'p':
                line = line.split()
                var = int(line[2])
                clause = int(line[3])
            elif line[0] == 'a':
                line = line.split()
                for l in line:
                    if l == 'a' or l == '0':
                        continue
                    else:
                        univ += 1
            if line[0] == 'a' or line[0] == 'e':
                block += 1
        else:
            break
    print('Var: ', var, 'Clause: ', clause, 'Univ: ', univ, 'Block: ', block)
