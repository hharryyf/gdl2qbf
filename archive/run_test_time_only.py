import subprocess, threading
import os
import sys
import time

class Command(object):
    def __init__(self, cmd):
        self.cmd = cmd
        self.process = None

    def run(self, timeout):
        def target():
            #print('Thread started')
            self.process = subprocess.Popen(self.cmd, shell=True)
            self.process.communicate()
            #print('Thread finished')

        thread = threading.Thread(target=target)
        thread.start()

        thread.join(timeout)
        if thread.is_alive():
            #print('Terminating process')
            self.process.terminate()
            thread.join()
        #print(self.process.returncode)

if len(sys.argv) < 5:
    print('Usage python run_test [game] [-version] [extra-quantifier.lp] [solver] [optional configuration file]')
    exit(1)


game = sys.argv[1]
config = sys.argv[2]
extra = sys.argv[3]


config = '-v8'
config2 = '-v5'

d = 22
solver = sys.argv[4]
if len(sys.argv) >= 6:
    optional = sys.argv[5]
else:
    optional = ""

com3 = f'cat {game}/{game}.lp {optional} | python calculate_dependency.py does true > static_rel.txt'
com4 = f'cat {game}/{game}.lp {optional} | python calculate_dependency.py does > no_does.txt'

os.system(f"bash -c '{com3}'")
os.system(f"bash -c '{com4}'")
os.system('sleep 1')
com0 = f'clingo --output=smodels 2-player-turn-common{config}.lp  {game}/{game}.lp {game}/turn.lp {game}/{game}-log-domain{config2}.lp {optional}  | python extract_ground.py > /dev/null'
os.system(f"bash -c '{com0}'")
os.system('sleep 1')
with open('depth.txt') as f:
     d = int(f.readline())

com5 = f'clingo --output=smodels 2-player-turn-common{config}.lp  {game}/{game}.lp {game}/turn.lp {game}/{game}-log-domain{config2}.lp {optional}  > smodels.txt'
os.system(f"bash -c '{com5}'")
os.system('sleep 1')
com1 = f'python build_dependency_time.py  > extra-quantifier.lp'
com2 = f"clingo --output=smodels 2-player-turn-common{config}.lp  {game}/{game}.lp {game}/turn.lp {game}/{game}-log-domain{config2}.lp {extra} {optional} | python qasp2qbf.py | lp2normal2 | lp2acyc | lp2sat | python qasp2qbf.py --cnf2qdimacs > out_plain.txt"
com22 = 'bloqqer --keep=0 out_plain.txt > out.txt'
os.system(f"bash -c '{com1}'")
os.system('sleep 1')
os.system(f"bash -c '{com2}'")
os.system('sleep 1')
start = time.time()
os.system(f"bash -c '{com22}'")
end = time.time()
print('preprocessing time', round(end - start, 3))
#print(com1)
com3 = f'time {solver} out.txt'
command = Command(f"bash -c '{com3}'")
command.run(timeout=1205)

# extract all non-static ground atoms
# com4 = f'clingo --output=smodels 2-player-turn-common{config}.lp  {game}/{game}.lp {game}/turn.lp {game}/{game}-log-domain{config2}.lp {optional} | python extract_ground.py'
