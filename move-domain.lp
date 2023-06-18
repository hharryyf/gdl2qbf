% does
{does(P, M, T)} :- legal(P, M, T), not terminated(T).

% time domain
time_domain(1).
time_domain(T+1) :- move_time_domain(T).
terminated(T) :- terminal(T).
terminated(T) :- terminated(T-1), time_domain(T).

% 1 move per turn per player
:- not terminated(T), move_time_domain(T), 0 {does(P, M, T)} 0, role(P).
:- not terminated(T), move_time_domain(T), 2 {does(P, M, T)}, role(P).

%uncomment this line to remove the "noop" actions from the move-domain
% move_time_domain(1..16).