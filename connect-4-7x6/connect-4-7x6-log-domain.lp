
log_domain(1..3).

does(P, drop(1), T) :- moveL(P, 1, T), not moveL(P, 2, T), not moveL(P, 3, T).
does(P, drop(2), T) :- not moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T).
does(P, drop(3), T) :- moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T).
does(P, drop(4), T) :- not moveL(P, 1, T), not moveL(P, 2, T), moveL(P, 3, T).
does(P, drop(5), T) :- moveL(P, 1, T), not moveL(P, 2, T), moveL(P, 3, T).
does(P, drop(6), T)   :- not moveL(P, 1, T), moveL(P, 2, T), moveL(P, 3, T).
does(P, drop(7), T)   :- moveL(P, 1, T), moveL(P, 2, T), moveL(P, 3, T).

move_domain(drop(1..7)).
move_domain(noop).
