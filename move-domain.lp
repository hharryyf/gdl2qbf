_other_player(xplayer,oplayer). _other_player(oplayer,xplayer).
_player_turn(xplayer,1).
_player_turn(O,T+1) :- _player_turn(P,T), _other_player(P,O), move_time_domain(T+1).

% does
{does(xplayer, M, T)} :- legal(xplayer, M, T), not terminated(T).
{does(oplayer, M, T)} :- legal(oplayer, M, T), not terminated(T).

% time domain
time_domain(1).
time_domain(T+1) :- move_time_domain(T).
terminated(T) :- terminal(T).
terminated(T) :- terminated(T-1), time_domain(T).

% 1 move per turn
:- not terminated(T), move_time_domain(T), 0 {does(xplayer, M, T)} 0.
:- not terminated(T), move_time_domain(T), 2 {does(xplayer, M, T)}.
:- not terminated(T), move_time_domain(T), 0 {does(oplayer, M, T)} 0.
:- not terminated(T), move_time_domain(T), 2 {does(oplayer, M, T)}.
% :- 0 {does(P, noop, T)} 0, move_time_domain(T), _player_turn(P, T). 
