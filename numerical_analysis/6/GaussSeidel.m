function x = GaussSeidel(a, b, ErrMax, iterMax)
% a : n x n matrix of coefficients in linear system
% b : n x 1 column vector of constants
% ErrMax : allowable estimated relative error
% iterMax : maximum iteration number
ab = [a,b];
[R,C] = size(ab); %% should be R+1 = C because square + nx1
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
% 위 과정을 통해 순서대로 나열하여 zero diagonal element 피함.

x=zeros(iterMax, R);%% 반복하여 나중에 iteration 값에서 해당 row 추출할 예정
RelErr=ones(iterMax, R); %% RelErr는 1보다 작을 테니 일단 1로 배정해두고 진행
for i = 1:iterMax %% i 는 x 입장 row 변화. 즉 다음 시간.
    if i>=2
        for m=1:R % 각 x마다 RelErr 비교해주는 과정.
            RelErr(i,m)= abs((x(i,m)-x(i-1,m))./x(i-1,m));%% i=2 부터 check해서 입력.
        end
    end
    for n=1:R %% n은 equation 숫자
        sum =0; % 각 equation 별로 필요한 덧셈이니
        for j =1:R % 여기서 j는 각 변수에 대응되는 숫자
            if j<n
                sum = sum+ab(n,j)*x(i+1,j); % 계산이 진행된 경우
            elseif j>n
                sum = sum + ab(n,j)*x(i,j); % 아직 계산이 진행되지 않을 경우
            end
        end
        x(i+1,n)= (ab(n,C)-sum)/ab(n,n); % 해당 iteration의 해당 equation으로 다음 iteration의 x값 도출.
    end
    if i>=2
        if max(RelErr(i,:)) < ErrMax %% RelErr 적용. RelErr가 모두 최대 허용범위인 ErrMax이하여야!
            break
        end
    end
    if i == iterMax %% 과도한 iteration 방지
        error('Error: Solution was no obtained in %i iteration',iterMax)
    end
end


