%%%%%%%%%%%%%% 
% PARAMETERS        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Length of the sequence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

include "globals.mzn";

int: n = 5;

%%%%%%%%%%%%%% 
% VARIABLES        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The sequence itself
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

array[0..n-1] of var 0..n-1: magic;
  
%%%%%%%%%%%%%%%
% Constraints 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tips:                                 
% - sum(array) return sum of the array's elements 
% - you can use bool's like integers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

constraint
   global_cardinality(magic,array1d(0..n-1, set2array(index_set(magic))), magic) :: domain
;
  
solve satisfy;
  
%%%%%%%%%%%%%%%%%%%%%%%%
% EXAMPLE OUTPUT  
%%%%%%%%%%%%%%%%%%%%%%%%
% - magic - magic sequence     
%%%%%%%%%%%%%%%%%%%%%%%%
output [ "magic sequence = ", show(magic),";\n"];