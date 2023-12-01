log_domain(1..4).

does(oplayer, draw(1,1,1,2), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, draw(1,1,1,2), T), move_time_domain(T), not terminated(T).
does(oplayer, draw(1,1,2,1), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, draw(1,1,2,1), T), move_time_domain(T), not terminated(T).
does(oplayer, draw(1,2,1,3), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, draw(1,2,1,3), T), move_time_domain(T), not terminated(T).
does(oplayer, draw(1,2,2,2), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, draw(1,2,2,2), T), move_time_domain(T), not terminated(T).
does(oplayer, draw(1,3,2,3), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, draw(1,3,2,3), T), move_time_domain(T), not terminated(T).
does(oplayer, draw(2,1,2,2), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, draw(2,1,2,2), T), move_time_domain(T), not terminated(T).
does(oplayer, draw(2,1,3,1), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, draw(2,1,3,1), T), move_time_domain(T), not terminated(T).
does(oplayer, draw(2,2,2,3), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, draw(2,2,2,3), T), move_time_domain(T), not terminated(T).
does(oplayer, draw(2,2,3,2), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), legal(oplayer, draw(2,2,3,2), T), move_time_domain(T), not terminated(T).
does(oplayer, draw(2,3,3,3), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), legal(oplayer, draw(2,3,3,3), T), move_time_domain(T), not terminated(T).
does(oplayer, draw(3,1,3,2), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), legal(oplayer, draw(3,1,3,2), T), move_time_domain(T), not terminated(T).
does(oplayer, draw(3,2,3,3), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), legal(oplayer, draw(3,2,3,3), T), move_time_domain(T), not terminated(T).
does(oplayer, noop, T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), legal(oplayer, noop, T), move_time_domain(T), not terminated(T).

move_domain(oplayer,draw(1,1,1,2)).
move_domain(oplayer,draw(1,1,2,1)).
move_domain(oplayer,draw(1,2,1,3)).
move_domain(oplayer,draw(1,2,2,2)).
move_domain(oplayer,draw(1,3,2,3)).
move_domain(oplayer,draw(2,1,2,2)).
move_domain(oplayer,draw(2,1,3,1)).
move_domain(oplayer,draw(2,2,2,3)).
move_domain(oplayer,draw(2,2,3,2)).
move_domain(oplayer,draw(2,3,3,3)).
move_domain(oplayer,draw(3,1,3,2)).
move_domain(oplayer,draw(3,2,3,3)).
move_domain(oplayer,noop).
move_domain(xplayer,draw(1,1,1,2)).
move_domain(xplayer,draw(1,1,2,1)).
move_domain(xplayer,draw(1,2,1,3)).
move_domain(xplayer,draw(1,2,2,2)).
move_domain(xplayer,draw(1,3,2,3)).
move_domain(xplayer,draw(2,1,2,2)).
move_domain(xplayer,draw(2,1,3,1)).
move_domain(xplayer,draw(2,2,2,3)).
move_domain(xplayer,draw(2,2,3,2)).
move_domain(xplayer,draw(2,3,3,3)).
move_domain(xplayer,draw(3,1,3,2)).
move_domain(xplayer,draw(3,2,3,3)).
move_domain(xplayer,noop).

