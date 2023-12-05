log_domain(1..5).

does(oplayer, mark(2,3,green), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(2,3,green), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(2,2,green), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(2,2,green), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(1,2,green), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(1,2,green), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(1,1,yellow), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(1,1,yellow), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(2,1,red), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(2,1,red), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(3,1,green), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(3,1,green), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(3,3,green), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(3,3,green), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(1,3,green), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(1,3,green), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(1,2,red), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(1,2,red), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(1,3,yellow), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(1,3,yellow), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(3,2,yellow), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(3,2,yellow), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(1,2,yellow), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(1,2,yellow), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(2,3,yellow), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(2,3,yellow), T), move_time_domain(T), not terminated(T).
does(oplayer, noop, T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, noop, T), move_time_domain(T), not terminated(T).
does(oplayer, mark(3,1,red), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(3,1,red), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(2,1,green), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, mark(2,1,green), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(3,3,red), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, mark(3,3,red), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(2,1,yellow), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, mark(2,1,yellow), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(2,2,yellow), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, mark(2,2,yellow), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(3,3,yellow), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, mark(3,3,yellow), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(2,3,red), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, mark(2,3,red), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(3,2,green), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, mark(3,2,green), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(1,1,red), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, mark(1,1,red), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(3,1,yellow), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, mark(3,1,yellow), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(2,2,red), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, mark(2,2,red), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(3,2,red), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, mark(3,2,red), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(1,3,red), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, mark(1,3,red), T), move_time_domain(T), not terminated(T).
does(oplayer, mark(1,1,green), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, mark(1,1,green), T), move_time_domain(T), not terminated(T).

move_domain(oplayer,mark(1,3,yellow)).
move_domain(xplayer,mark(1,2,green)).
move_domain(xplayer,mark(2,2,red)).
move_domain(xplayer,mark(1,2,red)).
move_domain(xplayer,mark(2,1,yellow)).
move_domain(xplayer,mark(1,3,green)).
move_domain(xplayer,mark(3,2,red)).
move_domain(oplayer,mark(1,2,green)).
move_domain(xplayer,mark(1,1,yellow)).
move_domain(xplayer,mark(2,3,green)).
move_domain(xplayer,noop).
move_domain(oplayer,mark(3,2,yellow)).
move_domain(oplayer,mark(2,1,yellow)).
move_domain(oplayer,mark(1,1,green)).
move_domain(xplayer,mark(2,3,red)).
move_domain(xplayer,mark(3,2,green)).
move_domain(oplayer,mark(3,1,red)).
move_domain(oplayer,mark(1,1,red)).
move_domain(xplayer,mark(2,1,green)).
move_domain(xplayer,mark(3,3,green)).
move_domain(xplayer,mark(1,2,yellow)).
move_domain(xplayer,mark(3,1,yellow)).
move_domain(xplayer,mark(3,1,green)).
move_domain(xplayer,mark(2,3,yellow)).
move_domain(xplayer,mark(3,3,yellow)).
move_domain(oplayer,noop).
move_domain(oplayer,mark(2,3,yellow)).
move_domain(oplayer,mark(3,3,red)).
move_domain(oplayer,mark(3,1,yellow)).
move_domain(oplayer,mark(2,2,yellow)).
move_domain(oplayer,mark(2,1,red)).
move_domain(oplayer,mark(3,2,green)).
move_domain(xplayer,mark(3,3,red)).
move_domain(oplayer,mark(1,1,yellow)).
move_domain(xplayer,mark(2,2,yellow)).
move_domain(xplayer,mark(1,1,red)).
move_domain(oplayer,mark(3,1,green)).
move_domain(oplayer,mark(3,3,yellow)).
move_domain(xplayer,mark(3,1,red)).
move_domain(oplayer,mark(1,2,red)).
move_domain(oplayer,mark(2,2,green)).
move_domain(oplayer,mark(1,3,green)).
move_domain(xplayer,mark(2,2,green)).
move_domain(oplayer,mark(2,1,green)).
move_domain(oplayer,mark(1,3,red)).
move_domain(oplayer,mark(2,3,green)).
move_domain(oplayer,mark(3,2,red)).
move_domain(xplayer,mark(1,1,green)).
move_domain(xplayer,mark(2,1,red)).
move_domain(oplayer,mark(3,3,green)).
move_domain(oplayer,mark(2,2,red)).
move_domain(xplayer,mark(1,3,yellow)).
move_domain(oplayer,mark(1,2,yellow)).
move_domain(xplayer,mark(3,2,yellow)).
move_domain(xplayer,mark(1,3,red)).
move_domain(oplayer,mark(2,3,red)).

