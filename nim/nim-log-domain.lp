log_domain(1..4).

does(P, reduce(b,4), T) :- moveL(P,1,T), not moveL(P,2,T), not moveL(P,3,T), not moveL(P,4,T).
does(P, reduce(a,3), T) :- not moveL(P,1,T), moveL(P,2,T), not moveL(P,3,T), not moveL(P,4,T).
does(P, reduce(c,0), T) :- moveL(P,1,T), moveL(P,2,T), not moveL(P,3,T), not moveL(P,4,T).
does(P, reduce(b,1), T) :- not moveL(P,1,T), not moveL(P,2,T), moveL(P,3,T), not moveL(P,4,T).
does(P, reduce(b,0), T) :- moveL(P,1,T), not moveL(P,2,T), moveL(P,3,T), not moveL(P,4,T).
does(P, reduce(a,1), T) :- not moveL(P,1,T), moveL(P,2,T), moveL(P,3,T), not moveL(P,4,T).
does(P, reduce(a,2), T) :- moveL(P,1,T), moveL(P,2,T), moveL(P,3,T), not moveL(P,4,T).
does(P, reduce(a,0), T) :- not moveL(P,1,T), not moveL(P,2,T), not moveL(P,3,T), moveL(P,4,T).
does(P, reduce(c,4), T) :- moveL(P,1,T), not moveL(P,2,T), not moveL(P,3,T), moveL(P,4,T).
does(P, reduce(a,4), T) :- not moveL(P,1,T), moveL(P,2,T), not moveL(P,3,T), moveL(P,4,T).
does(P, reduce(b,3), T) :- moveL(P,1,T), moveL(P,2,T), not moveL(P,3,T), moveL(P,4,T).
does(P, reduce(c,1), T) :- not moveL(P,1,T), not moveL(P,2,T), moveL(P,3,T), moveL(P,4,T).
does(P, reduce(c,2), T) :- moveL(P,1,T), not moveL(P,2,T), moveL(P,3,T), moveL(P,4,T).
does(P, reduce(b,2), T) :- not moveL(P,1,T), moveL(P,2,T), moveL(P,3,T), moveL(P,4,T).
does(P, reduce(c,3), T) :- moveL(P,1,T), moveL(P,2,T), moveL(P,3,T), moveL(P,4,T).

move_domain(reduce(a,2)).
move_domain(reduce(b,0)).
move_domain(reduce(a,1)).
move_domain(reduce(b,1)).
move_domain(reduce(c,3)).
move_domain(reduce(b,2)).
move_domain(reduce(c,2)).
move_domain(reduce(c,4)).
move_domain(reduce(a,3)).
move_domain(reduce(a,0)).
move_domain(reduce(b,3)).
move_domain(reduce(c,1)).
move_domain(reduce(c,0)).
move_domain(reduce(a,4)).
move_domain(reduce(b,4)).

move_domain(noop).