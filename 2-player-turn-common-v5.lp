does(P, M, T) :- _player_turn(O,T), _other_player(O,P), not terminated(T), move_time_domain(T), legal(P, M, T).


time_domain(1).
time_domain(T+1) :- move_time_domain(T).

{does(xplayer, M, T) : move_domain(M)} :- _player_turn(xplayer,T).
{moveL(oplayer, M, T) : log_domain(M)} :- _player_turn(oplayer,T).

% additional constraints for the GDL encoding.

terminated(T) :- terminal(T).
terminated(T) :- terminated(T-1), time_domain(T).

:- does(P,M,T), not legal(P,M,T).

% existential player must take a move at its turn
1 {does(P,M,T) : move_domain(M)} 1 :- not terminated(T), _player_turn(P, T).
:- terminated(T), does(P,M,T).
% game must terminate
:- 0 {terminated(T) : time_domain(T)} 0.
% x player must reach goal 100 or the universal player cheat
:- terminated(T), not terminated(T-1), not goal(xplayer, 100 ,T).
% existential player is not going to cheat
:- terminated(1), not goal(xplayer, 100 ,1).
