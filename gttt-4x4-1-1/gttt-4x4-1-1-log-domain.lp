log_domain(1..5).

does(P, mark(1,4), T) :- moveL(P,1,T), not moveL(P,2,T), not moveL(P,3,T), not moveL(P,4,T), not moveL(P,5,T).
does(P, mark(4,2), T) :- not moveL(P,1,T), moveL(P,2,T), not moveL(P,3,T), not moveL(P,4,T), not moveL(P,5,T).
does(P, mark(3,4), T) :- moveL(P,1,T), moveL(P,2,T), not moveL(P,3,T), not moveL(P,4,T), not moveL(P,5,T).
does(P, mark(3,1), T) :- not moveL(P,1,T), not moveL(P,2,T), moveL(P,3,T), not moveL(P,4,T), not moveL(P,5,T).
does(P, mark(1,1), T) :- moveL(P,1,T), not moveL(P,2,T), moveL(P,3,T), not moveL(P,4,T), not moveL(P,5,T).
does(P, mark(2,1), T) :- not moveL(P,1,T), moveL(P,2,T), moveL(P,3,T), not moveL(P,4,T), not moveL(P,5,T).
does(P, mark(4,1), T) :- moveL(P,1,T), moveL(P,2,T), moveL(P,3,T), not moveL(P,4,T), not moveL(P,5,T).
does(P, mark(2,2), T) :- not moveL(P,1,T), not moveL(P,2,T), not moveL(P,3,T), moveL(P,4,T), not moveL(P,5,T).
does(P, mark(4,3), T) :- moveL(P,1,T), not moveL(P,2,T), not moveL(P,3,T), moveL(P,4,T), not moveL(P,5,T).
does(P, mark(4,4), T) :- not moveL(P,1,T), moveL(P,2,T), not moveL(P,3,T), moveL(P,4,T), not moveL(P,5,T).
does(P, mark(3,3), T) :- moveL(P,1,T), moveL(P,2,T), not moveL(P,3,T), moveL(P,4,T), not moveL(P,5,T).
does(P, mark(2,3), T) :- not moveL(P,1,T), not moveL(P,2,T), moveL(P,3,T), moveL(P,4,T), not moveL(P,5,T).
does(P, mark(1,3), T) :- moveL(P,1,T), not moveL(P,2,T), moveL(P,3,T), moveL(P,4,T), not moveL(P,5,T).
does(P, mark(1,2), T) :- not moveL(P,1,T), moveL(P,2,T), moveL(P,3,T), moveL(P,4,T), not moveL(P,5,T).
does(P, mark(3,2), T) :- moveL(P,1,T), moveL(P,2,T), moveL(P,3,T), moveL(P,4,T), not moveL(P,5,T).
does(P, mark(2,4), T) :- not moveL(P,1,T), not moveL(P,2,T), not moveL(P,3,T), not moveL(P,4,T), moveL(P,5,T).
cheat(T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T).
cheat(T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T).
cheat(T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T).
cheat(T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T).
cheat(T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T).
cheat(T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T).
cheat(T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T).
cheat(T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T).
cheat(T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T).
cheat(T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T).
cheat(T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T).
cheat(T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T).
cheat(T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T).
cheat(T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T).
cheat(T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T).

move_domain(mark(3,1)).
move_domain(mark(1,2)).
move_domain(mark(2,1)).
move_domain(mark(2,4)).
move_domain(mark(4,2)).
move_domain(mark(4,3)).
move_domain(mark(3,4)).
move_domain(mark(4,4)).
move_domain(mark(3,2)).
move_domain(mark(3,3)).
move_domain(mark(4,1)).
move_domain(mark(2,2)).
move_domain(mark(1,4)).
move_domain(mark(1,1)).
move_domain(mark(1,3)).
move_domain(mark(2,3)).

% move_domain(noop).