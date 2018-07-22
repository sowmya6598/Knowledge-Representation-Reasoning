include "diffn.mzn";
include "cumulative.mzn";

int: n = 5;                              % How many squares do we have?
set of int: SQUARES = 1..n;               % Set of the available squares
int: min = n;                             % Minimal length is dimention of biggest square
int: max = sum(1..n);                     % Worst case scenario is when all squares lay next to each other

var min..max: height;                     % height of the container
var min..max: width;                      % width of the conainer
var (min*min)..(max*max): area = height * width;      % container's area
array[SQUARES] of var 0..max-1: x;      % squares' coordinates in the container
array[SQUARES] of var 0..max-1: y;      % squares' coordinated in the container
  

% Constraint 1: Squares should fit inside the container
constraint forall(i in SQUARES)(x[i] + i <= width /\ y[i] + i <= height /\ x[i] >= 0 /\ y[i] >= 0);
constraint area >= sum([x[i] * y[i] | i in SQUARES]);

constraint diffn(x, y, 1..n, 1..n);
constraint cumulative(x, 1..n, 1..n, height);
constraint cumulative(y, 1..n, 1..n, width);

solve minimize area; 
  
output [ show(i) ++ " > (" ++ show(x[i]) ++ "," ++ show(y[i]) ++ ")\n" | i in 1..n] ++
  ["area = " ++ show(width) ++ " * " ++ show(height) ++ " = " ++ show(area)]