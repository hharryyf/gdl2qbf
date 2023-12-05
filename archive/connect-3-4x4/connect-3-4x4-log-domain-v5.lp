log_domain(1..3).

does(oplayer, drop(1), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), legal(oplayer, drop(1), T), move_time_domain(T), not terminated(T).
does(oplayer, drop(2), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), legal(oplayer, drop(2), T), move_time_domain(T), not terminated(T).
does(oplayer, drop(3), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), legal(oplayer, drop(3), T), move_time_domain(T), not terminated(T).
does(oplayer, drop(4), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), legal(oplayer, drop(4), T), move_time_domain(T), not terminated(T).
does(oplayer, noop, T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), legal(oplayer, noop, T), move_time_domain(T), not terminated(T).

move_domain(oplayer,drop(1)).
move_domain(oplayer,drop(2)).
move_domain(oplayer,drop(3)).
move_domain(oplayer,drop(4)).
move_domain(oplayer,noop).
move_domain(xplayer,drop(1)).
move_domain(xplayer,drop(2)).
move_domain(xplayer,drop(3)).
move_domain(xplayer,drop(4)).
move_domain(xplayer,noop).

