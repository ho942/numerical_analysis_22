function Yint = LagrangeINT(x,y,Xint)
% LagrangeINT fits a Lagrange polynomial to a set of given points and
% uses the polynomial to determines the interpolated value of a point.
% Input variables:
% x  A vector with the x coordinates of the given points.
% y  A vector with the y coordinates of the given points.
% Xint  The x coordinate of the point to be interpolated.
% Output variable:
% Yint  The interpolated value of Xint.

n = length(x);
for i = 1:n % yi의 계수를 하나씩 만드는 방식.
    L(i) = 1;
    for j = 1:n % j=i 제외하고 곱하여 Lagrange functions을 만듬.
        if j ~= i
            L(i)= L(i)*(Xint-x(j))/(x(i)-x(j)); % 해당 계수(yi의)를 만드는 과정.
        end
    end
end % L(i)를 계산
y.*L;
Yint = sum(y.*L); % interpolate 식 계산.