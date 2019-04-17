1). (Armstrong number)
armstrongNum(N) :-
	between(1,9,A), between(0,9,B), between(0,9,C),
	N is 100*A+10*B+C,
	A**3+B**3+C**3 =:= N.
