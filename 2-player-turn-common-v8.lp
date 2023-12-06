timedomain(1).
timedomain(T+1) :- movetimedomain(T).

% logarithmic encoding
{moveL(xplayer, M, T) : log_domain(M)} :- movetimedomain(T).

% additional constraints for the GDL encoding.
terminated(T) :- terminal(T).
terminated(T) :- terminated(T-1), timedomain(T).

:- does(P,M,T), not legal(P,M,T).

% existential player must take a move at its turn
1 {does(P,M,T) : move_domain(P, M)} 1 :- not terminated(T), movetimedomain(T), role(P).
:- terminated(T), does(P,M,T).
% game must terminate
:- 0 {terminated(T) : timedomain(T)} 0.
% current player player must reach goal 100
:- terminated(T), not terminated(T-1), not goal(oplayer, 100 ,T).
% existential player is not going to cheat
:- terminated(1), not goal(oplayer, 100 ,1).
