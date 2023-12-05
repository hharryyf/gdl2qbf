line(P, T) :- true(cell(X1, Y1, P), T), true(cell(X1, Y2, P), T), true(cell(X1, Y3, P), T), true(cell(X2, Y2, P), T), succ(Y1, Y2), succ(X1, X2), succ(Y2, Y3), time_domain(T).
line(P, T) :- true(cell(X1, Y1, P), T), true(cell(X1, Y2, P), T), true(cell(X1, Y3, P), T), true(cell(X2, Y2, P), T), succ(Y1, Y2), succ(X2, X1), succ(Y2, Y3), time_domain(T).
line(P, T) :- true(cell(X1, Y1, P), T), true(cell(X2, Y1, P), T), true(cell(X3, Y1, P), T), true(cell(X2, Y2, P), T), succ(X1, X2), succ(X2, X3), succ(Y1, Y2), time_domain(T).
line(P, T) :- true(cell(X1, Y1, P), T), true(cell(X2, Y1, P), T), true(cell(X3, Y1, P), T), true(cell(X2, Y2, P), T), succ(X1, X2), succ(X2, X3), succ(Y2, Y1), time_domain(T).

move_time_domain(1..6).
