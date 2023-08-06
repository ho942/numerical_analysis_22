function c = CondNumb_Inf(A)
% function that calculate the condition number of an (nxn) matrix by using
% the infinity norm
% A : matrix
% c : value of the condition number

c= InfinityNorm(A)*InfinityNorm(Inverse(A));
