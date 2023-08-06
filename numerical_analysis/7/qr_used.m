%example5-4

A=[45 30 -25; 30 -24 68; -25 68 80];
for i = 1:40 % 반복해서 계산 진행

    [Q R] = qr(A) % or QRFactorization(A)하면 동일함.
    A=R*Q;
end
A
lambda =diag(A); % eigenvalue값.


