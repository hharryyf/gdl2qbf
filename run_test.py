import subprocess, threading
import os
import sys

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
d = 22
solver = sys.argv[4]
if len(sys.argv) >= 6:
    optional = sys.argv[5]
else:
    optional = ""
com0 = f'clingo --output=smodels 2-player-turn-common{config}.lp  {game}/{game}.lp {game}/{game}-log-domain.lp {optional}  | python extract_ground.py > /dev/null'
os.system(f"bash -c '{com0}'")
os.system('sleep 1')
with open('depth.txt') as f:
    d = int(f.readline())
com1 = f'clingo --output=smodels 2-player-turn-common{config}.lp  {game}/{game}.lp {game}/{game}-log-domain.lp {optional} | python extract_ground.py | python construct_prefix.py {d} > extra-quantifier.lp'
com2 = f"clingo --output=smodels 2-player-turn-common{config}.lp  {game}/{game}.lp {game}/{game}-log-domain.lp {extra} {optional} | python qasp2qbf.py | lp2normal2 | lp2acyc | lp2sat | python qasp2qbf.py --cnf2qdimacs |  bloqqer | qratpre+ --print-formula > out.txt"
os.system(f"bash -c '{com1}'")
os.system('sleep 1')
os.system(f"bash -c '{com2}'")
#print(com1)
com3 = f'time {solver} out.txt'
command = Command(f"bash -c '{com3}'")
command.run(timeout=1805)
