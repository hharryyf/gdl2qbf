log_domain(1..5).
does(P, mark(1, 1, red), T) :- moveL(P, 1, T), not moveL(P, 2, T), not moveL(P, 3, T), not moveL(P, 4, T), not moveL(P, 5, T). 
does(P, mark(1, 2, red), T) :- not moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T), not moveL(P, 4, T), not moveL(P, 5, T). 
does(P, mark(1, 3, red), T) :- moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T), not moveL(P, 4, T), not moveL(P, 5, T).
does(P, mark(2, 1, red), T) :- not moveL(P, 1, T), not moveL(P, 2, T), moveL(P, 3, T), not moveL(P, 4, T), not moveL(P, 5, T). 
does(P, mark(2, 2, red), T) :- moveL(P, 1, T), not moveL(P, 2, T), moveL(P, 3, T), not moveL(P, 4, T), not moveL(P, 5, T). 
does(P, mark(2, 3, red), T) :- not moveL(P, 1, T), moveL(P, 2, T), moveL(P, 3, T), not moveL(P, 4, T), not moveL(P, 5, T). 
does(P, mark(3, 1, red), T) :- moveL(P, 1, T), moveL(P, 2, T), moveL(P, 3, T), not moveL(P, 4, T), not moveL(P, 5, T).
does(P, mark(3, 2, red), T) :- not moveL(P, 1, T), not moveL(P, 2, T), not moveL(P, 3, T), moveL(P, 4, T), not moveL(P, 5, T). 
does(P, mark(3, 3, red), T) :- moveL(P, 1, T), not moveL(P, 2, T), not moveL(P, 3, T), moveL(P, 4, T), not moveL(P, 5, T). 
does(P, mark(1, 1, yellow), T) :- not moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T), moveL(P, 4, T), not moveL(P, 5, T). 
does(P, mark(1, 2, yellow), T) :- moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T), moveL(P, 4, T), not moveL(P, 5, T). 
does(P, mark(1, 3, yellow), T) :- not moveL(P, 1, T), not moveL(P, 2, T), moveL(P, 3, T), moveL(P, 4, T), not moveL(P, 5, T). 
does(P, mark(2, 1, yellow), T) :- moveL(P, 1, T), not moveL(P, 2, T), moveL(P, 3, T), moveL(P, 4, T), not moveL(P, 5, T). 
does(P, mark(2, 2, yellow), T) :- not moveL(P, 1, T), moveL(P, 2, T), moveL(P, 3, T), moveL(P, 4, T), not moveL(P, 5, T).

does(P, mark(2, 3, yellow), T) :- moveL(P, 1, T), moveL(P, 2, T), moveL(P, 3, T), moveL(P, 4, T), not moveL(P, 5, T).
does(P, mark(3, 1, yellow), T) :- not moveL(P, 1, T), not moveL(P, 2, T), not moveL(P, 3, T), not moveL(P, 4, T), moveL(P, 5, T).
does(P, mark(3, 2, yellow), T) :- moveL(P, 1, T), not moveL(P, 2, T), not moveL(P, 3, T), not moveL(P, 4, T), moveL(P, 5, T).   
does(P, mark(3, 3, yellow), T) :- not moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T), not moveL(P, 4, T), moveL(P, 5, T). 
does(P, mark(1, 1, green), T) :- moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T), not moveL(P, 4, T), moveL(P, 5, T).
does(P, mark(1, 2, green), T) :- not moveL(P, 1, T), not moveL(P, 2, T), moveL(P, 3, T), not moveL(P, 4, T), moveL(P, 5, T).
does(P, mark(1, 3, green), T) :- moveL(P, 1, T), not moveL(P, 2, T), moveL(P, 3, T), not moveL(P, 4, T), moveL(P, 5, T).
does(P, mark(2, 1, green), T) :- not moveL(P, 1, T), moveL(P, 2, T), moveL(P, 3, T), not moveL(P, 4, T), moveL(P, 5, T).
does(P, mark(2, 2, green), T) :- moveL(P, 1, T), moveL(P, 2, T), moveL(P, 3, T), not moveL(P, 4, T), moveL(P, 5, T).
does(P, mark(2, 3, green), T) :- not moveL(P, 1, T), not moveL(P, 2, T), not moveL(P, 3, T), moveL(P, 4, T), moveL(P, 5, T).
does(P, mark(3, 1, green), T) :- moveL(P, 1, T), not moveL(P, 2, T), not moveL(P, 3, T), moveL(P, 4, T), moveL(P, 5, T).
does(P, mark(3, 2, green), T) :- not moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T), moveL(P, 4, T), moveL(P, 5, T).
does(P, mark(3, 3, green), T) :- moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T), moveL(P, 4, T), moveL(P, 5, T).
cheat(T) :- not moveL(oplayer, 1, T), not moveL(oplayer, 2, T), moveL(oplayer, 3, T), moveL(oplayer, 4, T), moveL(oplayer, 5, T).
cheat(T) :- moveL(oplayer, 1, T), not moveL(oplayer, 2, T), moveL(oplayer, 3, T), moveL(oplayer, 4, T), moveL(oplayer, 5, T). 
cheat(T) :- not moveL(oplayer, 1, T), moveL(oplayer, 2, T), moveL(oplayer, 3, T), moveL(oplayer, 4, T), moveL(oplayer, 5, T). 
cheat(T) :- moveL(oplayer, 1, T), moveL(oplayer, 2, T), moveL(oplayer, 3, T), moveL(oplayer, 4, T), moveL(oplayer, 5, T).