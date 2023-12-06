import sys

'''

Accept 0/2 cmd args
argv[1] is the current player
argv[2] is the other player
if empty, current = 'xplayer', other = 'oplayer'

Output the (unquantified) answer set program that models the 2 player game, excluding the logrithmic encoding
of the universal player

'''

current = 'xplayer'
other = 'oplayer'

if len(sys.argv) > 2:
    current = sys.argv[1]
    other = sys.argv[2]

print("timedomain(1).")
print("timedomain(T+1) :- movetimedomain(T).")
print()
print("% logarithmic encoding")
print(f"{{moveL({other}, M, T) : log_domain(M)}} :- movetimedomain(T).")
print()
print("% additional constraints for the GDL encoding.")
print("terminated(T) :- terminal(T).")
print("terminated(T) :- terminated(T-1), timedomain(T).")
print()
print(":- does(P,M,T), not legal(P,M,T).")
print()
print("% existential player must take a move at its turn")
print("1 {does(P,M,T) : move_domain(P, M)} 1 :- not terminated(T), movetimedomain(T), role(P).")
print(":- terminated(T), does(P,M,T).")
print("% game must terminate")
print(":- 0 {terminated(T) : timedomain(T)} 0.")
print("% current player player must reach goal 100")
print(f":- terminated(T), not terminated(T-1), not goal({current}, 100 ,T).")
print("% existential player is not going to cheat")
print(f":- terminated(1), not goal({current}, 100 ,1).")