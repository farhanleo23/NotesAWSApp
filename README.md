1). (Armstrong number)
armstrongNum(N) :-
	between(1,9,A), between(0,9,B), between(0,9,C),
	N is 100*A+10*B+C,
	A**3+B**3+C**3 =:= N.

2). (Rectangle)
between(1,100,A),
	between(1,100,B),
	between(1,100,C),
	A+B+C =:= 84,
	A**2+B**2 =:= C**2.

3). (finding nth term)
nth(X, 1,[X|_]).
nth(X, K, [_|L]) :- nth(X, K1, L),
    K is K1 + 1.
    
    to check
    nth(X,3,[3,2,4,5]).

