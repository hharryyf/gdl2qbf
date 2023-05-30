% define turns
_other_player(xplayer,oplayer). _other_player(oplayer,xplayer).

_player_turn(xplayer,1).
_player_turn(O,T+1) :- _player_turn(P,T), _other_player(P,O), move_time_domain(T+1).

does(P, M, T) :- _player_turn(O,T), _other_player(O,P), not terminated(T), move_time_domain(T), legal(P, M, T).

% does(P, noop, T) :- _player_turn(O,T), _other_player(O,P), not terminated(T), move_time_domain(T).

time_domain(1).
time_domain(T+1) :- move_time_domain(T).
% Quantifiers
_exists(T, does(xplayer, M, T)) :- _player_turn(xplayer,T), move_domain(M).
_forall(T, moveL(oplayer, M, T)) :- _player_turn(oplayer,T), log_domain(M).

{does(xplayer, M, T) : move_domain(M)} :- _player_turn(xplayer,T).
{moveL(oplayer, M, T) : log_domain(M)} :- _player_turn(oplayer,T).


% additional constraints for the GDL encoding.

terminated(T) :- terminal(T).
terminated(T) :- terminated(T-1), time_domain(T).


:- does(P,M,T), not legal(P,M,T).

% existential player must take a move at its turn
1 {does(P,M,T) : move_domain(M)} 1 :- not terminated(T), _player_turn(P, T).
:- terminated(T), does(xplayer,M,T).


% game must terminate
:- 0 {terminated(T) : time_domain(T)} 0.
% x player must reach goal 100 or the universal player cheat
:- terminated(T), not terminated(T-1), not goal(xplayer, 100 ,T).
% existential player is not going to cheat
:- terminated(1), not goal(xplayer, 100 ,1).
