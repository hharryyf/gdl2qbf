% does(P, M, T) :- _player_turn(O,T), _other_player(O,P), not terminated(T), move_time_domain(T), legal(P, M, T).

% _player_turn(P, T) :- role(P), move_time_domain(T).

timedomain(1).
timedomain(T+1) :- movetimedomain(T).

%{does(xplayer, M, T) : move_domain(M)} :- _player_turn(xplayer,T).
{moveL(oplayer, M, T) : log_domain(M)} :- movetimedomain(T).

% additional constraints for the GDL encoding.

terminated(T) :- terminal(T).
terminated(T) :- terminated(T-1), timedomain(T).

:- does(P,M,T), not legal(P,M,T).

% existential player must take a move at its turn
1 {does(P,M,T) : move_domain(P, M)} 1 :- not terminated(T), movetimedomain(T), role(P).
:- terminated(T), does(P,M,T).
% game must terminate
:- 0 {terminated(T) : timedomain(T)} 0.
% x player must reach goal 100 or the universal player cheat
:- terminated(T), not terminated(T-1), not goal(xplayer, 100 ,T).
% existential player is not going to cheat
:- terminated(1), not goal(xplayer, 100 ,1).
