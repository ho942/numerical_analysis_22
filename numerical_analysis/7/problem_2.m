function [avg_t1,avg_t2] = problem_2(n) 
% avg_t1 : averaged elapse time of x1 = inv(a)*b 
% avg_t2 : % averaged elapse time of x2 = a\b
% n : square matrix size 
t1=zeros(1,100);
t2=zeros(1,100);
for i =1 :100 % repeat 100 times
    a=rand(n,n); % random nxn matrix [a] per every time
    b=rand(n,1); % random nx1 vector nx1 [b] per every time
    if det(a)~=0 %% matrix[a]가 singular이면 skip
        tic;
        x1 = inv(a)*b;
        t1(i) =toc; %time of x1 = inv(a)*b 
        tic;
        x2 = a\b;
        t2(i)=toc; %time of x2 = a\b
    end
end

avg_t1 = mean(t1); % averaged elapse time of x1 = inv(a)*b 
avg_t2 = mean(t2); % averaged elapse time of x2 = a\b