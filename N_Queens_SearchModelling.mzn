include "globals.mzn";

%%%%%%%%%%%%% 
% VARIABLES 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% add variables with correct domains 
% tip:                       
% var 1..N: x; declares a variable with domain 1..N   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

int: N = 5;

array[1..N] of var 1..N: q;

%%%%%%%%%%%%%
% CONSTRAINTS 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% add constraints
% tip:
% row_i = row_j (-/+) (j - i)                 
% matches queens placed on the same diagonal, where:
% - i,j - column index
% - row_n - queen's position in the nth col 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%constraint alldifferent(q);
%constraint forall(i,j in 1..N where i<j)(j-1 != abs(q[i]-q[j]));

constraint forall (i in 1..N, j in i+1..N) (q[i] != q[j]);
constraint forall (i in 1..N, j in i+1..N) (q[i] != q[j]+j-i);
constraint forall (i in 1..N, j in i+1..N) (q[i] != q[j]-(j-i));

solve :: int_search(q, input_order, indomain_max, complete) satisfy;

  
%%%%%%%%%%%%%%%%%%%
% OUTPUT EXAMPLE  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - rows[i] - queen's position in the ith row 
% - N - number of queens                     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

output [ if fix(q[j]) == i then "H" else "." endif ++
  if j == N then "\n" else "" endif | i,j in 1..N]
    