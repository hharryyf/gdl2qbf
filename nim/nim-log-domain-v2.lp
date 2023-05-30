log_domain(1..4).

does(oplayer, reduce(a,2), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, reduce(a,2), T).
does(oplayer, reduce(b,1), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, reduce(b,1), T).
does(oplayer, reduce(c,2), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, reduce(c,2), T).
does(oplayer, reduce(c,0), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, reduce(c,0), T).
does(oplayer, reduce(a,3), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, reduce(a,3), T).
does(oplayer, reduce(c,1), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, reduce(c,1), T).
does(oplayer, reduce(c,3), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, reduce(c,3), T).
does(oplayer, reduce(b,0), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, reduce(b,0), T).
does(oplayer, reduce(a,1), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), legal(oplayer, reduce(a,1), T).
does(oplayer, reduce(b,3), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), legal(oplayer, reduce(b,3), T).
does(oplayer, reduce(b,4), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), legal(oplayer, reduce(b,4), T).
does(oplayer, reduce(a,4), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), legal(oplayer, reduce(a,4), T).
does(oplayer, reduce(c,4), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), legal(oplayer, reduce(c,4), T).
does(oplayer, reduce(b,2), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), legal(oplayer, reduce(b,2), T).
does(oplayer, reduce(a,0), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), legal(oplayer, reduce(a,0), T).

move_domain(reduce(a,0)).
move_domain(reduce(b,2)).
move_domain(reduce(a,1)).
move_domain(reduce(a,3)).
move_domain(reduce(b,3)).
move_domain(reduce(c,3)).
move_domain(reduce(c,4)).
move_domain(reduce(a,4)).
move_domain(reduce(c,0)).
move_domain(reduce(b,4)).
move_domain(reduce(c,2)).
move_domain(reduce(c,1)).
move_domain(reduce(b,0)).
move_domain(reduce(b,1)).
move_domain(reduce(a,2)).
