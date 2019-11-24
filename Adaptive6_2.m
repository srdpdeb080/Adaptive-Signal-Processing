%Name: Souradeep Deb
%Roll No: 2019702004
%MS By Research(ECE)
%Adaptive Signal Processing
%Assignment #6

% Question # 9.9 Main Code File

N=1000; 
p=5; %Repeat for p=10,15 and 20
sigma=1;
b=[1,0,0.5];
a=1;
w0=0.01*pi;
d=zeros(1,N);
count=500;
e_sq_new=zeros(1,N-1);

for n=1:N
    d(n)=sin(w0*n);
end

for i=1:count
 g=normrnd(0,sigma,[1,N]);
 [e_sq,h]=LMS_noisecancel(N,b,a,p,g);
 e_sq_new= e_sq_new+e_sq;
end
figure;
v1=filter([1,0,0.5],1,g);
x=d+v1;
plot(conv(x,h(N,:)));
hold on;
plot(d);
title('information signal(d(n)) and filter output comparison plot(p=5,k=25)');

figure;
plot(e_sq_new/count);
xlabel('Number of iterations (n)');
ylabel('Squared prediction error (e^2(n))');
title('Learning Curve Plot(p=5,k=25)');

figure;
plot(h);
xlabel('Number of iterations (n)');
ylabel('Filter coefficients (h(n))');
title('Iterative Filter Coefficient Update Plot(p=5,k=25)');