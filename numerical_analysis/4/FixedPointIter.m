function Xs = FixedPointIter(Fun, x0, ErrMax, iterMax)
% FixedPointIter is fixed point iteration method function.
% Xs : solution
% Fun : input argument for function g that calculate c=g(c)
% x0 : initial guess
% ErrMax : maximum estimated relative error
% iterMax : maximum iteration number

for i = 1 : iterMax
    x1= Fun(x0);
%     fprintf('x%d = %.4f\n', i, x1)
    if i>1
        RelErr = abs((x1-x0)/x0);
        x0 = x1;
        fprintf('iteration : x%d  numerical solution : %.4f\t RelErr : %11.6f\n', i, x1,RelErr)
        if RelErr < ErrMax
            break;
        end
    else
        x0 = x1;
        fprintf('iteration : x%d  numerical solution : %.4f\t\n', i, x1)
    end
    if i == iterMax
    error('Error: Solution was no obtained in %i iteration',imax)
    'No answer'
    end
end
    end

