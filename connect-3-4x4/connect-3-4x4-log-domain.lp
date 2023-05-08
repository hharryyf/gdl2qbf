
log_domain(1..3).

does(P, drop(1), T) :- moveL(P, 1, T), not moveL(P, 2, T), not moveL(P, 3, T).
does(P, drop(2), T) :- not moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T).
does(P, drop(3), T) :- moveL(P, 1, T), moveL(P, 2, T), not moveL(P, 3, T).
does(P, drop(4), T) :- not moveL(P, 1, T), not moveL(P, 2, T), moveL(P, 3, T).
% dummy actions
cheat(T)   :- moveL(oplayer, 1, T), not moveL(oplayer, 2, T), moveL(oplayer, 3, T).
:- moveL(xplayer, 1, T), not moveL(xplayer, 2, T), moveL(xplayer, 3, T).
cheat(T)   :- not moveL(oplayer, 1, T), moveL(oplayer, 2, T), moveL(oplayer, 3, T).
:- not moveL(xplayer, 1, T), moveL(xplayer, 2, T), moveL(xplayer, 3, T).
cheat(T)   :- moveL(oplayer, 1, T), moveL(oplayer, 2, T), moveL(oplayer, 3, T).
:- moveL(xplayer, 1, T), moveL(xplayer, 2, T), moveL(xplayer, 3, T).

move_domain(drop(1)).
move_domain(drop(2)).
move_domain(drop(3)).
move_domain(drop(4)).
move_domain(noop).