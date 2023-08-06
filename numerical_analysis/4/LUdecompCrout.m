function [L, U] = LUdecompCrout(A)
% The function decomposes the matrix A into a lower triangular matrix L 
% and an upper triangular matrix U, using Crout's method such that A=LU.
% Input variables:
% A  The matrix of coefficients.
% Output variable:
% L  Lower triangular matrix.
% U  Upper triangular matrix.

[R, C] = size(A);
for i = 1:R
    L(i,1) = A(i,1); % step 1 of week4_3 p7
    U(i,i) = 1; % step 2 of week4_3 p7
end
for j = 2:R
    U(1,j)= A(1,j)/L(1,1); % step 3 of week4_3 p7
end
for i = 2:R % step 4 of week4_3 p7
    for j = 2:i
        L(i,j)=A(i,j)-L(i,1:j-1)*U(1:j-1,j);
    end
    for j = i+1:R
        U(i,j)=(A(i,j)-L(i,1:i-1)*U(1:i-1,j))/L(i,i);
    end
end