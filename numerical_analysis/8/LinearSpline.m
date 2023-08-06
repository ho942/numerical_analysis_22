function Yint = LinearSpline(x, y, Xint)
% LinearSpline calculates interpolation using linear splines.
% Input variables:
% x    A vector with the coordinates x of the data points.
% y    A vector with the coordinates y of the data points.
% Xint The x coordinate of the interpolated point. 
% Output variable:
% Yint The y value of the interpolated point.

n = length(x);
for i = 2:n
    if Xint < x(i) % 이건 interpolation을 하려면 데이터 값들 사이여야하니까 이런 조건 넣은 듯. - for find the interval that includes Xint
        break
    end
end
Yint = (Xint - x(i))*y(i-1)/(x(i-1)-x(i)) + (Xint - x(i-1))*y(i)/(x(i)-x(i-1)); % week7_1 interpolation 13p 아래식. 1개씩 차수 내렸는 이유는 모르겠다.