% the encoding of 5*5 connect-4

role(xplayer).
role(oplayer).

true(control(xplayer), 1).

move_time_domain(1..25).


legal(xplayer, noop, T) :- true(control(oplayer), T), time_domain(T).
legal(xplayer, drop(X), T) :- true(control(xplayer), T), columnopen(X, T), time_domain(T).
legal(oplayer, noop, T) :- true(control(xplayer), T), time_domain(T).
legal(oplayer, drop(X), T) :- true(control(oplayer), T), columnopen(X, T), time_domain(T).


true(cell(X, 1, P), T + 1) :- does(P, drop(X), T), columnempty(X, T), move_time_domain(T).

true(cell(X, Y2, P), T + 1) :- does(P, drop(X), T), cellopen(X, Y2, T), succ(Y1, Y2), not cellopen(X, Y1, T), move_time_domain(T).


true(cell(X, Y, P), T + 1) :- true(cell(X, Y, P), T), move_time_domain(T).

true(control(xplayer), T + 1) :- true(control(oplayer), T), move_time_domain(T).

true(control(oplayer), T + 1) :- true(control(xplayer), T), move_time_domain(T).


terminal(T) :- line(xplayer, T), time_domain(T).

terminal(T) :- line(oplayer, T), time_domain(T).

terminal(T) :- not boardopen(T), time_domain(T).


goal(xplayer, 100, T) :- line(xplayer, T), time_domain(T).

goal(xplayer, 50, T) :- not line(xplayer, T), not line(oplayer, T), not boardopen(T), time_domain(T).

goal(xplayer, 0, T) :- line(oplayer, T), time_domain(T).

goal(xplayer, 0, T) :- not line(xplayer, T), not line(oplayer, T), boardopen(T), time_domain(T).

goal(oplayer, 100, T) :- line(oplayer, T), time_domain(T).

goal(oplayer, 50, T) :- not line(xplayer, T), not line(oplayer, T), not boardopen(T), time_domain(T).

goal(oplayer, 0, T) :- line(xplayer, T), time_domain(T).

goal(oplayer, 0, T) :- not line(xplayer, T), not line(oplayer, T), boardopen(T).


cellopen(X, Y, T) :- x(X), y(Y), not true(cell(X, Y, xplayer), T), not true(cell(X, Y, oplayer), T), time_domain(T).

columnopen(X, T) :- cellopen(X, 5, T), time_domain(T).

columnempty(X, T) :- cellopen(X, 1, T), time_domain(T).

boardopen(T) :- x(X), columnopen(X, T), time_domain(T).

line(P, T) :- true(cell(X1, Y, P), T), succ(X1, X2), succ(X2, X3), succ(X3, X4), 
              true(cell(X2, Y, P), T), true(cell(X3, Y, P), T), true(cell(X4, Y, P), T), time_domain(T).

line(P, T) :- true(cell(X, Y1, P), T), succ(Y1, Y2), succ(Y2, Y3), succ(Y3, Y4), 
           true(cell(X, Y2, P), T), true(cell(X, Y3, P), T), true(cell(X, Y4, P), T), time_domain(T).

line(P, T) :- true(cell(X1, Y1, P), T), succ(X1, X2), succ(X2, X3), succ(X3, X4), succ(Y1, Y2), succ(Y2, Y3), succ(Y3, Y4),
           true(cell(X2, Y2, P), T), true(cell(X3, Y3, P), T), true(cell(X4, Y4, P), T), time_domain(T).


line(P, T) :- true(cell(X1, Y4, P), T), succ(X1, X2), succ(X2, X3), succ(X3, X4), succ(Y1, Y2), succ(Y2, Y3), succ(Y3, Y4),
           true(cell(X2, Y3, P), T), true(cell(X3, Y2, P), T), true(cell(X4, Y1, P), T), time_domain(T).
    

succ(1, 2).
succ(2, 3).
succ(3, 4).
succ(4, 5).

x(1..5).
y(1..5).
