function x = Tridiagonal(A,B)
% The function solve a tridiagonal system of linear equations [a][x]=[b]
% using Thomas algorithm.
% Input variables:
% A  The matrix of coefficients.
% B  A column vector of constants.
% Output variable:
% x  A colum vector with the solution.

[nR, nC] = size(A);
for i = 1:nR
    d(i) = A(i,i);
end
for i = 1:nR-1
    ad(i) = A(i,i+1); % above diagonal elements
end
for i = 2:nR
    bd(i) = A(i,i-1); % below diagonal elements
end
ad(1) = ad(1)/d(1);
B(1) = B(1)/d(1); % step 2 of week05_2 10p
for i = 2:nR-1
    ad(i) = ad(i)/(d(i)-bd(i)*ad(i-1));
    B(i)=(B(i)-bd(i)*B(i-1))/(d(i)-bd(i)*ad(i-1)); % step 3 of week05_2 10p
end
B(nR)=(B(nR)-bd(nR)*B(nR-1))/(d(nR)-bd(nR)*ad(nR-1)); % step 4 of week05_2 10p
x(nR,1) = B(nR);
for i = nR-1:-1:1
    x(i,1) = B(i)-ad(i)*x(i+1);
end % step 5 of week05_2 10p