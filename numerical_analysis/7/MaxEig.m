function e = MaxEig(A)
%function that determines the largetst eigenvalue of an (nxn) matrix by
%using power method
% A : matrix
% e : value of the largest eigenvalue
[r,c]=size(A);
iterMax=100;
tol=0.000001; %target tolerance = 1e-6
x = ones(r,iterMax);
for i = 1:iterMax
    x(1:r,i+1)=(A*x(1:r,i))./max(A*x(1:r,i));
    a=x(1:r,i+1)-x(1:r,i);
%     disp(max(A*x(1:r,i)))
%    disp(x(1:r,i+1))
    if InfinityNorm(a)<=tol % check tolerance condition
        e=max(A*x(1:r,i)); % 위 조건 만족시 해당 largest element인 eigenvalue 추출
        break;
    end
end
