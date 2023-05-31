log_domain(1..6).

does(oplayer, mark(3,1,green), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(3,1,green), T), _player_turn(oplayer, T).
does(oplayer, mark(3,2,red), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(3,2,red), T).
does(oplayer, mark(2,1,red), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(2,1,red), T).
does(oplayer, mark(2,4,red), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(2,4,red), T).
does(oplayer, mark(3,2,yellow), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(3,2,yellow), T).
does(oplayer, mark(3,2,green), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(3,2,green), T).
does(oplayer, mark(1,4,green), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(1,4,green), T).
does(oplayer, mark(2,3,green), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(2,3,green), T).
does(oplayer, mark(3,1,yellow), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(3,1,yellow), T).
does(oplayer, mark(2,2,green), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(2,2,green), T).
does(oplayer, mark(2,3,red), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(2,3,red), T).
does(oplayer, mark(1,2,green), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(1,2,green), T).
does(oplayer, mark(1,4,yellow), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(1,4,yellow), T).
does(oplayer, mark(2,1,yellow), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(2,1,yellow), T).
does(oplayer, mark(1,4,red), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(1,4,red), T).
does(oplayer, mark(1,1,red), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(1,1,red), T).
does(oplayer, mark(1,2,yellow), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(1,2,yellow), T).
does(oplayer, mark(3,1,red), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(3,1,red), T).
does(oplayer, mark(1,3,red), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(1,3,red), T).
does(oplayer, mark(1,2,red), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(1,2,red), T).
does(oplayer, mark(3,3,green), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(3,3,green), T).
does(oplayer, mark(1,3,yellow), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(1,3,yellow), T).
does(oplayer, mark(2,1,green), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(2,1,green), T).
does(oplayer, mark(2,2,yellow), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(2,2,yellow), T).
does(oplayer, mark(2,2,red), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(2,2,red), T).
does(oplayer, mark(3,4,red), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(3,4,red), T).
does(oplayer, mark(1,1,yellow), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(1,1,yellow), T).
does(oplayer, mark(2,4,green), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(2,4,green), T).
does(oplayer, mark(3,3,red), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(3,3,red), T).
does(oplayer, mark(2,3,yellow), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(2,3,yellow), T).
does(oplayer, mark(3,3,yellow), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(3,3,yellow), T).
does(oplayer, mark(1,1,green), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), not moveL(oplayer,6,T), legal(oplayer, mark(1,1,green), T).
does(oplayer, mark(3,4,yellow), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), moveL(oplayer,6,T), legal(oplayer, mark(3,4,yellow), T).
does(oplayer, mark(1,3,green), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), moveL(oplayer,6,T), legal(oplayer, mark(1,3,green), T).
does(oplayer, mark(2,4,yellow), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), moveL(oplayer,6,T), legal(oplayer, mark(2,4,yellow), T).
does(oplayer, mark(3,4,green), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), moveL(oplayer,6,T), legal(oplayer, mark(3,4,green), T).

move_domain(mark(1,3,yellow)).
move_domain(mark(1,4,red)).
move_domain(mark(2,1,green)).
move_domain(mark(2,2,yellow)).
move_domain(mark(1,1,yellow)).
move_domain(mark(3,2,red)).
move_domain(mark(1,4,green)).
move_domain(mark(2,4,yellow)).
move_domain(mark(2,2,green)).
move_domain(mark(1,2,red)).
move_domain(mark(2,4,green)).
move_domain(mark(3,3,green)).
move_domain(mark(3,3,red)).
move_domain(mark(3,3,yellow)).
move_domain(mark(2,1,red)).
move_domain(mark(1,1,green)).
move_domain(mark(2,3,green)).
move_domain(mark(1,2,yellow)).
move_domain(mark(2,2,red)).
move_domain(mark(3,4,green)).
move_domain(mark(1,3,green)).
move_domain(mark(3,1,green)).
move_domain(mark(1,1,red)).
move_domain(mark(3,1,red)).
move_domain(mark(1,2,green)).
move_domain(mark(3,2,green)).
move_domain(mark(3,4,red)).
move_domain(mark(2,4,red)).
move_domain(mark(3,4,yellow)).
move_domain(mark(1,3,red)).
move_domain(mark(1,4,yellow)).
move_domain(mark(3,1,yellow)).
move_domain(mark(2,1,yellow)).
move_domain(mark(2,3,yellow)).
move_domain(mark(2,3,red)).
move_domain(mark(3,2,yellow)).
