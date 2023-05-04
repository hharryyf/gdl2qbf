{does(P, M, T)} :- legal(P, M, T).

time_domain(1).
time_domain(T+1) :- move_time_domain(T).
terminated(T) :- terminal(T).
terminated(T) :- terminated(T-1), time_domain(T).