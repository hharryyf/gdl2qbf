log_domain(1..5).
does(P, moves(1, 1, 1, 2), T) :- moveL(P, 1, T), not moveL(P, 2, T), not moveL(P, 3, T), not moveL(P, 4, T), not moveL(P, 5, T). 
does(P, moves(1, 1, 2, 2), T) :- not moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T), not moveL(P, 4, T), not moveL(P, 5, T). 
does(P, moves(2, 1, 2, 2), T) :- moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T), not moveL(P, 4, T), not moveL(P, 5, T).
does(P, moves(2, 1, 1, 2), T) :- not moveL(P, 1, T), not moveL(P, 2, T), moveL(P, 3, T), not moveL(P, 4, T), not moveL(P, 5, T). 
does(P, moves(2, 1, 3, 2), T) :- moveL(P, 1, T), not moveL(P, 2, T), moveL(P, 3, T), not moveL(P, 4, T), not moveL(P, 5, T). 
does(P, moves(3, 1, 3, 2), T) :- not moveL(P, 1, T), moveL(P, 2, T), moveL(P, 3, T), not moveL(P, 4, T), not moveL(P, 5, T). 
does(P, moves(3, 1, 2, 2), T) :- moveL(P, 1, T), moveL(P, 2, T), moveL(P, 3, T), not moveL(P, 4, T), not moveL(P, 5, T).
does(P, moves(1, 2, 1, 3), T) :- not moveL(P, 1, T), not moveL(P, 2, T), not moveL(P, 3, T), moveL(P, 4, T), not moveL(P, 5, T). 
does(P, moves(1, 2, 2, 3), T) :- moveL(P, 1, T), not moveL(P, 2, T), not moveL(P, 3, T), moveL(P, 4, T), not moveL(P, 5, T). 
does(P, moves(2, 2, 2, 3), T) :- not moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T), moveL(P, 4, T), not moveL(P, 5, T). 
does(P, moves(2, 2, 1, 3), T) :- moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T), moveL(P, 4, T), not moveL(P, 5, T). 
does(P, moves(2, 2, 3, 3), T) :- not moveL(P, 1, T), not moveL(P, 2, T), moveL(P, 3, T), moveL(P, 4, T), not moveL(P, 5, T). 
does(P, moves(3, 2, 3, 3), T) :- moveL(P, 1, T), not moveL(P, 2, T), moveL(P, 3, T), moveL(P, 4, T), not moveL(P, 5, T). 
does(P, moves(3, 2, 2, 3), T) :- not moveL(P, 1, T), moveL(P, 2, T), moveL(P, 3, T), moveL(P, 4, T), not moveL(P, 5, T).

does(P, moves(1, 2, 1, 1), T) :- moveL(P, 1, T), moveL(P, 2, T), moveL(P, 3, T), moveL(P, 4, T), not moveL(P, 5, T).
does(P, moves(2, 2, 1, 1), T) :- not moveL(P, 1, T), not moveL(P, 2, T), not moveL(P, 3, T), not moveL(P, 4, T), moveL(P, 5, T).
does(P, moves(2, 2, 2, 1), T) :- moveL(P, 1, T), not moveL(P, 2, T), not moveL(P, 3, T), not moveL(P, 4, T), moveL(P, 5, T).   
does(P, moves(1, 2, 2, 1), T) :- not moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T), not moveL(P, 4, T), moveL(P, 5, T). 
does(P, moves(3, 2, 2, 1), T) :- moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T), not moveL(P, 4, T), moveL(P, 5, T).
does(P, moves(3, 2, 3, 1), T) :- not moveL(P, 1, T), not moveL(P, 2, T), moveL(P, 3, T), not moveL(P, 4, T), moveL(P, 5, T).
does(P, moves(2, 2, 3, 1), T) :- moveL(P, 1, T), not moveL(P, 2, T), moveL(P, 3, T), not moveL(P, 4, T), moveL(P, 5, T).
does(P, moves(1, 3, 1, 2), T) :- not moveL(P, 1, T), moveL(P, 2, T), moveL(P, 3, T), not moveL(P, 4, T), moveL(P, 5, T).
does(P, moves(2, 3, 1, 2), T) :- moveL(P, 1, T), moveL(P, 2, T), moveL(P, 3, T), not moveL(P, 4, T), moveL(P, 5, T).
does(P, moves(2, 3, 2, 2), T) :- not moveL(P, 1, T), not moveL(P, 2, T), not moveL(P, 3, T), moveL(P, 4, T), moveL(P, 5, T).
does(P, moves(1, 3, 2, 2), T) :- moveL(P, 1, T), not moveL(P, 2, T), not moveL(P, 3, T), moveL(P, 4, T), moveL(P, 5, T).
does(P, moves(3, 3, 2, 2), T) :- not moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T), moveL(P, 4, T), moveL(P, 5, T).
does(P, moves(3, 3, 3, 2), T) :- moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T), moveL(P, 4, T), moveL(P, 5, T).
does(P, moves(2, 3, 3, 2), T) :- not moveL(P, 1, T), not moveL(P, 2, T), moveL(P, 3, T), moveL(P, 4, T), moveL(P, 5, T).
cheat(T) :- moveL(oplayer, 1, T), not moveL(oplayer, 2, T), moveL(oplayer, 3, T), moveL(oplayer, 4, T), moveL(oplayer, 5, T). 
cheat(T) :- not moveL(oplayer, 1, T), moveL(oplayer, 2, T), moveL(oplayer, 3, T), moveL(oplayer, 4, T), moveL(oplayer, 5, T). 
cheat(T) :- moveL(oplayer, 1, T), moveL(oplayer, 2, T), moveL(oplayer, 3, T), moveL(oplayer, 4, T), moveL(oplayer, 5, T).
