function N = InfinityNorm(A)
% function that calculate the infinity norm of any matrix.
% A : matrix
% N : value of the norm
[r,c]=size(A);
row=zeros(1,r);
for i =1:r
    for j=1:c
        row(i)=row(i)+abs(A(i,j));
%          disp(abs(row(i)))
    end
end
% disp(row)
N=max(abs(row));