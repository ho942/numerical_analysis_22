function invA = InverseLU(A)
% The function calculates the inverse of a matrix
% Input variables:
% A  The matrix to be inverted.
% Output variable:
% invA  The inverse of A.

% [L][U][x] =[I] 이므로 LU로 inverse 구하는 과정! a=[L][U]

[nR nC] = size(A);
I=eye(nR);
[L U]= LUdecompCrout(A); % L, U를 구하고. LU decomposite
for j=1:nC
    y=ForwardSub(L,I(:,j)); % L이 lower triangle이니 forward substitution으로. [L][y]=[I] . 여기 I 대신 b면 해당 x값 구하는 과정이지!
    invA(:,j)=BackwardSub(U,y); % U가 upper triangle이니 backward substitution으로. [U][x]=[y]
end