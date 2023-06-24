log_domain(1..3).

does(oplayer, drop(2), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), legal(oplayer, drop(2), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, drop(7), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), legal(oplayer, drop(7), T), not terminated(T).
does(oplayer, drop(1), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), legal(oplayer, drop(1), T), not terminated(T).
does(oplayer, drop(4), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), legal(oplayer, drop(4), T), not terminated(T).
does(oplayer, drop(3), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), legal(oplayer, drop(3), T), not terminated(T).
does(oplayer, drop(6), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), legal(oplayer, drop(6), T), not terminated(T).
does(oplayer, drop(5), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), legal(oplayer, drop(5), T), not terminated(T).

move_domain(drop(5)).
move_domain(drop(4)).
move_domain(drop(7)).
move_domain(drop(3)).
move_domain(drop(6)).
move_domain(drop(1)).
move_domain(drop(2)).
