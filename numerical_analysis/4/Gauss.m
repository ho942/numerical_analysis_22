function x = Gauss(a,b)
% The function solve a system of linear equations [a][x]=[b] using the Gauss
% elimination method.
% Input variables:
% a  The matrix of coefficients.
% b  A column vector of constants.
% Output variable:
% x  A colum vector with the solution.

ab = [a,b];
[R, C] = size(ab);
% Forward elimination - upper triangle
for j = 1:R-1 % j는 column을 맡음. 기준이 됨.
    for i = j+1:R % i는 row를 맡음. 나머지를 0으로 만드는 역할. 
        ab(i,j:C) = ab(i,j:C)-ab(i,j)/ab(j,j)*ab(j,j:C); % 빼서 0으로 만듬. j부터 C까지.
    end
end

% Backward substitution
x = zeros(R,1);
x(R) = ab(R,C)/ab(R,R); % 마지막 x값은 정해졌으니. 
for i = R-1:-1:1 % backward 이므로 큰 값부터 거꾸로 계산함@
    x(i)=(ab(i,C)-ab(i,i+1:R)*x(i+1:R))/ab(i,i);
end