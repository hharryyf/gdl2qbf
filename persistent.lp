
notpersistent :- not true(cell(M, N, green), T), true(cell(M, N, green), T-1), time_domain(T), time_domain(T-1), not terminated(T).
:- not notpersistent.
:- cheat(T).

#show does/3.