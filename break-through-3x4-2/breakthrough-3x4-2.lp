role(xplayer).
role(oplayer).

true(cell(1, 1, xplayer), 1).
true(cell(2, 1, xplayer), 1).
true(cell(3, 1, xplayer), 1).

true(cell(1, 4, oplayer), 1).
true(cell(2, 4, oplayer), 1).
true(cell(3, 4, oplayer), 1).

true(cell(1, 2, xplayer), 1).
true(cell(2, 2, xplayer), 1).
true(cell(3, 2, xplayer), 1).

true(cell(1, 3, oplayer), 1).
true(cell(2, 3, oplayer), 1).
true(cell(3, 3, oplayer), 1).

true(control(xplayer), 1).

move_time_domain(1..17).

%move_domain(moves(1..3, 1..3, 1..3, 1..3)).

move_domain(moves(1, 1, 1, 2)).
move_domain(moves(1, 1, 2, 2)).
move_domain(moves(2, 1, 2, 2)).
move_domain(moves(2, 1, 1, 2)).
move_domain(moves(2, 1, 3, 2)).
move_domain(moves(3, 1, 3, 2)).
move_domain(moves(3, 1, 2, 2)).
move_domain(moves(1, 2, 1, 3)).
move_domain(moves(1, 2, 2, 3)).
move_domain(moves(2, 2, 2, 3)).
move_domain(moves(2, 2, 1, 3)).
move_domain(moves(2, 2, 3, 3)).
move_domain(moves(3, 2, 3, 3)).
move_domain(moves(3, 2, 2, 3)).
move_domain(moves(1, 3, 1, 4)).
move_domain(moves(1, 3, 2, 4)).
move_domain(moves(2, 3, 2, 4)).
move_domain(moves(2, 3, 1, 4)).
move_domain(moves(2, 3, 3, 4)).
move_domain(moves(3, 3, 3, 4)).
move_domain(moves(3, 3, 2, 4)).


move_domain(moves(1, 2, 1, 1)).
move_domain(moves(2, 2, 1, 1)).
move_domain(moves(2, 2, 2, 1)).
move_domain(moves(1, 2, 2, 1)).
move_domain(moves(3, 2, 2, 1)).
move_domain(moves(3, 2, 3, 1)).
move_domain(moves(2, 2, 3, 1)).
move_domain(moves(1, 3, 1, 2)).
move_domain(moves(2, 3, 1, 2)).
move_domain(moves(2, 3, 2, 2)).
move_domain(moves(1, 3, 2, 2)).
move_domain(moves(3, 3, 2, 2)).
move_domain(moves(3, 3, 3, 2)).
move_domain(moves(2, 3, 3, 2)).
move_domain(moves(1, 4, 1, 3)).
move_domain(moves(2, 4, 1, 3)).
move_domain(moves(2, 4, 2, 3)).
move_domain(moves(1, 4, 2, 3)).
move_domain(moves(3, 4, 2, 3)).
move_domain(moves(3, 4, 3, 3)).
move_domain(moves(2, 4, 3, 3)).


move_domain(noop).

    

legal(xplayer, moves(X, Y1, X, Y2), T) :- true(control(xplayer), T), true(cell(X, Y1, xplayer), T), 
                                          yplusplus(Y1, Y2), cellEmpty(X, Y2, T), time_domain(T), not terminated(T-1).


legal(xplayer, moves(X1, Y1, X2, Y2), T) :- true(control(xplayer), T), true(cell(X1, Y1, xplayer), T), 
                                          yplusplus(Y1, Y2), xplusplus(X1, X2), not true(cell(X2, Y2, xplayer), T), time_domain(T), not terminated(T-1).


legal(xplayer, moves(X1, Y1, X2, Y2), T) :- true(control(xplayer), T), true(cell(X1, Y1, xplayer), T),
                                            yplusplus(Y1, Y2), xplusplus(X2, X1), not true(cell(X2, Y2, xplayer), T), time_domain(T), not terminated(T-1).



legal(oplayer, moves(X, Y1, X, Y2), T) :- true(control(oplayer), T), true(cell(X, Y1, oplayer), T),
                                          yplusplus(Y2, Y1), cellEmpty(X, Y2, T), time_domain(T), not terminated(T-1).


legal(oplayer, moves(X1, Y1, X2, Y2), T) :- true(control(oplayer), T), true(cell(X1, Y1, oplayer), T),
                                            yplusplus(Y2, Y1), xplusplus(X1, X2), not true(cell(X2, Y2, oplayer), T), time_domain(T), not terminated(T-1).



legal(oplayer, moves(X1, Y1, X2, Y2), T) :- true(control(oplayer), T), true(cell(X1, Y1, oplayer), T),
                                            yplusplus(Y2, Y1), xplusplus(X2, X1), not true(cell(X2, Y2, oplayer), T), time_domain(T), not terminated(T-1).


legal(xplayer, noop, T) :- true(control(oplayer), T), time_domain(T), not terminated(T-1).

legal(oplayer, noop, T) :- true(control(xplayer), T), time_domain(T), not terminated(T-1).


true(cell(X2, Y2, P), T + 1) :- role(P), does(P, moves(X1, Y1, X2, Y2), T), time_domain(T), not terminated(T), not cheat(T).


true(cell(X3, Y3, S), T + 1) :- true(cell(X3, Y3, S), T), role(P), does(P, moves(X1, Y1, X2, Y2), T),
                                distinctCell(X1, Y1, X3, Y3), distinctCell(X2, Y2, X3, Y3), not terminated(T), time_domain(T), not cheat(T).

true(control(xplayer), T + 1) :- true(control(oplayer), T), time_domain(T), not terminated(T).
true(control(oplayer), T + 1) :- true(control(xplayer), T), time_domain(T), not terminated(T).



terminal(T) :- whiteWin(T), time_domain(T), not terminated(T-1).
terminal(T) :- blackWin(T), time_domain(T), not terminated(T-1).

goal(xplayer, 100, T) :- whiteWin(T), time_domain(T), not terminated(T-1).
goal(xplayer, 0, T) :- not whiteWin(T), time_domain(T), not terminated(T-1).
goal(oplayer, 100, T) :- blackWin(T), time_domain(T), not terminated(T-1).
goal(oplayer, 0, T) :- not blackWin(T), time_domain(T), not terminated(T-1).



cell(X, Y) :- xindex(X), yindex(Y).

cellEmpty(X, Y, T) :- cell(X, Y), not true(cell(X, Y, xplayer), T), not true(cell(X, Y, oplayer), T), time_domain(T), not terminated(T-1).

distinctCell(X1, Y1, X2, Y2) :- cell(X1, Y1), cell(X2, Y2), X1 != X2.

distinctCell(X1, Y1, X2, Y2) :- cell(X1, Y1), cell(X2, Y2), Y1 != Y2.

whiteWin(T) :- xindex(X), true(cell(X, 4, xplayer), T), time_domain(T), not terminated(T-1).

blackWin(T) :- xindex(X), true(cell(X, 1, oplayer), T), time_domain(T), not terminated(T-1).

whiteWin(T) :- not blackCell(T), time_domain(T), not terminated(T-1).

blackWin(T) :- not whiteCell(T), time_domain(T), not terminated(T-1).

whiteCell(T) :- cell(X, Y), true(cell(X, Y, xplayer), T), time_domain(T), not terminated(T-1).

blackCell(T) :- cell(X, Y), true(cell(X, Y, oplayer), T), time_domain(T), not terminated(T-1).


xindex(1..3).
yindex(1..4).
xplusplus(1, 2).
xplusplus(2, 3).
yplusplus(1, 2).
yplusplus(2, 3).
yplusplus(3, 4).