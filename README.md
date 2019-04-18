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

4). (returns number of elemnts ).
count([], 0).
count([_|Tail], N) :- count(Tail, N1), N is N1 + 1.

5. (mileage of car).
readlist([Head|Tail]):- 
    writeln("Please type monthly mileage from jan to dec: "), 
    read(Head), dif(Head, stop), readlist(Tail).
readlist([]).

sum([], 0).
sum([Head|Tail], N) :- sum(Tail, N1), N is N1 + Head.

maxlist([X],X).
maxlist([X,Y|Tail],Max) :- maxlist([Y|Tail],MaxRest), 
    max(X,MaxRest,Max).

max(X,Y,X) :- X>=Y.
max(X,Y,Y) :- X<Y.

minlist([X],X).
minlist([X,Y|Tail],Min) :- minlist([Y|Tail],MinRest), 
    min(X,MinRest,Min).

min(X,Y,X) :- Y>=X.
min(X,Y,Y) :- X>Y.

index([H|T], H, 1) :- !.
index([_|T], H, Index) :-  index(T, H, Index1), !, Index is Index1+1.


month(1, jan).
month(2, feb).
month(3, mar).
month(4, apr).
month(5, may).
month(6, june).
month(7, july).
month(8, aug).
month(9, sep).
month(10, oct).
month(11, nov).
month(12, dec).

start :- readlist(List), sum(List, N), 
    write("The sum of the total mileage: "), writeln(N),
    maxlist(List, Max), minlist(List, Min), 
    index(List, Max, IMax), index(List, Min, IMin),
    month(IMax, MaxMonth), month(IMin, MinMonth),
    write("The maximum month: "), writeln(MaxMonth),
    write("The minimum month: "), writeln(MinMonth).
