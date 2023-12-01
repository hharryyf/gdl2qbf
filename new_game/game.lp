% tic-tac-toe encoding of tippy SAT

role(xplayer).
role(oplayer).
true(control(xplayer), 1).


true(cell(1, 1, blank), 1). 
true(cell(1, 2, blank), 1). 
true(cell(1, 3, blank), 1). 
true(cell(1, 4, blank), 1).
true(cell(2, 1, blank), 1). 
true(cell(2, 2, blank), 1). 
true(cell(2, 3, blank), 1). 
true(cell(2, 4, blank), 1).
true(cell(3, 1, blank), 1). 
true(cell(3, 2, blank), 1). 
true(cell(3, 3, blank), 1). 
true(cell(3, 4, blank), 1).
true(cell(4, 1, blank), 1). 
true(cell(4, 2, blank), 1). 
true(cell(4, 3, blank), 1). 
true(cell(4, 4, blank), 1).


legal(P, mark(X, Y), T) :- true(control(P), T), true(cell(X, Y, blank), T), time_domain(T).
legal(P, noop, T) :- role(P), not true(control(P), T), time_domain(T).
true(control(oplayer), T + 1) :- true(control(xplayer), T), move_time_domain(T).
true(control(xplayer), T + 1) :- true(control(oplayer), T), move_time_domain(T).



true(cell(M, N, x), T + 1) :- does(xplayer, mark(M, N), T), move_time_domain(T).
true(cell(M, N, o), T + 1) :- does(oplayer, mark(M, N), T), move_time_domain(T).
true(cell(M, N, C), T + 1) :- true(cell(M, N, C), T), does(P, mark(X, Y), T), X != M, move_time_domain(T).
true(cell(M, N, C), T + 1) :- true(cell(M, N, C), T), does(P, mark(X, Y), T), Y != N, move_time_domain(T).

terminal(T) :- line(x, T), time_domain(T).
terminal(T) :- line(o, T), time_domain(T).
terminal(T) :- not open(T), time_domain(T).


open(T) :- true(cell(X, Y, blank), T), time_domain(T).

goal(xplayer, 100, T) :- line (x, T), time_domain(T).
goal(xplayer, 50, T) :- not line (x, T) , not line(o, T), time_domain(T).
goal(xplayer, 0, T) :- line(o, T), time_domain(T).
goal(oplayer, 100, T) :- line(o, T), time_domain(T).
goal(oplayer, 50, T) :- not line(x, T) , not line(o, T), time_domain(T).
goal(oplayer, 0, T) :- line(x, T), time_domain(T).

% x(1..4).
% y(1..4).

succ(1, 2).
succ(2, 3).
succ(3, 4).

% winning conditions
line(P, T) :- true(cell(X1, Y1, P), T), true(cell(X1, Y2, P), T), true(cell(X2, Y2, P), T), true(cell(X2, Y3, P), T), succ(Y1, Y2), succ(X1, X2), succ(Y2, Y3), time_domain(T).
line(P, T) :- true(cell(X1, Y2, P), T), true(cell(X1, Y3, P), T), true(cell(X2, Y1, P), T), true(cell(X2, Y2, P), T), succ(Y1, Y2), succ(X1, X2), succ(Y2, Y3), time_domain(T).
line(P, T) :- true(cell(X1, Y1, P), T), true(cell(X2, Y1, P), T), true(cell(X2, Y2, P), T), true(cell(X3, Y2, P), T), succ(Y1, Y2), succ(X1, X2), succ(X2, X3), time_domain(T).
line(P, T) :- true(cell(X1, Y2, P), T), true(cell(X2, Y1, P), T), true(cell(X2, Y2, P), T), true(cell(X3, Y1, P), T), succ(Y1, Y2), succ(X1, X2), succ(X2, X3), time_domain(T).


% please specify the move time domain
move_time_domain(1..9).




