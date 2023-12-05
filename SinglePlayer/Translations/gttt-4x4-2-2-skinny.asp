movetimedomain(1..14).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X41702, X41703, b)) :- index(X41702), index(X41703), domdomain(2, X41702), domdomain(2, X41703).
base(cell(X41702, X41703, x)) :- index(X41702), index(X41703), domdomain(2, X41702), domdomain(2, X41703).
base(cell(X41702, X41703, o)) :- index(X41702), index(X41703), domdomain(2, X41702), domdomain(2, X41703).
base(control1(X41702)) :- role(X41702), domdomain(4, X41702).
base(control2(X41702)) :- role(X41702), domdomain(4, X41702).
input(X41700, mark(X41703, X41704)) :- index(X41703), index(X41704), role(X41700), domdomain(4, X41700), domdomain(2, X41703), domdomain(2, X41704).
input(X41700, noop) :- role(X41700), domdomain(4, X41700).
true(cell(1, 1, b), 1).
true(cell(1, 2, b), 1).
true(cell(1, 3, b), 1).
true(cell(1, 4, b), 1).
true(cell(2, 1, b), 1).
true(cell(2, 2, b), 1).
true(cell(2, 3, b), 1).
true(cell(2, 4, b), 1).
true(cell(3, 1, b), 1).
true(cell(3, 2, b), 1).
true(cell(3, 3, b), 1).
true(cell(3, 4, b), 1).
true(cell(4, 1, b), 1).
true(cell(4, 2, b), 1).
true(cell(4, 3, b), 1).
true(cell(4, 4, b), 1).
true(control1(xplayer), 1).
true(cell(X41702, X41703, x), X41722 + 1) :- does(xplayer, mark(X41702, X41703), X41722), true(cell(X41702, X41703, b), X41722), movetimedomain(X41722), domdomain(2, X41702), domdomain(2, X41703).
true(cell(X41702, X41703, o), X41722 + 1) :- does(oplayer, mark(X41702, X41703), X41722), true(cell(X41702, X41703, b), X41722), movetimedomain(X41722), domdomain(2, X41702), domdomain(2, X41703).
true(cell(X41702, X41703, X41704), X41719 + 1) :- true(cell(X41702, X41703, X41704), X41719), X41704 != b, movetimedomain(X41719), domdomain(2, X41702), domdomain(2, X41703), domdomain(3, X41704).
true(cell(X41702, X41703, b), X41727 + 1) :- does(X41708, mark(X41711, X41712), X41727), true(cell(X41702, X41703, b), X41727), X41702 != X41711, domdomain(4, X41708), domdomain(2, X41711), domdomain(2, X41712), movetimedomain(X41727), domdomain(2, X41702), domdomain(2, X41703).
true(cell(X41702, X41703, b), X41727 + 1) :- does(X41708, mark(X41711, X41712), X41727), true(cell(X41702, X41703, b), X41727), X41703 != X41712, domdomain(4, X41708), domdomain(2, X41711), domdomain(2, X41712), movetimedomain(X41727), domdomain(2, X41702), domdomain(2, X41703).
true(control1(xplayer), X41710 + 1) :- true(control2(oplayer), X41710), movetimedomain(X41710).
true(control1(oplayer), X41710 + 1) :- true(control2(xplayer), X41710), movetimedomain(X41710).
true(control2(xplayer), X41710 + 1) :- true(control1(xplayer), X41710), movetimedomain(X41710).
true(control2(oplayer), X41710 + 1) :- true(control1(oplayer), X41710), movetimedomain(X41710).
open(X41708) :- true(cell(X41704, X41705, b), X41708), domdomain(2, X41704), domdomain(2, X41705), timedomain(X41708).
legal(X41700, mark(X41703, X41704), X41720) :- true(cell(X41703, X41704, b), X41720), true(control1(X41700), X41720), timedomain(X41720), domdomain(4, X41700), domdomain(2, X41703), domdomain(2, X41704).
legal(xplayer, noop, X41709) :- true(control1(oplayer), X41709), timedomain(X41709).
legal(oplayer, noop, X41709) :- true(control1(xplayer), X41709), timedomain(X41709).
legal(X41700, mark(X41703, X41704), X41720) :- true(cell(X41703, X41704, b), X41720), true(control2(X41700), X41720), timedomain(X41720), domdomain(4, X41700), domdomain(2, X41703), domdomain(2, X41704).
legal(xplayer, noop, X41709) :- true(control2(oplayer), X41709), timedomain(X41709).
legal(oplayer, noop, X41709) :- true(control2(xplayer), X41709), timedomain(X41709).
goal(xplayer, 100, X41707) :- line(x, X41707), timedomain(X41707).
goal(xplayer, 50, X41719) :- not line(x, X41719), not line(o, X41719), not open(X41719), timedomain(X41719).
goal(xplayer, 0, X41707) :- line(o, X41707), timedomain(X41707).
goal(oplayer, 100, X41707) :- line(o, X41707), timedomain(X41707).
goal(oplayer, 50, X41719) :- not line(x, X41719), not line(o, X41719), not open(X41719), timedomain(X41719).
goal(oplayer, 0, X41707) :- line(x, X41707), timedomain(X41707).
terminal(X41704) :- line(x, X41704), timedomain(X41704).
terminal(X41704) :- line(o, X41704), timedomain(X41704).
terminal(X41704) :- not open(X41704), timedomain(X41704).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X41700, X41749) :- true(cell(X41700, X41707, X41700), X41749), true(cell(X41700, X41715, X41700), X41749), true(cell(X41700, X41723, X41700), X41749), true(cell(X41700, X41731, X41700), X41749), succ(X41707, X41715), succ(X41715, X41723), succ(X41723, X41731), domdomain(9, X41723), domdomain(10, X41731), domdomain(9, X41715), domdomain(10, X41723), domdomain(9, X41707), domdomain(10, X41715), domdomain(2, X41731), domdomain(2, X41723), domdomain(2, X41715), domdomain(2, X41700), domdomain(2, X41707), domdomain(3, X41700), timedomain(X41749), domdomain(8, X41700).
line(X41699, X41748) :- true(cell(X41705, X41706, X41699), X41748), true(cell(X41713, X41706, X41699), X41748), true(cell(X41721, X41706, X41699), X41748), true(cell(X41729, X41706, X41699), X41748), succ(X41705, X41713), succ(X41713, X41721), succ(X41721, X41729), domdomain(9, X41721), domdomain(10, X41729), domdomain(9, X41713), domdomain(10, X41721), domdomain(9, X41705), domdomain(10, X41713), domdomain(2, X41729), domdomain(2, X41721), domdomain(2, X41713), domdomain(2, X41705), domdomain(2, X41706), domdomain(3, X41699), timedomain(X41748), domdomain(8, X41699).
domdomain(1, cell).
domdomain(1, control1).
domdomain(1, control2).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(2, 4).
domdomain(3, b).
domdomain(3, o).
domdomain(3, x).
domdomain(4, oplayer).
domdomain(4, xplayer).
domdomain(5, 0).
domdomain(5, 50).
domdomain(5, 100).
domdomain(6, cell).
domdomain(6, control1).
domdomain(7, mark).
domdomain(7, noop).
domdomain(8, 1).
domdomain(8, 2).
domdomain(8, 3).
domdomain(8, 4).
domdomain(8, b).
domdomain(8, o).
domdomain(8, x).
domdomain(9, 1).
domdomain(9, 2).
domdomain(9, 3).
domdomain(10, 2).
domdomain(10, 3).
domdomain(10, 4).
