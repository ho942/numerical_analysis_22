function [Ck,fk] = DFTCmplx(T,F)
% DFTCmplx determines the complex discrete Fourier Transform of a
% function given by a finite number of points by using Eqs. (7.50).
% Input variables:
% T    A vector with the values of the independent variable.
% F    A vector with the values of the dependent variable.
% Output variable:
% Ck    A vector with the values of the complex coefficients.
% fk    A vector with the corresponding values of frequencies.

N=length(F)/2;
dt=(T(2*N)-T(1))/(2*N-1);
fk=[0:N]/(dt*2*N); 
Ck(1)=sum(F(1:2*N))/(2*N);
for k=2:N
    CkI(k)=0; CkR(k)=0;
    for j=1:2*N
        CkI(k)=CkI(k)+F(j)*sin(pi*(k-1)*T(j)/(dt*N));
        CkR(k)=CkR(k)+F(j)*cos(pi*(k-1)*T(j)/(dt*N));
    end
    Ck(k)=(CkR(k)-CkI(k)*i)/(2*N);
end
Ck(N+1)=0;
for j=1:2*N
    Ck(N+1)=Ck(N+1)+F(j)*cos(pi*N*T(j)/(dt*N));
end
Ck(N+1)=Ck(N+1)/(4*N);