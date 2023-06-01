% define turns
% _other_player(xplayer,oplayer). _other_player(oplayer,xplayer).

% turn description is in the actual file
% _player_turn(xplayer,1).
% _player_turn(O,T+1) :- _player_turn(P,T), _other_player(P,O), move_time_domain(T+1).

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

% cheat would terminate the game
terminated(T+1) :- cheat(T).
cheat(T) :- cheat(T-1), move_time_domain(T).

% deal with legal move
:- does(xplayer,M,T), not legal(xplayer,M,T).
cheat(T) :- does(oplayer,M,T), not legal(oplayer,M,T), move_domain(M).

% existential player must take a move at its turn
1 {does(xplayer,M,T) : move_domain(M)} 1 :- not terminated(T), _player_turn(xplayer, T).
% existential player cannot take a move when terminated
:- terminated(T), does(xplayer,M,T).
cheat(T) :- not terminated(T), _player_turn(oplayer, T), 0 {does(oplayer, M, T)} 0.
% cheat(T) :- terminated(T), moveL(oplayer, M, T).

% game must terminate
:- 0 {terminated(T) : time_domain(T)} 0.
% x player must reach goal 100 or the universal player cheat
:- terminated(T), not terminated(T-1), not goal(xplayer, 100 ,T), not cheat(T-1).
% existential player is not going to cheat
:- terminated(1), not goal(xplayer, 100 ,1).
