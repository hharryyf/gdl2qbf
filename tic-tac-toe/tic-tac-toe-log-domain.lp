
log_domain(1..4).

does(P, mark(1, 1), T) :- moveL(P, 1, T), not moveL(P, 2, T), not moveL(P, 3, T), not moveL(P, 4, T).
does(P, mark(1, 2), T) :- not moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T), not moveL(P, 4, T).
does(P, mark(1, 3), T) :- moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T), not moveL(P, 4, T).
does(P, mark(2, 1), T) :- not moveL(P, 1, T), not moveL(P, 2, T), moveL(P, 3, T), not moveL(P, 4, T).
does(P, mark(2, 2), T) :- moveL(P, 1, T), not moveL(P, 2, T), moveL(P, 3, T), not moveL(P, 4, T).
does(P, mark(2, 3), T)   :- not moveL(P, 1, T), moveL(P, 2, T), moveL(P, 3, T), not moveL(P, 4, T).
does(P, mark(3, 1), T)   :- moveL(P, 1, T), moveL(P, 2, T), moveL(P, 3, T), not moveL(P, 4, T).
does(P, mark(3, 2), T)   :- not moveL(P, 1, T), not moveL(P, 2, T), not moveL(P, 3, T), moveL(P, 4, T).
does(P, mark(3, 3), T)   :- moveL(P, 1, T), not moveL(P, 2, T), not moveL(P, 3, T), moveL(P, 4, T).
cheat(T)   :- not moveL(oplayer, 1, T), moveL(oplayer, 2, T), not moveL(oplayer, 3, T), moveL(oplayer, 4, T).
cheat(T) :- moveL(oplayer, 1, T), moveL(oplayer, 2, T), not moveL(oplayer, 3, T), moveL(oplayer, 4, T).
cheat(T)   :- not moveL(oplayer, 1, T), not moveL(oplayer, 2, T), moveL(oplayer, 3, T), moveL(oplayer, 4, T).
cheat(T) :- moveL(oplayer, 1, T), not moveL(oplayer, 2, T), moveL(oplayer, 3, T), moveL(oplayer, 4, T).
cheat(T)   :- not moveL(oplayer, 1, T), moveL(oplayer, 2, T), moveL(oplayer, 3, T), moveL(oplayer, 4, T).
cheat(T) :- moveL(oplayer, 1, T), moveL(oplayer, 2, T), moveL(oplayer, 3, T), moveL(oplayer, 4, T).
