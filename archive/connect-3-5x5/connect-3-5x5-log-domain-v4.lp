log_domain(1..3).

does(oplayer, drop(1), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), legal(oplayer, drop(1), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, drop(2), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), legal(oplayer, drop(2), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, drop(3), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), legal(oplayer, drop(3), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, drop(4), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), legal(oplayer, drop(4), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, drop(5), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), legal(oplayer, drop(5), T), _player_turn(oplayer, T), not terminated(T).

move_domain(oplayer,drop(1)).
move_domain(oplayer,drop(2)).
move_domain(oplayer,drop(3)).
move_domain(oplayer,drop(4)).
move_domain(oplayer,drop(5)).
move_domain(xplayer,drop(1)).
move_domain(xplayer,drop(2)).
move_domain(xplayer,drop(3)).
move_domain(xplayer,drop(4)).
move_domain(xplayer,drop(5)).

