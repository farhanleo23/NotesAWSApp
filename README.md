Grocery mart



inventory(pecs, [[milk, 355], [bread, 500], [butter, 299], [eggs, 599]]).
inventory(budapest, [[milk, 355], [bread,500], [butter, 299], [eggs, 599], [bananas,700]]).
inventory(gyor, [[milk, 355], [bread,500]]).
inventory(szeged, [[milk, 355], [bread,500], [eggs, 599]]).

city([pecs, budapest, gyor, szeged]).

priceOfProduct(City, Product, Price):- inventory(City, ProductInfo), member([Product, Price], ProductInfo).

%sales(PRODUCT, CITY, PRICE, DATE, CUSTOMER)



:-dynamic sales/5.

displayMenu :- writeln("**********************************\n--------- Sally's Grocery Store -----------\n**********************************\n").

selectCity(City) :- city(X), writeln(X), writeln("Select city"), read(City).

enterNameandDate(Customer, Date) :- writeln("Enter Date(YYYYMMDD)"), read(Date), writeln("Enter your name: "), read(Customer).

buying(City, Product, Date, Customer, Price) :- inventory(City, Products), writeln(Products), writeln("Select Product"), read(Product), priceOfProduct(City, Product, Price), writef("It costs %w Ft. \n", [Price]), assert(sales(Product, City, Price, Date, Customer)).


start :- displayMenu, selectCity(City), enterNameandDate(Customer, Date), buying(City, Product, Product, Customer, Price), writeln("Continue shopping (y or n)"), read(Decision), (Decision == y -> start; Decision == n -> writeln("Thank you for shopping with us"); write('\nInvalid Input!!!\n'),fail).


%STATISTICS

%City with most sales
citySales(City, S) :- bagof(Price, Product^Date^Customer^sales(Product, City, Price, Date, Customer), SL), sum(SL, S), assert(cityRevenue(City, S)).

sortbyCityRevenue(Output) :- findall([X,Y],cityRevenue(X,Y),List),
sort(2, @>, List, OrderedList),
Output = OrderedList.

% Returns Number of Transactions by city
cityTrans(City, N) :- bagof(Price, Product^Date^Customer^sales(Product, City, Price, Date, Customer), SL), length(SL, N), assert(cityTransactions(City, N)).

% Returns Number of each product sold
productTrans(Product, N) :- bagof(Price, City^Date^Customer^sales(Product, City, Price, Date, Customer), SL), length(SL, N).


% Customers and money spent
customersSales(Customer, S) :- bagof(Price, Product^Date^City^sales(Product, City, Price, Date, Customer), SL), sum(SL, S), assert(custSales(Customer, S)).

sortbyCustomerSpending(Output) :- findall([X,Y],custSales(X,Y),List),
sort(2, @>, List, OrderedList),
Output = OrderedList.



sum([], 0).
sum([H|T], S) :- sum(T, S1), S is S1 + H.


