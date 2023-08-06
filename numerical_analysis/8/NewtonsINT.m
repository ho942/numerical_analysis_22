function Yint = NewtonsINT(x,y,Xint)
% NewtonsINT fits a Newtons polynomial to a set of given points and
% uses the polynomial to determines the interpolated value of a point.
% Input variables:
% x  A vector with the x coordinates of the given points.
% y  A vector with the y coordinates of the given points.
% Xint  The x coordinate of the point to be interpolated.
% Output variable:
% Yint  The interpolated value of Xint.

%divDIF 의 column 1은 first(=1) divided difference (f[x2,x1]) 부터 시작임.=a2
n = length(x);
a(1) = y(1); % coeff 첫번째는 항상 y1=a1이니까. week07_1 10p
for i = 1:n-1
    divDIF(i,1) = (y(i+1)-y(i))/(x(i+1)-x(i)); % divDIF의 first column을 finite divided differences로 채움! 두 개 짜리 기울기 되는 형태인거! 이후 계산에 필요하니 미리 다 만듬.
end
for j = 2:n-1 %j : second divided difference 이상의 것들. 
    for i = 1:n-j % j=2일때 i= 1:n-2까지 돌림. j는 2~ n-1까지 크게 돌림.
        divDIF(i,j) = (divDIF(i+1,j-1) - divDIF(i,j-1))/(x(j+i) - x(i)); % x 뺄때 차이가 j만큼 나니까 더해서 빼도록 조치한 거임. (앞선 divided difference 차)/(처음과 끝 x차).week07_1 12p 그림 참고. 

    end
end
for j=2:n
    a(j)=divDIF(1,j-1); % a2~an에 할당! week07_1 12p 그림 처럼 각 column의 첫 row값 해당.
end
Yint=a(1); % 이후 interpolated과정.
xn=1;
for k=2:n
    xn=xn*(Xint-x(k-1)); % 각 항의 a(i)랑 곱해지는 x 파트 제작 term.
    Yint=Yint+a(k)*xn; % 각 항의 온전한 항 제작. week07_1 12p 하단 식 참조.
end