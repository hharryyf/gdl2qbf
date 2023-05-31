log_domain(1..2).

does(oplayer, drop(4), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), legal(oplayer, drop(4), T), _player_turn(oplayer, T).
does(oplayer, drop(3), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), legal(oplayer, drop(3), T).
does(oplayer, drop(1), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), legal(oplayer, drop(1), T).
does(oplayer, drop(2), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), legal(oplayer, drop(2), T).

move_domain(drop(2)).
move_domain(drop(4)).
move_domain(drop(3)).
move_domain(drop(1)).
