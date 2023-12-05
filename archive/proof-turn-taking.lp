% does
{does(P, M, T)} :- legal(P, M, T), not terminated(T).

% time domain
time_domain(1).
time_domain(T+1) :- move_time_domain(T).
terminated(T) :- terminal(T).
terminated(T+1) :- terminated(T), time_domain(T+1).

% 1 move per turn per player
:- not terminated(T), move_time_domain(T), 0 {does(P, M, T)} 0, role(P).
:- not terminated(T), move_time_domain(T), 2 {does(P, M, T)}, role(P).

% uncomment this line to remove the "noop" actions from the move-domain
% :- 0 {does(P, mark(4, 11), T) : _player_turn(P, T)} 0.

take_turn(P, T) :- 2 {legal(P, M, T)}, not terminated(T), role(P),move_time_domain(T).

not_turn_taking :- take_turn(oplayer, T), take_turn(xplayer, T).

:- not not_turn_taking.

% step(1)

% #show take_turn/2.
% #show terminated/1.
% #show does/3.