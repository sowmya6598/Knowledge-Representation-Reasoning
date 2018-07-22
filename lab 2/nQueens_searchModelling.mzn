include "globals.mzn";

int: N = 5;

array[1..N] of var 1..N: q;

constraint forall (i in 1..N, j in i+1..N) (q[i] != q[j]);
constraint forall (i in 1..N, j in i+1..N) (q[i] != q[j]+j-i);
constraint forall (i in 1..N, j in i+1..N) (q[i] != q[j]-(j-i));

solve :: int_search(q, input_order, indomain_max, complete) satisfy;

output [ if fix(q[j]) == i then "H" else "." endif ++
  if j == N then "\n" else "" endif | i,j in 1..N]
    