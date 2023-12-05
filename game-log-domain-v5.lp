log_domain(1..5).

does(oplayer, move(1,2,1,1), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, move(1,2,1,1), T), movetimedomain(T), not terminated(T).
does(oplayer, move(1,2,2,1), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, move(1,2,2,1), T), movetimedomain(T), not terminated(T).
does(oplayer, move(1,3,1,2), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, move(1,3,1,2), T), movetimedomain(T), not terminated(T).
does(oplayer, move(1,3,2,2), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, move(1,3,2,2), T), movetimedomain(T), not terminated(T).
does(oplayer, move(1,4,1,3), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, move(1,4,1,3), T), movetimedomain(T), not terminated(T).
does(oplayer, move(1,4,2,3), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, move(1,4,2,3), T), movetimedomain(T), not terminated(T).
does(oplayer, move(1,5,1,4), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, move(1,5,1,4), T), movetimedomain(T), not terminated(T).
does(oplayer, move(1,5,2,4), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, move(1,5,2,4), T), movetimedomain(T), not terminated(T).
does(oplayer, move(2,2,1,1), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, move(2,2,1,1), T), movetimedomain(T), not terminated(T).
does(oplayer, move(2,2,2,1), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, move(2,2,2,1), T), movetimedomain(T), not terminated(T).
does(oplayer, move(2,2,3,1), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, move(2,2,3,1), T), movetimedomain(T), not terminated(T).
does(oplayer, move(2,3,1,2), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, move(2,3,1,2), T), movetimedomain(T), not terminated(T).
does(oplayer, move(2,3,2,2), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, move(2,3,2,2), T), movetimedomain(T), not terminated(T).
does(oplayer, move(2,3,3,2), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, move(2,3,3,2), T), movetimedomain(T), not terminated(T).
does(oplayer, move(2,4,1,3), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, move(2,4,1,3), T), movetimedomain(T), not terminated(T).
does(oplayer, move(2,4,2,3), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, move(2,4,2,3), T), movetimedomain(T), not terminated(T).
does(oplayer, move(2,4,3,3), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, move(2,4,3,3), T), movetimedomain(T), not terminated(T).
does(oplayer, move(2,5,1,4), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, move(2,5,1,4), T), movetimedomain(T), not terminated(T).
does(oplayer, move(2,5,2,4), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, move(2,5,2,4), T), movetimedomain(T), not terminated(T).
does(oplayer, move(2,5,3,4), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, move(2,5,3,4), T), movetimedomain(T), not terminated(T).
does(oplayer, move(3,2,2,1), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, move(3,2,2,1), T), movetimedomain(T), not terminated(T).
does(oplayer, move(3,2,3,1), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, move(3,2,3,1), T), movetimedomain(T), not terminated(T).
does(oplayer, move(3,3,2,2), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, move(3,3,2,2), T), movetimedomain(T), not terminated(T).
does(oplayer, move(3,3,3,2), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, move(3,3,3,2), T), movetimedomain(T), not terminated(T).
does(oplayer, move(3,4,2,3), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, move(3,4,2,3), T), movetimedomain(T), not terminated(T).
does(oplayer, move(3,4,3,3), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, move(3,4,3,3), T), movetimedomain(T), not terminated(T).
does(oplayer, move(3,5,2,4), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, move(3,5,2,4), T), movetimedomain(T), not terminated(T).
does(oplayer, move(3,5,3,4), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, move(3,5,3,4), T), movetimedomain(T), not terminated(T).
does(oplayer, noop, T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, noop, T), movetimedomain(T), not terminated(T).

move_domain(oplayer,move(1,2,1,1)).
move_domain(oplayer,move(1,2,2,1)).
move_domain(oplayer,move(1,3,1,2)).
move_domain(oplayer,move(1,3,2,2)).
move_domain(oplayer,move(1,4,1,3)).
move_domain(oplayer,move(1,4,2,3)).
move_domain(oplayer,move(1,5,1,4)).
move_domain(oplayer,move(1,5,2,4)).
move_domain(oplayer,move(2,2,1,1)).
move_domain(oplayer,move(2,2,2,1)).
move_domain(oplayer,move(2,2,3,1)).
move_domain(oplayer,move(2,3,1,2)).
move_domain(oplayer,move(2,3,2,2)).
move_domain(oplayer,move(2,3,3,2)).
move_domain(oplayer,move(2,4,1,3)).
move_domain(oplayer,move(2,4,2,3)).
move_domain(oplayer,move(2,4,3,3)).
move_domain(oplayer,move(2,5,1,4)).
move_domain(oplayer,move(2,5,2,4)).
move_domain(oplayer,move(2,5,3,4)).
move_domain(oplayer,move(3,2,2,1)).
move_domain(oplayer,move(3,2,3,1)).
move_domain(oplayer,move(3,3,2,2)).
move_domain(oplayer,move(3,3,3,2)).
move_domain(oplayer,move(3,4,2,3)).
move_domain(oplayer,move(3,4,3,3)).
move_domain(oplayer,move(3,5,2,4)).
move_domain(oplayer,move(3,5,3,4)).
move_domain(oplayer,noop).
move_domain(xplayer,move(1,1,1,2)).
move_domain(xplayer,move(1,1,2,2)).
move_domain(xplayer,move(1,2,1,3)).
move_domain(xplayer,move(1,2,2,3)).
move_domain(xplayer,move(1,3,1,4)).
move_domain(xplayer,move(1,3,2,4)).
move_domain(xplayer,move(1,4,1,5)).
move_domain(xplayer,move(1,4,2,5)).
move_domain(xplayer,move(2,1,1,2)).
move_domain(xplayer,move(2,1,2,2)).
move_domain(xplayer,move(2,1,3,2)).
move_domain(xplayer,move(2,2,1,3)).
move_domain(xplayer,move(2,2,2,3)).
move_domain(xplayer,move(2,2,3,3)).
move_domain(xplayer,move(2,3,1,4)).
move_domain(xplayer,move(2,3,2,4)).
move_domain(xplayer,move(2,3,3,4)).
move_domain(xplayer,move(2,4,1,5)).
move_domain(xplayer,move(2,4,2,5)).
move_domain(xplayer,move(2,4,3,5)).
move_domain(xplayer,move(3,1,2,2)).
move_domain(xplayer,move(3,1,3,2)).
move_domain(xplayer,move(3,2,2,3)).
move_domain(xplayer,move(3,2,3,3)).
move_domain(xplayer,move(3,3,2,4)).
move_domain(xplayer,move(3,3,3,4)).
move_domain(xplayer,move(3,4,2,5)).
move_domain(xplayer,move(3,4,3,5)).
move_domain(xplayer,noop).

