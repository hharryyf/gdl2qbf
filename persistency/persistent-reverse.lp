
not_persistent_reverse :- true(cell(1, 1, xplayer), T), not true(cell(1, 1, xplayer), T-1), time_domain(T), time_domain(T-1), not terminated(T).
:- not not_persistent_reverse.
:- cheat(T).

#show does/3.