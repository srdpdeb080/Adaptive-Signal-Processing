%Name: Souradeep Deb
%Roll No: 2019702004
%MS By Research(ECE)
%Adaptive Signal Processing
%Assignment #6

% Question # C9.8 Main Code File

N=1000;
p=4; 
sigma=0.5;
a=1;
b=[1,1.8,0.81];
count=100;
e_sq_new=zeros(1,N-p+3);

for i=1:count
 v=normrnd(0,sigma,[1,N]);
 [e_sq,h]=LMS_new(N,b,a,p,v);
 e_sq_new= e_sq_new+e_sq;
end
figure;
plot(e_sq_new/count);
xlabel('Number of iterations (n)');
ylabel('Squared prediction error (e^2(n))');
title('Learning Curve Plot');
figure;
plot(h);
xlabel('Number of iterations (n)');
ylabel('Filter coefficients (h(n))');
title('Weighted values(h) plot');