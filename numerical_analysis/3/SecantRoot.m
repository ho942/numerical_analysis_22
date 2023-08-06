function Xs = SecantRoot(Fun,Xa,Xb,Err,imax)
% SecantRoot finds the root of Fun = 0 using the Secant method.
% Input variables:
% Fun    Name of a user-defined function that calculates Fun for a given x.
% a, b   Two points in the neighborhood of the root (on either side, or the
%        same side of the root).
% Err    Maximum error.
% imax   Maximum number of iterations
% Output variable:
% Xs     Solution

for i = 1:imax
    FunXb = Fun(Xb);
    Xi = Xb - FunXb*(Xa-Xb)/(Fun(Xa)-FunXb);
    disp(sprintf('At iter = %d, X_NS = %20.16f',i,Xi))
    if abs((Xi - Xb)/Xb) < Err
        Xs = Xi;
        break
    end
    Xa = Xb;
    Xb = Xi;
end
if i == imax
    fprintf('Solution was not obtained in %i iterations.\n',imax)
    Xs = ('No answer');    
end