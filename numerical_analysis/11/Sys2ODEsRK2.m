function [x, y, z] = Sys2ODEsRK2(ODE1,ODE2,a,b,h,yINI,zINI)
% Sys2ODEsRK4 solves a system of two first-order initial value ODEs using
% second-order Ronge-Kutta method.
% The independent variable is x, and the dependent variables are y and z.
% Input variables:
% ODE1   Name of a function file that calculates dy/dx.
% ODE2   Name of a function file that calculates dz/dx.
% a      The first value of x.
% b      The last value of x.
% h      The size of a increment.
% yINI     The initial value of y.
% zINI     The initial value of z.
% Output variable:
% x      A vector with the x coordinate of the solution points.
% y      A vector with the y coordinate of the solution points.
% z      A vector with the z coordinate of the solution points.

x(1) = a; y(1) = yINI;  z(1) = zINI;
N = (b - a)/h;
for i = 1:N
    x(i+1) = x(i) + h;
    Ky1 = ODE1(x(i),y(i),z(i));
    Kz1 = ODE2(x(i),y(i),z(i));
    Ky2 = ODE1(x(i+1),y(i)+Ky1*h,z(i)+Kz1*h);
    Kz2 = ODE2(x(i+1),y(i)+Ky1*h,z(i)+Kz1*h);
    y(i+1) = y(i) + (Ky1 + Ky2)*h/2;
    z(i+1) = z(i) + (Kz1 + Kz2)*h/2;
end