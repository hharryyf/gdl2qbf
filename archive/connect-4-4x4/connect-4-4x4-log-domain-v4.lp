log_domain(1..2).

does(oplayer, drop(1), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), legal(oplayer, drop(1), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, drop(2), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), legal(oplayer, drop(2), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, drop(3), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), legal(oplayer, drop(3), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, drop(4), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), legal(oplayer, drop(4), T), _player_turn(oplayer, T), not terminated(T).

move_domain(oplayer,drop(1)).
move_domain(oplayer,drop(2)).
move_domain(oplayer,drop(3)).
move_domain(oplayer,drop(4)).
move_domain(xplayer,drop(1)).
move_domain(xplayer,drop(2)).
move_domain(xplayer,drop(3)).
move_domain(xplayer,drop(4)).

