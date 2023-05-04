% define turns
_other_player(xplayer,oplayer). _other_player(oplayer,xplayer).

_player_turn(xplayer,1).
_player_turn(O,T+1) :- _player_turn(P,T), _other_player(P,O), move_time_domain(T+1).

does(P, noop, T) :- _player_turn(O,T), _other_player(O,P), not terminated(T), move_time_domain(T).

time_domain(1).
time_domain(T+1) :- move_time_domain(T).
% Quantifiers
_exists(T, moveL(xplayer, M, T)) :- _player_turn(xplayer,T), log_domain(M).
_forall(T, moveL(oplayer, M, T)) :- _player_turn(oplayer,T), log_domain(M).

{moveL(xplayer, M, T) : log_domain(M)} :- _player_turn(xplayer,T).
{moveL(oplayer, M, T) : log_domain(M)} :- _player_turn(oplayer,T).


% additional constraints for the GDL encoding.

terminated(T) :- terminal(T).
terminated(T) :- terminated(T-1), time_domain(T).

terminated(T+1) :- cheat(T).
cheat(T) :- cheat(T-1), move_time_domain(T).

:- does(xplayer,M,T), not legal(xplayer,M,T).
cheat(T) :- does(oplayer,M,T), not legal(oplayer,M,T), move_domain(M).

% existential player must take a move at its turn
:- not terminated(T), _player_turn(xplayer, T), 2 {does(xplayer,M,T) : move_domain(M)} .
:- not terminated(T), _player_turn(xplayer, T), 0 {does(xplayer,M,T) : move_domain(M)} 0.
:- terminated(T), moveL(xplayer,M,T).
cheat(T) :- not terminated(T), _player_turn(oplayer, T), 0 {does(oplayer, M, T)} 0.
cheat(T) :- terminated(T), moveL(oplayer, M, T).

% game must terminate
:- 0 {terminated(T) : time_domain(T)} 0.
% x player must reach goal 100 or the universal player cheat
:- terminated(T), not terminated(T-1), not goal(xplayer, 100 ,T), not cheat(T-1).
% existential player is not going to cheat
:- terminated(1), not goal(xplayer, 100 ,1).
