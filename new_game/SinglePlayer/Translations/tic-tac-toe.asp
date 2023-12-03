movetimedomain(1..9).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
base(cell(X36178, X36179, b)) :- index(X36178), index(X36179), domdomain(2, X36178), domdomain(2, X36179).
base(cell(X36178, X36179, x)) :- index(X36178), index(X36179), domdomain(2, X36178), domdomain(2, X36179).
base(cell(X36178, X36179, o)) :- index(X36178), index(X36179), domdomain(2, X36178), domdomain(2, X36179).
base(control(X36178)) :- role(X36178), domdomain(4, X36178).
input(X36176, mark(X36179, X36180)) :- index(X36179), index(X36180), role(X36176), domdomain(4, X36176), domdomain(2, X36179), domdomain(2, X36180).
input(X36176, noop) :- role(X36176), domdomain(4, X36176).
true(cell(1, 1, b), 1).
true(cell(1, 2, b), 1).
true(cell(1, 3, b), 1).
true(cell(2, 1, b), 1).
true(cell(2, 2, b), 1).
true(cell(2, 3, b), 1).
true(cell(3, 1, b), 1).
true(cell(3, 2, b), 1).
true(cell(3, 3, b), 1).
true(control(xplayer), 1).
true(cell(X36178, X36179, x), X36198 + 1) :- does(xplayer, mark(X36178, X36179), X36198), true(cell(X36178, X36179, b), X36198), movetimedomain(X36198), domdomain(2, X36178), domdomain(2, X36179).
true(cell(X36178, X36179, o), X36198 + 1) :- does(oplayer, mark(X36178, X36179), X36198), true(cell(X36178, X36179, b), X36198), movetimedomain(X36198), domdomain(2, X36178), domdomain(2, X36179).
true(cell(X36178, X36179, X36180), X36195 + 1) :- true(cell(X36178, X36179, X36180), X36195), X36180 != b, movetimedomain(X36195), domdomain(2, X36178), domdomain(2, X36179), domdomain(3, X36180).
true(cell(X36178, X36179, b), X36203 + 1) :- does(X36184, mark(X36187, X36188), X36203), true(cell(X36178, X36179, b), X36203), X36178 != X36187, domdomain(4, X36184), domdomain(2, X36187), domdomain(2, X36188), movetimedomain(X36203), domdomain(2, X36178), domdomain(2, X36179).
true(cell(X36178, X36179, b), X36203 + 1) :- does(X36184, mark(X36187, X36188), X36203), true(cell(X36178, X36179, b), X36203), X36179 != X36188, domdomain(4, X36184), domdomain(2, X36187), domdomain(2, X36188), movetimedomain(X36203), domdomain(2, X36178), domdomain(2, X36179).
true(control(xplayer), X36186 + 1) :- true(control(oplayer), X36186), movetimedomain(X36186).
true(control(oplayer), X36186 + 1) :- true(control(xplayer), X36186), movetimedomain(X36186).
row(X36176, X36177, X36203) :- true(cell(X36176, 1, X36177), X36203), true(cell(X36176, 2, X36177), X36203), true(cell(X36176, 3, X36177), X36203), timedomain(X36203), domdomain(2, X36176), domdomain(3, X36177).
column(X36176, X36177, X36203) :- true(cell(1, X36176, X36177), X36203), true(cell(2, X36176, X36177), X36203), true(cell(3, X36176, X36177), X36203), timedomain(X36203), domdomain(2, X36176), domdomain(3, X36177).
diagonal(X36176, X36202) :- true(cell(1, 1, X36176), X36202), true(cell(2, 2, X36176), X36202), true(cell(3, 3, X36176), X36202), timedomain(X36202), domdomain(3, X36176).
diagonal(X36176, X36202) :- true(cell(1, 3, X36176), X36202), true(cell(2, 2, X36176), X36202), true(cell(3, 1, X36176), X36202), timedomain(X36202), domdomain(3, X36176).
line(X36176, X36183) :- row(X36180, X36176, X36183), domdomain(2, X36180), timedomain(X36183), domdomain(3, X36176).
line(X36176, X36183) :- column(X36180, X36176, X36183), domdomain(2, X36180), timedomain(X36183), domdomain(3, X36176).
line(X36176, X36182) :- diagonal(X36176, X36182), timedomain(X36182), domdomain(3, X36176).
open(X36184) :- true(cell(X36180, X36181, b), X36184), domdomain(2, X36180), domdomain(2, X36181), timedomain(X36184).
legal(X36176, mark(X36179, X36180), X36196) :- true(cell(X36179, X36180, b), X36196), true(control(X36176), X36196), timedomain(X36196), domdomain(4, X36176), domdomain(2, X36179), domdomain(2, X36180).
legal(xplayer, noop, X36185) :- true(control(oplayer), X36185), timedomain(X36185).
legal(oplayer, noop, X36185) :- true(control(xplayer), X36185), timedomain(X36185).
goal(xplayer, 100, X36183) :- line(x, X36183), timedomain(X36183).
goal(xplayer, 50, X36195) :- not line(x, X36195), not line(o, X36195), not open(X36195), timedomain(X36195).
goal(xplayer, 0, X36183) :- line(o, X36183), timedomain(X36183).
goal(oplayer, 100, X36183) :- line(o, X36183), timedomain(X36183).
goal(oplayer, 50, X36195) :- not line(x, X36195), not line(o, X36195), not open(X36195), timedomain(X36195).
goal(oplayer, 0, X36183) :- line(x, X36183), timedomain(X36183).
terminal(X36180) :- line(x, X36180), timedomain(X36180).
terminal(X36180) :- line(o, X36180), timedomain(X36180).
terminal(X36179) :- not open(X36179), timedomain(X36179).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(3, b).
domdomain(3, o).
domdomain(3, x).
domdomain(4, oplayer).
domdomain(4, xplayer).
domdomain(5, 0).
domdomain(5, 50).
domdomain(5, 100).
domdomain(6, mark).
domdomain(6, noop).
