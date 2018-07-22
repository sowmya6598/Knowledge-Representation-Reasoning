% include "globals.mzn";

%%%%%%%%%%%%%
% PARAMETERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Should be loaded from the data file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%%%%%%%%%%%% 
% VARIABLES         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variables with correct domains          
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\

int: nodesNumber;
array[1..nodesNumber, 1..nodesNumber] of bool: edges;

array[1..nodesNumber] of var 1..nodesNumber: nodes;
var 1..nodesNumber: colorsNumber = max(nodes);

%%%%%%%%%%%%%%%%
% CONSTRAINTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% tip:
% - number of used colors = the highest used color number                     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

constraint forall(i,j in 1..nodesNumber where edges[i,j])(nodes[i] != nodes[j]);

%%%%%%%%
% GOAL  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Minimize the number of used colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
solve minimize colorsNumber;

%%%%%%%%%%%%%%%%%%%%%%%%
% OUTPUT EXAMPLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - colorsNumber - number of used colors
% - nodes - array of vertices with assigned colors                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
output [show(colorsNumber), " colors\n",] ++
       [show(nodes[i]) ++ " " | i in 1..nodesNumber]
       
