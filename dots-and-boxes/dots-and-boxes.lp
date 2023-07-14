role(xplayer).
role(oplayer).

index(1).
index(2).
index(3).
index(4).
index(5).
index(6).
next_index(1, 2).
next_index(2, 3).
next_index(3, 4).
next_index(4, 5).
next_index(5, 6).

true(box_count(xplayer, 0), 1).
true(box_count(oplayer, 0), 1).
true(control(xplayer), 1).


undrawn(X, Y1, X, Y2, T) :- index(X), next_index(Y1, Y2), not true(line(X, Y1, X, Y2), T), time_domain(T).

undrawn(X1, Y, X2, Y) :- next_index(X1, X2), index(Y), not true(line(X1, Y, X2, Y), T), time_domain(T).

any_undrawn(T) :- undrawn(X1, Y1, X2, Y2, T), time_domain(T).

legal(P, draw(X1, Y1, X2, Y2), T) :- true(control(P), T), undrawn(X1, Y1, X2, Y2, T), time_domain(T).

true(line(X1, Y1, X2, Y2), T+1) :- does(P, draw(X1, Y1, X2, Y2), T), move_time_domain(T).
true(line(X1, Y1, X2, Y2), T+1) :- true(line(X1, Y1, X2, Y2), T), move_time_domain(T). 

legal(P, noop, T) :- role(P), not true(control(P), T), time_domain(T).

v_drawn(X, Y1, X, Y2, T) :- does(P, draw(X, Y1, X, Y2), T), move_time_domain(T).
h_drawn(X1, Y, X2, Y, T) :- does(P, draw(X1, Y, X2, Y), T), move_time_domain(T).    

box_formed(X1, Y1, T) :- h_drawn(X1, Y1, X1, Y2, T), true(line(X1, Y2, X2, Y2), T), true(line(X1, Y1, X2, Y1), T), true(line(X2, Y1, X2, Y2), T), time_domain(T).

box_formed(X1, Y1, T) :- v_drawn(X2, Y1, X2, Y2, T), true(line(X1, Y1, X2, Y1), T), true(line(X1, Y1, X1, Y2), T), true(line(X1, Y2, X2, Y2), T), time_domain(T).

box_formed(X1, Y1, T) :- h_drawn(X1, Y1, X2, Y1, T), true(line(X2, Y1, X2, Y2), T), true(line(X1, Y1, X1, Y2), T), true(line(X1, Y2, X2, Y2), T), time_domain(T).

box_formed(X1, Y1, T) :- h_drawn(X1, Y2, X2, Y2, T), true(line(X1, Y1, X1, Y2), T), true(line(X1, Y1, X2, Y1), T), true(line(X2, Y1, X2, Y2), T), time_domain(T).

any_box_formed(T) :- box_formed(X, Y, T), time_domain(T).
two_boxes_formed(T) :- box_formed(X1, Y1, T), box_formed(X2, Y2, T), X1 != X2, time_domain(T).
two_boxes_formed(T) :- box_formed(X1, Y1, T), box_formed(X2, Y2, T), Y1 != Y2, time_domain(T).

true(box_count(P, N), T+1) :- true(box_count(P, N), T), not true(control(P), T), move_time_domain(T).
true(box_count(P, N), T+1) :- true(box_count(P, N), T), true(control(P), T), not any_box_formed(T), move_time_domain(T).    
true(box_count(P, NP1), T+1) :- true(box_count(P, N), T), true(control(P), T), any_box_formed(T), not two_boxes_formed(T), succ(N, NP1), move_time_domain(T).
true(box_count(P, NP2), T+1) :- true(box_count(P, N), T), true(control(P), T), two_boxes_formed(T), succ(N, NP1), succ(NP1, NP2), move_time_domain(T).


true(control(P), T+1) :- true(control(P), T), any_box_formed(T), move_time_domain(T).
true(control(xplayer), T+1) :- true(control(oplayer), T), not any_box_formed(T), move_time_domain(T).
true(control(oplayer), T+1) :- true(control(xplayer), T), not any_box_formed(T), move_time_domain(T).


true(box(X, Y, x), T+1) :- box_formed(X, Y), true(control(xplayer), T), move_time_domain(T).
true(box(X, Y, o), T+1) :- box_formed(X, Y), true(control(oplayer), T), move_time_domain(T).
true(box(X, Y, M), T+1) :- true(box(X, Y, M), T), move_time_domain(T).

terminal(T) :- not any_undrawn(T), time_domain(T).

x_wins(T) :- true(box_count(xplayer, X), T), true(box_count(oplayer, O), T), gt(X, O).

o_wins(T) :- true(box_count(xplayer, X), T), true(box_count(oplayer, O), T), gt(O, X).

o_wins(T) :- true(box_count(xplayer, TIED), T), true(box_count(oplayer, TIED), T), time_domain(T).

goal(xplayer, 100, T) :- x_wins(T), time_domain(T).

goal(xplayer, 0, T) :- not x_wins(T), time_domain(T).


goal(oplayer, 100, T) :- o_wins(T), time_domain(T).

goal(oplayer, 0, T) :- not o_wins(T), time_domain(T).

gt(H, L) :- succ(L, H).
gt(H, L) :- succ(M, H), gt(M, L), succ(L, LP1).

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

