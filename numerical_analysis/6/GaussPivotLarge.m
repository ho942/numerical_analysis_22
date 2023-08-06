function x = GaussPivotLarge(a,b)
% The function solve a system of linear equations ax=b using the Gauss
% elimination method with pivoting.
% has a pivot element with the largest absolute numerical value.
% Input variables:
% a  The matrix of coefficients.
% b  A column vector of constants.
% Output variable:
% x  A colum vector with the solution.

ab = [a,b];
[R, C] = size(ab);
for j = 1:R-1
% Pivoting section starts
    if ab(j,j)==0
        for k=j+1:R
            if abs(ab(k,j))==max(abs(ab(j+1:R,j))) % pivot element with the largest absolute value
                abTemp=ab(j,:);
                ab(j,:)=ab(k,:);
                ab(k,:)=abTemp;
                break
            end
        end
    end
% Pivoting section ends
    for i = j+1:R
        ab(i,j:C) = ab(i,j:C)-ab(i,j)/ab(j,j)*ab(j,j:C);
    end
end
x = zeros(R,1);
x(R) = ab(R,C)/ab(R,R);
for i = R-1:-1:1
    x(i)=(ab(i,C)-ab(i,i+1:R)*x(i+1:R))/ab(i,i);
end