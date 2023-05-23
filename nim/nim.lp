role(xplayer).
role(oplayer).

true(heap(a, 1), 1).
true(heap(b, 5), 1).
true(heap(c, 4), 1).
true(heap(d, 2), 1).

true(control(xplayer), 1).

move_time_domain(1..11).

legal(P, noop, T) :- true(control(X), T), role(P), X != P, time_domain(T).

legal(P, reduce(X, N), T) :- true(control(P), T), true(heap(X, M), T), smaller(N, M), time_domain(T).

true(heap(X, N), T + 1) :- does(P, reduce(X, N), T), move_time_domain(T), not terminated(T).

true(heap(X, N), T + 1) :- true(heap(X, N), T), does(P, reduce(Y, M), T), X != Y, move_time_domain(T), not terminated(T).


true(control(P2), T + 1) :- true(control(P1), T), next_player(P1, P2), move_time_domain(T), not terminated(T).

terminal(T) :- true(heap(a, 0), T), true(heap(b, 0), T), true(heap(c, 0), T), true(heap(d, 0), T), time_domain(T).

goal(P, 0, T) :- true(control(P), T), time_domain(T).

goal(P, 100, T) :- true(control(P1), T), next_player(P, P1), time_domain(T).

smaller(X, Y) :- succ(X, Y).

smaller(X, Y) :- succ(X, Z), smaller(Z, Y).

next_player(xplayer, oplayer).
next_player(oplayer, xplayer).

succ(0, 1).
succ(1, 2).
succ(2, 3).
succ(3, 4).
succ(4, 5).
succ(5, 6).
succ(6, 7).
succ(7, 8).
succ(8, 9).
succ(9, 10).
succ(10, 11).
succ(11, 12).
succ(12, 13).
succ(13, 14).
succ(14, 15).
succ(15, 16).
succ(16, 17).
succ(17, 18).
succ(18, 19).
succ(19, 20).
succ(20, 21).
succ(21, 22).
succ(22, 23).
succ(23, 24).
succ(24, 25).
succ(25, 26).
succ(26, 27).

