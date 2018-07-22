% Parameters
%%%%%%%%%%%
int: n = 4;                      % How many squares do we have?
set of int: SQUARES = 1..n;  % Set of the available squares

% Variables
%%%%%%%%%%%
int: maxSize = sum([i | i in SQUARES]);
int: minArea = sum([i*i | i in SQUARES]);
var n..maxSize: height;    % height of the container
var n..maxSize: width;     % width of the conainer
var minArea..n*maxSize: area = height * width; % container's area
array[SQUARES] of var 0..maxSize-1: x; % squares' coordinates in the container
array[SQUARES] of var 0..maxSize-1: y; % squares' coordinated in the container
  

% Constraints 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Constraint 1: Squares should fit inside the container

constraint forall(i in SQUARES) (x[i] + i <= width);
constraint forall(i in SQUARES) (y[i] + i <= height);
  
% Constraint 2: Squares should not overlap

constraint forall(i,j in SQUARES where i < j) 
                 (x[i] >= x[j] + j \/ x[j] >= x[i] + i \/
                  y[i] >= y[j] + j \/ y[j] >= y[i] +i);
                 

array[1..N] of var 0..maxSize : revX = reverse(X);
array[1..N] of var 0..maxSize : revY = reverse(Y);

array[1..N] 

[height, width]
[]

set_search([int_search(...),int_search()] 

)

% Goal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
solve minimize area; 
  
  
% Boring output  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
output [ show(i) ++ " > (" ++ show(x[i]) ++ "," ++ show(y[i]) ++ ")\n" | i in 1..n] ++
  ["area = " ++ show(width) ++ " * " ++ show(height) ++ " = " ++ show(area)]