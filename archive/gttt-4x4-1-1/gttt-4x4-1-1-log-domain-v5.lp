log_domain(1..5).

does(oplayer, mark(1,1), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(1,1), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(1,2), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(1,2), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(1,3), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(1,3), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(1,4), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(1,4), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(2,1), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(2,1), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(2,2), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(2,2), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(2,3), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(2,3), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(2,4), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(2,4), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(3,1), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(3,1), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(3,2), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(3,2), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(3,3), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(3,3), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(3,4), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(3,4), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(4,1), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(4,1), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(4,2), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(4,2), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(4,3), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(4,3), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(4,4), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(4,4), T), move_time_domain(T), not terminated(T).
does(oplayer, noop, T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, noop, T), move_time_domain(T), not terminated(T).

move_domain(oplayer,mark(1,1)).
move_domain(oplayer,mark(1,2)).
move_domain(oplayer,mark(1,3)).
move_domain(oplayer,mark(1,4)).
move_domain(oplayer,mark(2,1)).
move_domain(oplayer,mark(2,2)).
move_domain(oplayer,mark(2,3)).
move_domain(oplayer,mark(2,4)).
move_domain(oplayer,mark(3,1)).
move_domain(oplayer,mark(3,2)).
move_domain(oplayer,mark(3,3)).
move_domain(oplayer,mark(3,4)).
move_domain(oplayer,mark(4,1)).
move_domain(oplayer,mark(4,2)).
move_domain(oplayer,mark(4,3)).
move_domain(oplayer,mark(4,4)).
move_domain(oplayer,noop).
move_domain(xplayer,mark(1,1)).
move_domain(xplayer,mark(1,2)).
move_domain(xplayer,mark(1,3)).
move_domain(xplayer,mark(1,4)).
move_domain(xplayer,mark(2,1)).
move_domain(xplayer,mark(2,2)).
move_domain(xplayer,mark(2,3)).
move_domain(xplayer,mark(2,4)).
move_domain(xplayer,mark(3,1)).
move_domain(xplayer,mark(3,2)).
move_domain(xplayer,mark(3,3)).
move_domain(xplayer,mark(3,4)).
move_domain(xplayer,mark(4,1)).
move_domain(xplayer,mark(4,2)).
move_domain(xplayer,mark(4,3)).
move_domain(xplayer,mark(4,4)).
move_domain(xplayer,noop).

