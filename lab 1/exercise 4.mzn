int: menu_length;
int: maxmoney_limit ;

array[1..menu_length] of int: menu_prices ;
array[1..menu_length] of string: menu_names ;

array[1..menu_length] of var int: order;

array[1..menu_length] of int: yumyum_factors;

constraint forall([order[i] >= 0 | i in 1..menu_length]);
constraint sum([order[i] * menu_prices[i] | i in 1..menu_length]) <= maxmoney_limit;

solve maximize sum([order[i] * yumyum_factors[i] | i in 1..menu_length])

output [menu_names[i] ++ ": " ++ show(order[i]) ++ " " ++ show( yumyum_factors[i]) ++ "\n" | i in 1..menu_length];
