role(xplayer). 
role(oplayer).
init(cell(a,1,blank)). 
init(cell(a,2,blank)).
init(cell(a,3,blank)). 
init(cell(b,1,blank)).
init(cell(b,2,blank)). 
init(cell(b,3,blank)).
init(cell(c,1,blank)). 
init(cell(c,2,blank)).
init(cell(c,3,blank)).
init(control(xplayer)).


legal(P, mark(X, Y)) :- true(control(P)), true(cell(X, Y, blank)).
legal(P, noop) :- role(P), not(true(control(P))).


next(control(oplayer)) :- true(control(xplayer)).
next(control(xplayer)) :- true(control(oplayer)).
next(cell(M,N,x)) :- does(xplayer, mark(M , N)).
next(cell(M,N,o)) :- does(oplayer, mark(M , N)).
next(cell(M,N,C)) :- true(cell(M,N,C)), does(P, mark(X , Y)), X \= M.
next(cell(M ,N , C)) :- true(cell(M,N,C)), does(P, mark(X, Y)), Y \= N.
terminal :- line(x).
terminal :- line(o).
terminal :- not(open).
line(P) :- true(cell(a ,Y , P)), true(cell(b ,Y , P)), true(cell(c, Y, P)).
line(P) :- true(cell(X, 1, P)), true(cell(X,2,P)), true(cell(X,3,P)).
line(P) :- true(cell(a ,1 , P)), true(cell(b,2,P)), true(cell(c,3,P)).
line(P) :- true(cell(a ,3 , P)), true(cell(b ,2 , P)),true(cell(c ,1 , P)).
open :- true(cell(X,Y,blank)).
goal(xplayer ,100) :- line(x).
goal(xplayer ,50) :- not(line(x)), not(line(o)).
goal(xplayer ,0) :- line(o).
goal(oplayer ,100) :- line(o).
goal(oplayer ,50) :- not(line(x)), not(line(o)).
goal(oplayer ,0) :- line(x).
