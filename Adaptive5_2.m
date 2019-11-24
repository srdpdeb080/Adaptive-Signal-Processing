% Question # 2 Main Code File

N=1000; %Repeat for N=100 
p=4; %Repeat for p=3 and p=2
sigma=0.5;
a=1;
b=[1,1.8,0.81];
count=100;
e_sq_new=zeros(1,N-p+3);

for i=1:count
 v=normrnd(0,sigma,[1,N]);
 [e_sq,h]=LMS2(N,b,a,p,v);
 e_sq_new= e_sq_new+e_sq;
end
figure;
plot(e_sq_new/count);
xlabel('Number of iterations (n)');
ylabel('Squared prediction error (e^2(n))');
title('Learning Curve Plot for p=2,mu=0.1*mu_max and N=100');
figure;
plot(h);
xlabel('Number of iterations (n)');
ylabel('Filter coefficients (h(n))');
title('Iterative Filter Coefficient Update Plot for p=2,mu=0.1*mu_max and N=100');