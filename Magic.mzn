%%%%%%%%%%%%%% 
% PARAMETERS        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Length of the sequence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
  forall(i in 0..n-1) (
    magic[i] = sum(j in 0..n-1) (bool2int(magic[j] = i))
  )
;
  
solve satisfy;
  
%%%%%%%%%%%%%%%%%%%%%%%%
% EXAMPLE OUTPUT  
%%%%%%%%%%%%%%%%%%%%%%%%
% - magic - magic sequence     
%%%%%%%%%%%%%%%%%%%%%%%%
output [ "magic sequence = ", show(magic)];
