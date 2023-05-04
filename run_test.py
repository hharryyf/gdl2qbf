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

if len(sys.argv) != 6:
    print('Usage python run_test [game] [-version] [extra-quantifier.lp] [d] [solver]')
    exit(1)

game = sys.argv[1]
config = sys.argv[2]
extra = sys.argv[3]
d = sys.argv[4]
solver = sys.argv[5]
com1 = f'clingo --output=smodels 2-player-turn-common{config}.lp  {game}/{game}.lp {game}/{game}-log-domain.lp  | python extract_ground.py | python construct_prefix.py {d} > extra-quantifier.lp'
com2 = f"clingo --output=smodels 2-player-turn-common{config}.lp  {game}/{game}.lp {game}/{game}-log-domain.lp {extra} | python qasp2qbf.py | lp2normal2 | lp2acyc | lp2sat | python qasp2qbf.py --cnf2qdimacs |  bloqqer | qratpre+ --print-formula > out.txt"
os.system(f"bash -c '{com1}'")
os.system('sleep 1')
os.system(f"bash -c '{com2}'")
com3 = f'time {solver} out.txt'
command = Command(f"bash -c '{com3}'")
command.run(timeout=1805)
