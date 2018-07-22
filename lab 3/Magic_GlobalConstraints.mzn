include "globals.mzn";

int: n = 5;

array[0..n-1] of var 0..n-1: magic;
  
constraint
   global_cardinality(magic,array1d(0..n-1, set2array(index_set(magic))), magic) :: domain
;
  
solve satisfy;
  
output [ "magic sequence = ", show(magic),";\n"];