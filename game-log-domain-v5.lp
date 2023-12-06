log_domain(1..5).

does(xplayer, move(1,1,1,2), T) :- not moveL(xplayer,1,T), not moveL(xplayer,2,T), not moveL(xplayer,3,T), not moveL(xplayer,4,T), not moveL(xplayer,5,T), legal(xplayer, move(1,1,1,2), T), movetimedomain(T), not terminated(T).
does(xplayer, move(1,1,2,2), T) :- moveL(xplayer,1,T), not moveL(xplayer,2,T), not moveL(xplayer,3,T), not moveL(xplayer,4,T), not moveL(xplayer,5,T), legal(xplayer, move(1,1,2,2), T), movetimedomain(T), not terminated(T).
does(xplayer, move(1,2,1,3), T) :- not moveL(xplayer,1,T), moveL(xplayer,2,T), not moveL(xplayer,3,T), not moveL(xplayer,4,T), not moveL(xplayer,5,T), legal(xplayer, move(1,2,1,3), T), movetimedomain(T), not terminated(T).
does(xplayer, move(1,2,2,3), T) :- moveL(xplayer,1,T), moveL(xplayer,2,T), not moveL(xplayer,3,T), not moveL(xplayer,4,T), not moveL(xplayer,5,T), legal(xplayer, move(1,2,2,3), T), movetimedomain(T), not terminated(T).
does(xplayer, move(1,3,1,4), T) :- not moveL(xplayer,1,T), not moveL(xplayer,2,T), moveL(xplayer,3,T), not moveL(xplayer,4,T), not moveL(xplayer,5,T), legal(xplayer, move(1,3,1,4), T), movetimedomain(T), not terminated(T).
does(xplayer, move(1,3,2,4), T) :- moveL(xplayer,1,T), not moveL(xplayer,2,T), moveL(xplayer,3,T), not moveL(xplayer,4,T), not moveL(xplayer,5,T), legal(xplayer, move(1,3,2,4), T), movetimedomain(T), not terminated(T).
does(xplayer, move(1,4,1,5), T) :- not moveL(xplayer,1,T), moveL(xplayer,2,T), moveL(xplayer,3,T), not moveL(xplayer,4,T), not moveL(xplayer,5,T), legal(xplayer, move(1,4,1,5), T), movetimedomain(T), not terminated(T).
does(xplayer, move(1,4,2,5), T) :- moveL(xplayer,1,T), moveL(xplayer,2,T), moveL(xplayer,3,T), not moveL(xplayer,4,T), not moveL(xplayer,5,T), legal(xplayer, move(1,4,2,5), T), movetimedomain(T), not terminated(T).
does(xplayer, move(2,1,1,2), T) :- not moveL(xplayer,1,T), not moveL(xplayer,2,T), not moveL(xplayer,3,T), moveL(xplayer,4,T), not moveL(xplayer,5,T), legal(xplayer, move(2,1,1,2), T), movetimedomain(T), not terminated(T).
does(xplayer, move(2,1,2,2), T) :- moveL(xplayer,1,T), not moveL(xplayer,2,T), not moveL(xplayer,3,T), moveL(xplayer,4,T), not moveL(xplayer,5,T), legal(xplayer, move(2,1,2,2), T), movetimedomain(T), not terminated(T).
does(xplayer, move(2,1,3,2), T) :- not moveL(xplayer,1,T), moveL(xplayer,2,T), not moveL(xplayer,3,T), moveL(xplayer,4,T), not moveL(xplayer,5,T), legal(xplayer, move(2,1,3,2), T), movetimedomain(T), not terminated(T).
does(xplayer, move(2,2,1,3), T) :- moveL(xplayer,1,T), moveL(xplayer,2,T), not moveL(xplayer,3,T), moveL(xplayer,4,T), not moveL(xplayer,5,T), legal(xplayer, move(2,2,1,3), T), movetimedomain(T), not terminated(T).
does(xplayer, move(2,2,2,3), T) :- not moveL(xplayer,1,T), not moveL(xplayer,2,T), moveL(xplayer,3,T), moveL(xplayer,4,T), not moveL(xplayer,5,T), legal(xplayer, move(2,2,2,3), T), movetimedomain(T), not terminated(T).
does(xplayer, move(2,2,3,3), T) :- moveL(xplayer,1,T), not moveL(xplayer,2,T), moveL(xplayer,3,T), moveL(xplayer,4,T), not moveL(xplayer,5,T), legal(xplayer, move(2,2,3,3), T), movetimedomain(T), not terminated(T).
does(xplayer, move(2,3,1,4), T) :- not moveL(xplayer,1,T), moveL(xplayer,2,T), moveL(xplayer,3,T), moveL(xplayer,4,T), not moveL(xplayer,5,T), legal(xplayer, move(2,3,1,4), T), movetimedomain(T), not terminated(T).
does(xplayer, move(2,3,2,4), T) :- moveL(xplayer,1,T), moveL(xplayer,2,T), moveL(xplayer,3,T), moveL(xplayer,4,T), not moveL(xplayer,5,T), legal(xplayer, move(2,3,2,4), T), movetimedomain(T), not terminated(T).
does(xplayer, move(2,3,3,4), T) :- not moveL(xplayer,1,T), not moveL(xplayer,2,T), not moveL(xplayer,3,T), not moveL(xplayer,4,T), moveL(xplayer,5,T), legal(xplayer, move(2,3,3,4), T), movetimedomain(T), not terminated(T).
does(xplayer, move(2,4,1,5), T) :- moveL(xplayer,1,T), not moveL(xplayer,2,T), not moveL(xplayer,3,T), not moveL(xplayer,4,T), moveL(xplayer,5,T), legal(xplayer, move(2,4,1,5), T), movetimedomain(T), not terminated(T).
does(xplayer, move(2,4,2,5), T) :- not moveL(xplayer,1,T), moveL(xplayer,2,T), not moveL(xplayer,3,T), not moveL(xplayer,4,T), moveL(xplayer,5,T), legal(xplayer, move(2,4,2,5), T), movetimedomain(T), not terminated(T).
does(xplayer, move(2,4,3,5), T) :- moveL(xplayer,1,T), moveL(xplayer,2,T), not moveL(xplayer,3,T), not moveL(xplayer,4,T), moveL(xplayer,5,T), legal(xplayer, move(2,4,3,5), T), movetimedomain(T), not terminated(T).
does(xplayer, move(3,1,2,2), T) :- not moveL(xplayer,1,T), not moveL(xplayer,2,T), moveL(xplayer,3,T), not moveL(xplayer,4,T), moveL(xplayer,5,T), legal(xplayer, move(3,1,2,2), T), movetimedomain(T), not terminated(T).
does(xplayer, move(3,1,3,2), T) :- moveL(xplayer,1,T), not moveL(xplayer,2,T), moveL(xplayer,3,T), not moveL(xplayer,4,T), moveL(xplayer,5,T), legal(xplayer, move(3,1,3,2), T), movetimedomain(T), not terminated(T).
does(xplayer, move(3,2,2,3), T) :- not moveL(xplayer,1,T), moveL(xplayer,2,T), moveL(xplayer,3,T), not moveL(xplayer,4,T), moveL(xplayer,5,T), legal(xplayer, move(3,2,2,3), T), movetimedomain(T), not terminated(T).
does(xplayer, move(3,2,3,3), T) :- moveL(xplayer,1,T), moveL(xplayer,2,T), moveL(xplayer,3,T), not moveL(xplayer,4,T), moveL(xplayer,5,T), legal(xplayer, move(3,2,3,3), T), movetimedomain(T), not terminated(T).
does(xplayer, move(3,3,2,4), T) :- not moveL(xplayer,1,T), not moveL(xplayer,2,T), not moveL(xplayer,3,T), moveL(xplayer,4,T), moveL(xplayer,5,T), legal(xplayer, move(3,3,2,4), T), movetimedomain(T), not terminated(T).
does(xplayer, move(3,3,3,4), T) :- moveL(xplayer,1,T), not moveL(xplayer,2,T), not moveL(xplayer,3,T), moveL(xplayer,4,T), moveL(xplayer,5,T), legal(xplayer, move(3,3,3,4), T), movetimedomain(T), not terminated(T).
does(xplayer, move(3,4,2,5), T) :- not moveL(xplayer,1,T), moveL(xplayer,2,T), not moveL(xplayer,3,T), moveL(xplayer,4,T), moveL(xplayer,5,T), legal(xplayer, move(3,4,2,5), T), movetimedomain(T), not terminated(T).
does(xplayer, move(3,4,3,5), T) :- moveL(xplayer,1,T), moveL(xplayer,2,T), not moveL(xplayer,3,T), moveL(xplayer,4,T), moveL(xplayer,5,T), legal(xplayer, move(3,4,3,5), T), movetimedomain(T), not terminated(T).
does(xplayer, noop, T) :- not moveL(xplayer,1,T), not moveL(xplayer,2,T), moveL(xplayer,3,T), moveL(xplayer,4,T), moveL(xplayer,5,T), legal(xplayer, noop, T), movetimedomain(T), not terminated(T).

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

