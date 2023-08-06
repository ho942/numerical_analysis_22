function x = GaussJordan(a,b)
% The function solve a system of linear equations ax=b using the Gauss
% elimination method with pivoting.
% has a pivot element with the largest absolute numerical value.
% Input variables:
% a  The matrix of coefficients.
% b  A column vector of constants.
% Output variable:
% x  A colum vector with the solution.

ab = [a,b];
[R,C] = size(ab);
% x=zeros(R,1);
for j = 1:R-1
% Pivoting section starts
    if ab(j,j)==0
        for k=j+1:R
            if abs(ab(k,j))==max(abs(ab(j+1:R,j))) % pivot element with the largest absolute value
                %fprintf("%d",ab(k,j))
                abTemp=ab(j,:);
                ab(j,:)=ab(k,:);
                ab(k,:)=abTemp;
                break
            end
        end
    end
% Pivoting section ends
end
%GaussJordan method below
for j=1:R
    ab(j,:)=ab(j,:)/ab(j,j);
    for i = 1:R
        if i ~=j
            m=ab(i,j);
            ab(i,:)=ab(i,:)-m*ab(j,:);
        end
    end

end
x= ab(:,C);

