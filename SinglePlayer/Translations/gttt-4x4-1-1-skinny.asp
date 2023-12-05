movetimedomain(1..15).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X37227, X37228, b)) :- index(X37227), index(X37228), domdomain(2, X37227), domdomain(2, X37228).
base(cell(X37227, X37228, x)) :- index(X37227), index(X37228), domdomain(2, X37227), domdomain(2, X37228).
base(cell(X37227, X37228, o)) :- index(X37227), index(X37228), domdomain(2, X37227), domdomain(2, X37228).
base(control(X37227)) :- role(X37227), domdomain(4, X37227).
input(X37225, mark(X37228, X37229)) :- index(X37228), index(X37229), role(X37225), domdomain(4, X37225), domdomain(2, X37228), domdomain(2, X37229).
input(X37225, noop) :- role(X37225), domdomain(4, X37225).
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
true(control(xplayer), 1).
true(cell(X37227, X37228, x), X37247 + 1) :- does(xplayer, mark(X37227, X37228), X37247), true(cell(X37227, X37228, b), X37247), movetimedomain(X37247), domdomain(2, X37227), domdomain(2, X37228).
true(cell(X37227, X37228, o), X37247 + 1) :- does(oplayer, mark(X37227, X37228), X37247), true(cell(X37227, X37228, b), X37247), movetimedomain(X37247), domdomain(2, X37227), domdomain(2, X37228).
true(cell(X37227, X37228, X37229), X37244 + 1) :- true(cell(X37227, X37228, X37229), X37244), X37229 != b, movetimedomain(X37244), domdomain(2, X37227), domdomain(2, X37228), domdomain(3, X37229).
true(cell(X37227, X37228, b), X37252 + 1) :- does(X37233, mark(X37236, X37237), X37252), true(cell(X37227, X37228, b), X37252), X37227 != X37236, domdomain(4, X37233), domdomain(2, X37236), domdomain(2, X37237), movetimedomain(X37252), domdomain(2, X37227), domdomain(2, X37228).
true(cell(X37227, X37228, b), X37252 + 1) :- does(X37233, mark(X37236, X37237), X37252), true(cell(X37227, X37228, b), X37252), X37228 != X37237, domdomain(4, X37233), domdomain(2, X37236), domdomain(2, X37237), movetimedomain(X37252), domdomain(2, X37227), domdomain(2, X37228).
true(control(xplayer), X37235 + 1) :- true(control(oplayer), X37235), movetimedomain(X37235).
true(control(oplayer), X37235 + 1) :- true(control(xplayer), X37235), movetimedomain(X37235).
open(X37233) :- true(cell(X37229, X37230, b), X37233), domdomain(2, X37229), domdomain(2, X37230), timedomain(X37233).
legal(X37225, mark(X37228, X37229), X37245) :- true(cell(X37228, X37229, b), X37245), true(control(X37225), X37245), timedomain(X37245), domdomain(4, X37225), domdomain(2, X37228), domdomain(2, X37229).
legal(xplayer, noop, X37234) :- true(control(oplayer), X37234), timedomain(X37234).
legal(oplayer, noop, X37234) :- true(control(xplayer), X37234), timedomain(X37234).
goal(xplayer, 100, X37232) :- line(x, X37232), timedomain(X37232).
goal(xplayer, 50, X37244) :- not line(x, X37244), not line(o, X37244), not open(X37244), timedomain(X37244).
goal(xplayer, 0, X37232) :- line(o, X37232), timedomain(X37232).
goal(oplayer, 100, X37232) :- line(o, X37232), timedomain(X37232).
goal(oplayer, 50, X37244) :- not line(x, X37244), not line(o, X37244), not open(X37244), timedomain(X37244).
goal(oplayer, 0, X37232) :- line(x, X37232), timedomain(X37232).
terminal(X37229) :- line(x, X37229), timedomain(X37229).
terminal(X37229) :- line(o, X37229), timedomain(X37229).
terminal(X37229) :- not open(X37229), timedomain(X37229).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X37225, X37274) :- true(cell(X37225, X37232, X37225), X37274), true(cell(X37225, X37240, X37225), X37274), true(cell(X37225, X37248, X37225), X37274), true(cell(X37225, X37256, X37225), X37274), succ(X37232, X37240), succ(X37240, X37248), succ(X37248, X37256), domdomain(8, X37248), domdomain(9, X37256), domdomain(8, X37240), domdomain(9, X37248), domdomain(8, X37232), domdomain(9, X37240), domdomain(2, X37256), domdomain(2, X37248), domdomain(2, X37240), domdomain(2, X37225), domdomain(2, X37232), domdomain(3, X37225), timedomain(X37274), domdomain(7, X37225).
line(X37224, X37273) :- true(cell(X37230, X37231, X37224), X37273), true(cell(X37238, X37231, X37224), X37273), true(cell(X37246, X37231, X37224), X37273), true(cell(X37254, X37231, X37224), X37273), succ(X37230, X37238), succ(X37238, X37246), succ(X37246, X37254), domdomain(8, X37246), domdomain(9, X37254), domdomain(8, X37238), domdomain(9, X37246), domdomain(8, X37230), domdomain(9, X37238), domdomain(2, X37254), domdomain(2, X37246), domdomain(2, X37238), domdomain(2, X37230), domdomain(2, X37231), domdomain(3, X37224), timedomain(X37273), domdomain(7, X37224).
domdomain(1, cell).
domdomain(1, control).
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
domdomain(6, mark).
domdomain(6, noop).
domdomain(7, 1).
domdomain(7, 2).
domdomain(7, 3).
domdomain(7, 4).
domdomain(7, b).
domdomain(7, o).
domdomain(7, x).
domdomain(8, 1).
domdomain(8, 2).
domdomain(8, 3).
domdomain(9, 2).
domdomain(9, 3).
domdomain(9, 4).
