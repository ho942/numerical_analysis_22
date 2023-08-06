function [b m]=PowerFit(x,y)
% function that determines the best fit of a power function of the form y =
% bx^m to a given set of data points
% x, y : vectors with the coordinates of the data points
% b, m : the values of the coefficients

%log(y)=m*log(x)+log(b);

yl= log(y); xl=log(x);

%y = a1*x + a0 

[m,bl] = LinearRegression(xl, yl);
b = exp(bl);