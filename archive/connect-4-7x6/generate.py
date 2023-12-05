import sys


def export_result():
    for line in sys.stdin:
        result = line.strip().split()
        if len(result[0]) >= 20:
            if int(result[1]) > 0:
                if len(result[0]) % 2 == 0:
                    print(result[0], 'SAT')
                else:
                    print(result[0], 'SAT-O')
            else:
                if len(result[0]) % 2 == 0:
                    print(result[0], 'UNSAT')
                else:
                    print(result[0], 'UNSAT-O')


def construct_asp(configname, result):
    a = [0, 0, 0, 0, 0, 0, 0, 0]
    i = 1
    f = open(f"{result}/connect-4-7x6-{configname}.lp", "w")
    for s in configname:
        v = ord(s) - ord('0')
        a[v] += 1
        if i % 2 == 1:
            if result[-1] != 'O':
                f.write(f'true(cell({v}, {a[v]}, xplayer), 1).\n')
            else:
                f.write(f'true(cell({v}, {a[v]}, oplayer), 1).\n')
        else:
            if result[-1] != 'O':
                f.write(f'true(cell({v}, {a[v]}, oplayer), 1).\n')
            else:
                f.write(f'true(cell({v}, {a[v]}, xplayer), 1).\n')
        i += 1
    f.write(f'move_time_domain(1..{42 - len(configname)}).\n')
    f.close()

#export_result()

for line in sys.stdin:
     line = line.strip().split()
     construct_asp(line[0], line[1])
