% does
{does(P, M, T)} :- legal(P, M, T), not terminated(T).

% time domain
timedomain(1).
timedomain(T+1) :- movetimedomain(T).
terminated(T) :- terminal(T).
terminated(T) :- terminated(T-1), timedomain(T).

% 1 move per turn per player
:- not terminated(T), movetimedomain(T), 0 {does(P, M, T)} 0, role(P).
:- not terminated(T), movetimedomain(T), 2 {does(P, M, T)}, role(P).
