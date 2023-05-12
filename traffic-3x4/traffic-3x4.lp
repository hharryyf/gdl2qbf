role(xplayer).
role(oplayer).

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
true(control(xplayer), 1).


move_time_domain(1..17).


true(cell(M, N, red), T + 1) :- does(P, mark(M, N, red), T), true(cell(M, N, blank), T), time_domain(T), not terminated(T).
true(cell(M, N, yellow), T + 1) :- does(P, mark(M, N, yellow), T), true(cell(M, N, red), T), time_domain(T), not terminated(T).
true(cell(M, N, green), T + 1) :- does(P, mark(M, N, green), T), true(cell(M, N, yellow), T), time_domain(T), not terminated(T).
true(cell(M, N, C0), T + 1) :- does(P, mark(J, K, C1), T), true(cell(M, N, C0), T), M != J, time_domain(T), not terminated(T).
true(cell(M, N, C0), T + 1) :- does(P, mark(J, K, C1), T), true(cell(M, N, C0), T), N != K, time_domain(T), not terminated(T).
true(control(xplayer), T + 1) :- true(control(oplayer), T), time_domain(T).
true(control(oplayer), T + 1) :- true(control(xplayer), T), time_domain(T).

legal(W, mark(X, Y, red), T) :- true(cell(X, Y, blank), T), true(control(W), T), time_domain(T).
legal(W, mark(X, Y, yellow), T) :- true(cell(X, Y, red), T), true(control(W), T), time_domain(T).
legal(W, mark(X, Y, green), T) :- true(cell(X, Y, yellow), T), true(control(W), T), time_domain(T).
legal(xplayer, noop, T) :- true(control(oplayer), T), time_domain(T).
legal(oplayer, noop, T) :- true(control(xplayer), T), time_domain(T).

terminal(T) :- aline(T), time_domain(T).
terminal(T) :- not open(T), time_domain(T).

goal(xplayer, 100, T) :- aline(T), true(control(oplayer), T), time_domain(T).

goal(xplayer, 50, T) :- not aline(T), not open(T), time_domain(T).

goal(xplayer, 0, T) :- aline(T), true(control(xplayer), T), time_domain(T).

goal(oplayer, 100, T) :- aline(T), true(control(xplayer), T), time_domain(T).

goal(oplayer, 50, T) :- not aline(T), not open(T), time_domain(T).

goal(oplayer, 0, T) :- aline(T), true(control(oplayer), T), time_domain(T).

row(M, X, T) :- true(cell(M, 1, X), T), true(cell(M, 2, X), T), true(cell(M, 3, X), T), time_domain(T).

row(M, X, T) :- true(cell(M, 2, X), T), true(cell(M, 3, X), T), true(cell(M, 4, X), T), time_domain(T).

column(N, X, T) :- true(cell(1, N, X), T), true(cell(2, N, X), T), true(cell(3, N, X), T), time_domain(T).

diagonal(X, T) :- true(cell(1, 1, X), T), true(cell(2, 2, X), T), true(cell(3, 3, X), T), time_domain(T).

diagonal(X, T) :- true(cell(1, 3, X), T), true(cell(2, 2, X), T), true(cell(3, 1, X), T), time_domain(T).

diagonal(X, T) :- true(cell(1, 2, X), T), true(cell(2, 3, X), T), true(cell(3, 4, X), T), time_domain(T).

diagonal(X, T) :- true(cell(1, 4, X), T), true(cell(2, 3, X), T), true(cell(3, 2, X), T), time_domain(T).

line(X, T) :- row(M, X, T), time_domain(T).
line(X, T) :- column(M, X, T), time_domain(T).
line(X, T) :- diagonal(X, T), time_domain(T).

aline(T) :- line(red, T), time_domain(T).
aline(T) :- line(yellow, T), time_domain(T).
aline(T) :- line(green, T), time_domain(T).

open(T) :- true(cell(M, N, blank), T), time_domain(T).

open(T) :- true(cell(M, N, red), T), time_domain(T).

open(T) :- true(cell(M, N, yellow), T), time_domain(T).
