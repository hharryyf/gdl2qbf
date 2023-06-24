log_domain(1..5).

does(oplayer, moves(2,2,2,3), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, moves(2,2,2,3), T), _player_turn(oplayer, T), not terminated(T).
does(oplayer, moves(1,3,1,4), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, moves(1,3,1,4), T), not terminated(T).
does(oplayer, moves(1,3,2,2), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, moves(1,3,2,2), T), not terminated(T).
does(oplayer, moves(2,3,2,4), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, moves(2,3,2,4), T), not terminated(T).
does(oplayer, moves(1,5,2,4), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, moves(1,5,2,4), T), not terminated(T).
does(oplayer, moves(1,3,2,4), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, moves(1,3,2,4), T), not terminated(T).
does(oplayer, moves(2,3,1,2), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, moves(2,3,1,2), T), not terminated(T).
does(oplayer, moves(1,1,2,2), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, moves(1,1,2,2), T), not terminated(T).
does(oplayer, moves(2,2,2,1), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, moves(2,2,2,1), T), not terminated(T).
does(oplayer, moves(1,5,1,4), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, moves(1,5,1,4), T), not terminated(T).
does(oplayer, moves(1,2,1,3), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, moves(1,2,1,3), T), not terminated(T).
does(oplayer, moves(2,1,1,2), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, moves(2,1,1,2), T), not terminated(T).
does(oplayer, moves(2,4,2,5), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, moves(2,4,2,5), T), not terminated(T).
does(oplayer, moves(2,4,1,5), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, moves(2,4,1,5), T), not terminated(T).
does(oplayer, moves(1,4,1,5), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, moves(1,4,1,5), T), not terminated(T).
does(oplayer, moves(1,4,1,3), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), not moveL(oplayer,5,T), legal(oplayer, moves(1,4,1,3), T), not terminated(T).
does(oplayer, moves(1,4,2,3), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, moves(1,4,2,3), T), not terminated(T).
does(oplayer, moves(1,2,2,3), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, moves(1,2,2,3), T), not terminated(T).
does(oplayer, moves(1,4,2,5), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, moves(1,4,2,5), T), not terminated(T).
does(oplayer, moves(2,3,2,2), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, moves(2,3,2,2), T), not terminated(T).
does(oplayer, moves(1,1,1,2), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, moves(1,1,1,2), T), not terminated(T).
does(oplayer, moves(2,2,1,1), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, moves(2,2,1,1), T), not terminated(T).
does(oplayer, moves(1,3,1,2), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, moves(1,3,1,2), T), not terminated(T).
does(oplayer, moves(1,2,2,1), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), not moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, moves(1,2,2,1), T), not terminated(T).
does(oplayer, moves(2,5,1,4), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, moves(2,5,1,4), T), not terminated(T).
does(oplayer, moves(2,4,1,3), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, moves(2,4,1,3), T), not terminated(T).
does(oplayer, moves(2,4,2,3), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, moves(2,4,2,3), T), not terminated(T).
does(oplayer, moves(2,5,2,4), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), not moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, moves(2,5,2,4), T), not terminated(T).
does(oplayer, moves(1,2,1,1), T) :- not moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, moves(1,2,1,1), T), not terminated(T).
does(oplayer, moves(2,2,1,3), T) :- moveL(oplayer,1,T), not moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, moves(2,2,1,3), T), not terminated(T).
does(oplayer, moves(2,3,1,4), T) :- not moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, moves(2,3,1,4), T), not terminated(T).
does(oplayer, moves(2,1,2,2), T) :- moveL(oplayer,1,T), moveL(oplayer,2,T), moveL(oplayer,3,T), moveL(oplayer,4,T), moveL(oplayer,5,T), legal(oplayer, moves(2,1,2,2), T), not terminated(T).

move_domain(moves(1,3,2,4)).
move_domain(moves(1,3,1,4)).
move_domain(moves(2,1,1,2)).
move_domain(moves(2,3,1,2)).
move_domain(moves(1,5,2,4)).
move_domain(moves(2,3,2,4)).
move_domain(moves(2,1,2,2)).
move_domain(moves(2,3,2,2)).
move_domain(moves(1,5,1,4)).
move_domain(moves(2,2,1,3)).
move_domain(moves(2,2,1,1)).
move_domain(moves(2,5,2,4)).
move_domain(moves(1,1,1,2)).
move_domain(moves(2,2,2,1)).
move_domain(moves(2,3,1,4)).
move_domain(moves(1,3,2,2)).
move_domain(moves(2,4,2,3)).
move_domain(moves(1,3,1,2)).
move_domain(moves(2,5,1,4)).
move_domain(moves(1,2,2,1)).
move_domain(moves(1,2,2,3)).
move_domain(moves(2,4,1,3)).
move_domain(moves(2,4,1,5)).
move_domain(moves(1,4,2,5)).
move_domain(moves(2,4,2,5)).
move_domain(moves(1,2,1,3)).
move_domain(moves(2,2,2,3)).
move_domain(moves(1,1,2,2)).
move_domain(moves(1,2,1,1)).
move_domain(moves(1,4,1,5)).
move_domain(moves(1,4,2,3)).
move_domain(moves(1,4,1,3)).
