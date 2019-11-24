% Question # 3 Main Code File

N=1000;
p=4; %Repeat for p=5
sigma=0.5;
a=1;
b=[1,1.8,0.81];
count=100;
gamma=0.1; %Repeat for gamma=1
e_sq_new=zeros(1,N-p+3);
for i=1:count
 v1=rand(1,N);
 v=normrnd(0,sigma,[1,N]);
 [e_sq,h]=LMS3(N,b,a,p,v,gamma,v1);
 e_sq_new= e_sq_new+e_sq;
end
figure;
plot(e_sq_new/count);
xlabel('Number of iterations (n)');
ylabel('Squared prediction error (e^2(n))');
title('Learning Curve Plot for p=4 and gamma=1');
figure;
plot(h);
xlabel('Number of iterations (n)');
ylabel('Filter coefficients (h(n))');
title('Iterative Filter Coefficient Update Plot for p=4 and gamma=1');