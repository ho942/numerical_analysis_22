function Ainv = Inverse(A)
% function Inverse to determine the inverse of a matrix using the
% Gauss-jordan method
% A: matrix to be inverted
% Ainv: inverse of the matrix
% Find dimensions of input matrix
[r,c] = size(A);

% If input matrix is not square, stop function
if r ~= c
    disp('It should be square matrix')
    Ainv = [];
    return
end

Ainv = eye(r);
for j = 1 : r
    for i = j : r
        if A(i,j) ~= 0
            for k = 1 : r
                s = A(j,k); A(j,k) = A(i,k); A(i,k) = s;
                s = Ainv(j,k); Ainv(j,k) = Ainv(i,k); Ainv(i,k) = s;
            end
            m = 1/A(j,j);
            for k = 1 : r
                A(j,k) = m * A(j,k);
                Ainv(j,k) = m * Ainv(j,k);
            end
            for L = 1 : r
                if L ~= j
                    m = -A(L,j);
                    for k = 1 : r
                        A(L,k) = A(L,k) + m * A(j,k);
                        Ainv(L,k) = Ainv(L,k) + m * Ainv(j,k);
                    end
                end
            end           
        end
        break
    end
    % Display warning if a row full of zeros is found
    if A(i,j) == 0
        disp('Warning: Singular Matrix')
        Ainv = 'error';
        return
    end
end



