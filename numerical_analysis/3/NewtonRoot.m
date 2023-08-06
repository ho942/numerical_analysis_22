function Xs = NewtonRoot(Fun,FunDer,Xest,Err,imax)
% NewtonRoot finds the root of Fun = 0 near the point Xest using Newton's method.
% Input variables:
% Fun    Handle of a user-defined function that calculates Fun for a given x.
% FunDir Handle of a user-defined function that calculates the derivative
%        of Fun for a given x.
% Xest   Initial estimate of the solution.
% Err    Maximum error.
% imax   Maximum number of iterations
% Output variable:
% Xs     Solution

for i = 1:imax
    Xi = Xest - Fun(Xest)/FunDer(Xest);
    disp(sprintf('At iter = %d, X_NS = %20.16f',i,Xi))
    if abs((Xi - Xest)/Xest) < Err
        Xs = Xi; 
        break
    end
    Xest = Xi;
end
if i == imax
    fprintf('Solution was not obtained in %i iterations.\n',imax)
    Xs = ('No answer');
end