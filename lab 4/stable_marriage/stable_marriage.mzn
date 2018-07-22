include "globals.mzn";

int: n;
set of int: men = 1..n;
set of int: women = 1..n;

% the lower the rank, the more preffered the person is
set of int: ranks = 1..n;

array[men] of string: m_names;
array[women] of string: w_names;

array[men, women] of ranks: w_ranks;
array[women, men] of ranks: m_ranks; 


predicate prefers_over(array[1..n, 1..n] of var 1..n: ranks, var 1..n: s, var 1..n: p1, var 1..n: p2) =
   ranks[p1, s] < ranks[p2, s];
   
predicate man_prefers_over(var men: m, var women: w1, var women: w2) = 
    prefers_over(m_ranks, m, w1, w2);

predicate woman_prefers_over(var women: w, var men: m1, var men: m2) = 
    prefers_over(w_ranks, w, m1, m2);


solve satisfy;

output [show(m_names[m]) ++ " ♥ " ++ show(w_names[fix(wives[m])]) ++ "\n" | m in men]; 