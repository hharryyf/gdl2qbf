line(P, T) :- true(cell(X, Y1, P), T), true(cell(X, Y2, P), T), true(cell(X, Y3, P), T), succ(Y1, Y2), succ(Y2, Y3), time_domain(T).
line(P, T) :- true(cell(X1, Y, P), T), true(cell(X2, Y, P), T), true(cell(X3, Y, P), T), succ(X1, X2), succ(X2, X3), time_domain(T).

move_time_domain(1..5).
