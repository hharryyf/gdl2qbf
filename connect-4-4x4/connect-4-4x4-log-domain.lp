
log_domain(1..3).

does(oplayer, drop(1), T) :- moveL(oplayer, 1, T), not moveL(oplayer, 2, T), not moveL(oplayer, 3, T).
does(oplayer, drop(2), T) :- not moveL(oplayer, 1, T), moveL(oplayer, 2, T), not moveL(oplayer, 3, T).
does(oplayer, drop(3), T) :- moveL(oplayer, 1, T), moveL(oplayer, 2, T), not moveL(oplayer, 3, T).
does(oplayer, drop(4), T) :- not moveL(oplayer, 1, T), not moveL(oplayer, 2, T), moveL(oplayer, 3, T).

does(xplayer, drop(1), T) :- moveL(xplayer, 1, T), not moveL(xplayer, 2, T), not moveL(xplayer, 3, T).
does(xplayer, drop(2), T) :- not moveL(xplayer, 1, T), moveL(xplayer, 2, T), not moveL(xplayer, 3, T).
does(xplayer, drop(3), T) :- moveL(xplayer, 1, T), moveL(xplayer, 2, T), not moveL(xplayer, 3, T).
does(xplayer, drop(4), T) :- not moveL(xplayer, 1, T), not moveL(xplayer, 2, T), moveL(xplayer, 3, T).
% dummy actions
cheat(T)   :- moveL(oplayer, 1, T), not moveL(oplayer, 2, T), moveL(oplayer, 3, T).
:- moveL(xplayer, 1, T), not moveL(xplayer, 2, T), moveL(xplayer, 3, T).
cheat(T)   :- not moveL(oplayer, 1, T), moveL(oplayer, 2, T), moveL(oplayer, 3, T).
:- not moveL(xplayer, 1, T), moveL(xplayer, 2, T), moveL(xplayer, 3, T).
cheat(T)   :- moveL(oplayer, 1, T), moveL(oplayer, 2, T), moveL(oplayer, 3, T).
:- moveL(xplayer, 1, T), moveL(xplayer, 2, T), moveL(xplayer, 3, T).
