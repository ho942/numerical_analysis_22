function [kp Ak Bk] = DFT(f,t)
% DFT determines the real discrete Fourier Transform of a
% function given by a finite number of points by using Eqs. (**).
% Input variables:
% t    A vector with the values of the independent variable, or t array.
% f    A vector with the values of the dependent variable, or f array.
% Output variable:
% kp    A vector with the values of k.
% Ak    A vector with the values of the constants A.
% Bk    A vector with the values of the constants B.
N=length(f)/2;
dt=(t(2*N)-t(1))/(2*N-1); 
kp=[0:N]; 
Ak = zeros(N+1,1); Bk = Ak;
Ak(1)=sum(f(1:2*N))/(2*N);
Bk(1)=0; Bk(N+1)=0;
for k=2:N
    Ak(k)=0; Bk(k)=0;
    for j=1:2*N
        Ak(k)=Ak(k)+f(j)*cos(pi*(k-1)*t(j)/(dt*N));
        Bk(k)=Bk(k)+f(j)*sin(pi*(k-1)*t(j)/(dt*N));
    end
    Ak(k)=Ak(k)/N;
    Bk(k)=Bk(k)/N;
end
Ak(N+1)=0;
for j=1:2*N
    Ak(N+1)=Ak(N+1)+f(j)*cos(pi*N*t(j)/(dt*N));
end
Ak(N+1)=Ak(N+1)/(2*N); 
