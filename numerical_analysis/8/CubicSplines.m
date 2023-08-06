function Yint = CubicSplines(x,y,xint)
%function for interpolation with natural cubic splines
% x, y : vectors with the coordinates of the data points
% xint : x coordinate of the interpolated point
% Yint : y value of the interpolated point

% xint가 사이인지 판별하는 식 넣어야!
[xr,xs]= size(x);
[yr,ys]= size(y);

if xint < x(1) 
    error("interpolation must be operated among the data")
elseif xint > x(xs)
    error("interpolation must be operated among the data")
end
% xint가 사이인지 판별하는 식.

if xs~= ys %check corresponding datas are valid
    error("some data is missing") 
else
    h=zeros(xs-1); hy=zeros(xs-1);% simplifed form
    for i = 1:xs-1 % xs-1개 만듬.
        h(i)= x(i+1)-x(i); 
        hy(i)= y(i+1)-y(i); % 계산 편의를 위해 y의 차이도 배정
    end

    A= zeros(xs-2,xs-2); 
    b= zeros(xs-2,1);
    % 계산을 위한 matrix 만들기
    A(1,1)=2*(h(1)+h(2));
    A(1,2)=h(2);
    A(xs-2,xs-3)=h(xs-2);
    A(xs-2,xs-2)=2*(h(xs-2)+h(xs-1));
    for i = 2:xs-3
        A(i,i-1)= h(i);
        A(i,i)=2*(h(i)+h(i+1));
        A(i,i+1)=h(i+1);
    end
    for i=1:xs-2
        b(i)= 6*((hy(i+1)/h(i+1))-(hy(i)/h(i)));
    end

    a_tempt = A\b; % a2~an-1 구함.
    a=zeros(xs,1); 
    for i=2:xs-1
        a(i)=a_tempt(i-1);
    end

    % 위 과정을 통해 natural cubic spline 의 column vector for second derivative of polynomial at point를
    % 구함.

    %이후 주어진 xint에 해당하는 값 구하기
    for i = 1 : xs-1
        if xint<= x(i+1) % interval에서 연속이므로
            xlo= i; % 사용할 interval 찾기
            break
        end
    end

    f1 = (a(xlo)/(6*h(xlo)))*(x(xlo+1)-xint)^3;

    f2= (a(xlo+1)/(6*h(xlo)))* (xint-x(xlo))^3;
    
    f3= ((y(xlo)/h(xlo))-(a(xlo)*h(xlo)/6))*(x(xlo+1)-xint);

    f4= ((y(xlo+1)/h(xlo))-(a(xlo+1)*h(xlo)/6))*(xint-x(xlo));
    
    %각 계산 term 으로 최종 interpolated 값 구하기
    Yint= f1+f2+f3+f4;

           

end



