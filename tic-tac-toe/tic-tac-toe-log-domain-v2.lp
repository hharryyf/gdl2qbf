log_domain(1..4).

does(oplayer, mark(3,1), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, mark(3,1), T), _player_turn(oplayer, T).
does(oplayer, mark(2,2), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, mark(2,2), T).
does(oplayer, mark(3,3), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, mark(3,3), T).
does(oplayer, mark(3,2), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, mark(3,2), T).
does(oplayer, mark(1,3), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, mark(1,3), T).
does(oplayer, mark(2,1), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, mark(2,1), T).
does(oplayer, mark(1,1), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, mark(1,1), T).
does(oplayer, mark(2,3), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), legal(oplayer, mark(2,3), T).
does(oplayer, mark(1,2), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), legal(oplayer, mark(1,2), T).

move_domain(mark(1,1)).
move_domain(mark(3,1)).
move_domain(mark(3,3)).
move_domain(mark(3,2)).
move_domain(mark(2,1)).
move_domain(mark(2,3)).
move_domain(mark(1,3)).
move_domain(mark(2,2)).
move_domain(mark(1,2)).
