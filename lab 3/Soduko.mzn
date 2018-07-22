%%%%%%%%%%%
% REMINDER 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% There's something missing here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

include "alldifferent.mzn";

%%%%%%%%%%%
% PARAMETERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initial state of the board
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

int: S = 3;
int: N = S * S;

%%%%%%%%%%% 
% VARIABLES  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% You know...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


set of int: PuzzleRange = 1..N;
set of int: SubSquareRange = 1..S;

array[1..N, 1..N] of 0..N: board;
array[1..N,1..N] of var PuzzleRange: puzzle;

%%%%%%%%%%%%%%%%
% Constraints 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - you know the sudoku rules
% - remember, that you have to preserve the initial state of the board  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

constraint forall(i,j in PuzzleRange)(
  if board[i,j] > 0 then puzzle[i,j] = board[i,j] else true endif );

constraint forall(i,j in PuzzleRange)(
  alldifferent([puzzle[i,j] | j in PuzzleRange]));

constraint forall(i,j in PuzzleRange)(
  alldifferent([puzzle[i,j] | i in PuzzleRange]));

constraint forall(a, o in SubSquareRange)(
  alldifferent([puzzle[(a-1) *S + a1, (o-1)*S + o1] | a1, o1 in SubSquareRange]));

solve satisfy;

%%%%%%%%%%%%%%%%%%%%
% OUTPUT EXAMPLE  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - puzzle - 2d array of nxn variables
% - N - size of the board, equal S*S         
% - S - size of a single sector            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

output [ show(puzzle[i,j]) ++ " " ++
  if j mod S == 0 then " " else "" endif ++ if j == N /\ i != N then
  if i mod S == 0 then "\n\n" else "\n" endif else "" endif
    | i,j in PuzzleRange ] ++ ["\n"];