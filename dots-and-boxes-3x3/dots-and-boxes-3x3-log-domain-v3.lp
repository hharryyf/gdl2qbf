log_domain(1..5).

does(oplayer, draw(3,3,3,4), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, draw(3,3,3,4), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(3,1,4,1), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, draw(3,1,4,1), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(2,3,2,4), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, draw(2,3,2,4), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(1,2,1,3), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, draw(1,2,1,3), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(1,2,2,2), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, draw(1,2,2,2), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(4,1,4,2), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, draw(4,1,4,2), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(3,4,4,4), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, draw(3,4,4,4), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(2,4,3,4), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, draw(2,4,3,4), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(1,1,2,1), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, draw(1,1,2,1), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(3,2,3,3), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, draw(3,2,3,3), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(4,3,4,4), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, draw(4,3,4,4), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(2,3,3,3), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, draw(2,3,3,3), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(2,1,2,2), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, draw(2,1,2,2), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(1,4,2,4), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, draw(1,4,2,4), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(3,2,4,2), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, draw(3,2,4,2), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(1,3,1,4), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, draw(1,3,1,4), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(3,3,4,3), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, draw(3,3,4,3), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(1,1,1,2), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, draw(1,1,1,2), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(4,2,4,3), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, draw(4,2,4,3), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, noop, T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, noop, T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(3,1,3,2), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, draw(3,1,3,2), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(1,3,2,3), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, draw(1,3,2,3), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(2,1,3,1), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, draw(2,1,3,1), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(2,2,3,2), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, draw(2,2,3,2), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, draw(2,2,2,3), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, draw(2,2,2,3), T), _player_turn(oplayer, T), not terminated(T).

move_domain(draw(1,3,2,3)).
move_domain(draw(3,2,4,2)).
move_domain(draw(1,4,2,4)).
move_domain(draw(3,2,3,3)).
move_domain(draw(2,3,3,3)).
move_domain(draw(1,2,2,2)).
move_domain(draw(2,2,2,3)).
move_domain(draw(2,4,3,4)).
move_domain(draw(4,1,4,2)).
move_domain(draw(4,2,4,3)).
move_domain(draw(3,3,3,4)).
move_domain(draw(2,1,3,1)).
move_domain(draw(1,2,1,3)).
move_domain(draw(1,3,1,4)).
move_domain(draw(1,1,2,1)).
move_domain(noop).
move_domain(draw(3,3,4,3)).
move_domain(draw(2,1,2,2)).
move_domain(draw(4,3,4,4)).
move_domain(draw(3,1,3,2)).
move_domain(draw(2,2,3,2)).
move_domain(draw(2,3,2,4)).
move_domain(draw(3,4,4,4)).
move_domain(draw(1,1,1,2)).
move_domain(draw(3,1,4,1)).
