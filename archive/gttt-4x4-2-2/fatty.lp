line(P, T) :- true(cell(X1, Y1, P), T), true(cell(X1, Y2, P), T), true(cell(X2, Y1, P), T), true(cell(X2, Y2, P), T), succ(Y1, Y2), succ(X1, X2), time_domain(T).

move_time_domain(1..14).
