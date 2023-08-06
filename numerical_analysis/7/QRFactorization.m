function [Q R] = QRFactorization(R)
% The function factors a matrix [A] into an orthogonal matrix [Q]
% and an upper-triangular matrix [R].
% Input variables:
% A  The (square) matrix to be factored.
% Output variables:
% Q  Orthogonal matrix.
% R  Upper-triangular matrix.

nmatrix = size(R);
n = nmatrix(1);
I = eye(n);
Q = I;
for j = 1:n-1
    c = R(:,j); % j열의 모든 행 도출!
    c(1:j-1) = 0; % vector [c] 정의
    e(1:n,1)=0;
    if c(j) > 0
        e(j) = 1;
    else
        e(j) = -1;
    end %vector [e] 정의
    clength = sqrt(c'*c); % euclidean norm
    v = c + clength*e; % vector [v] 만들기
    H = I - 2/(v'*v)*v*v'; % house holder matrix
    Q = Q*H;
    R = H*R;
end