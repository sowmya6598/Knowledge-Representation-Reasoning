include "globals.mzn";

int: N = 5;

array[1..N] of var 1..N: q;

constraint alldifferent(q);
constraint forall(i in 1..N, j in i+1..N)(j-1 != abs(q[i]-q[j]));
  
solve satisfy; 

output [ if fix(q[j]) == i then "H" else "." endif ++
  if j == N then "\n" else "" endif | i,j in 1..N]
    