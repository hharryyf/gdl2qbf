% tic-tac-toe encoding

role(xplayer).
role(oplayer).
move_time_domain(1..9).

true(control(xplayer), 1).


legal(P, mark(X, Y), T) :- true(control(P), T), true(cell(X, Y, blank), T), time_domain(T).
legal(P, noop, T) :- role(P), not true(control(P), T), time_domain(T).
true(control(oplayer), T + 1) :- true(control(xplayer), T), move_time_domain(T), not terminated(T).
true(control(xplayer), T + 1) :- true(control(oplayer), T), move_time_domain(T), not terminated(T).



true(cell(M, N, x), T + 1) :- does(xplayer, mark(M, N), T), move_time_domain(T), not terminated(T).
true(cell(M, N, o), T + 1) :- does(oplayer, mark(M, N), T), move_time_domain(T), not terminated(T).
true(cell(M, N, C), T + 1) :- true(cell(M, N, C), T), does(P, mark(X, Y), T), X != M, move_time_domain(T), not terminated(T).
true(cell(M, N, C), T + 1) :- true(cell(M, N, C), T), does(P, mark(X, Y), T), Y != N, move_time_domain(T), not terminated(T).
%true(cell(M, N, x), T + 1) :- true(cell(M, N, x), T), move_time_domain(T), not terminated(T).
%true(cell(M, N, o), T + 1) :- true(cell(M, N, o), T), move_time_domain(T), not terminated(T).
% true(cell(M, N, blank), T + 1) :- true(cell(M, N, blank), T), does(P, mark(X, Y), T), X != M, move_time_domain(T), not terminated(T).
% true(cell(M, N, blank), T + 1) :- true(cell(M, N, blank), T), does(P, mark(X, Y), T), Y != N, move_time_domain(T), not terminated(T).

terminal(T) :- line(x, T), time_domain(T).
terminal(T) :- line(o, T), time_domain(T).
terminal(T) :- not open(T), time_domain(T).

line(P, T) :- true(cell(1, Y, P), T), true(cell(2, Y, P), T), true(cell(3, Y, P), T), time_domain(T).
line(P, T) :- true(cell(X, 1, P), T), true(cell(X, 2, P), T), true(cell(X, 3, P), T), time_domain(T).
line(P, T) :- true(cell(1, 1, P), T), true(cell(2, 2, P), T), true(cell(3, 3, P), T), time_domain(T).
line(P, T) :- true(cell(1, 3, P), T), true(cell(2, 2, P), T), true(cell(3, 1, P), T), time_domain(T).

open(T) :- true(cell(X, Y, blank), T), time_domain(T).

goal(xplayer, 100, T) :- line (x, T), time_domain(T).
goal(xplayer, 50, T) :- not line (x, T) , not line(o, T), time_domain(T).
goal(xplayer, 0, T) :- line(o, T), time_domain(T).
goal(oplayer, 100, T) :- line(o, T), time_domain(T).
goal(oplayer, 50, T) :- not line(x, T) , not line(o, T), time_domain(T).
goal(oplayer, 0, T) :- line(x, T), time_domain(T).


% persistent
:- true(cell(M, N, blank), T), not true(cell(M, N, blank), T-1), time_domain(T-1), time_domain(T), not terminated(T).
true(cell(M, N, x), T + 1) :- true(cell(M, N, x), T), move_time_domain(T), not terminated(T).
true(cell(M, N, o), T + 1) :- true(cell(M, N, o), T), move_time_domain(T), not terminated(T).
