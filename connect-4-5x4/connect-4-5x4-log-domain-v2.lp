log_domain(1..3).

does(P, drop(3), T) :- moveL(P,1,T), not moveL(P,2,T), not moveL(P,3,T), legal(P, drop(3), T).
does(P, drop(5), T) :- not moveL(P,1,T), moveL(P,2,T), not moveL(P,3,T), legal(P, drop(5), T).
does(P, drop(1), T) :- moveL(P,1,T), moveL(P,2,T), not moveL(P,3,T), legal(P, drop(1), T).
does(P, drop(4), T) :- not moveL(P,1,T), not moveL(P,2,T), moveL(P,3,T), legal(P, drop(4), T).
does(P, drop(2), T) :- moveL(P,1,T), not moveL(P,2,T), moveL(P,3,T), legal(P, drop(2), T).

move_domain(drop(2)).
move_domain(drop(3)).
move_domain(drop(1)).
move_domain(drop(5)).
move_domain(drop(4)).
