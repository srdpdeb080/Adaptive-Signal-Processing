% Question # 1 Main Code File

N=500; %Repeat for N=100
p=2; 
sigma=0.5;
mu=0.05; %Repeat for mu=0.01
b=1;
a=[1,-0.1,-0.8]; %Repeat for a=[1,-0.1,0.8]
count=100;
e_sq_new=zeros(1,N-p+1);

for i=1:count
 v=normrnd(0,sigma,[1,N]);
 [e_sq,h]=LMS(N,b,a,p,mu,v);
 e_sq_new= e_sq_new+e_sq;
end
figure;
plot(e_sq_new/count);
xlabel('Number of iterations (n)');
ylabel('Squared prediction error (e^2(n))');
title('Learning Curve Plot for mu=0.05 and N=100');
figure;
plot(h);
xlabel('Number of iterations (n)');
ylabel('Filter coefficients (h(n))');
title('Iterative Filter Coefficient Update Plot for mu=0.05 and N=100');