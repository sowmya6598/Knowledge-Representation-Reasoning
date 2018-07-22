int: n = 5;

array[0..n-1] of var 0..n-1: magic;

constraint
  forall(i in 0..n-1) (
    magic[i] = sum(j in 0..n-1) (bool2int(magic[j] = i))
  )
;
  
solve satisfy;
  
output [ "magic sequence = ", show(magic)];
