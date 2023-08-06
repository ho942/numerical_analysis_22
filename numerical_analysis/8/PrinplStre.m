function [Ps Pd]=PrinplStre(S)
% function that determines the principal stresses and the directions 
%of the principal stresses for a give three-dimensional state of stress
% S : 3x3 matrix with the values of the stress tensor
% Ps : column vector with the values of the principal stresses
% Pd : is 3x3 matrix in which each row lists a unit vector in a principal
% direction


[r,c]=size(S);
if r~=c % matrix must be square in this function
    error("matrix must be square matrix for using this function")
else
    [Pd,d]=eig(S); % use matlab buit-in function
    Ps = zeros(r,1);
    for i = 1:r
        Ps(i,1) = d(i,i); % make column vector with the values of the principal stresses
    end
end





