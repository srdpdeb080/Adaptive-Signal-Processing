%% Souradeep Deb
%  M.S(By Research)
%  Adaptive Signal Processing Course Project
%  Roll No. 2019702004
%  International Institute of Information Technology Hyderabad

% Comparative Noise Cancellation Performance Analysis between LMS and RLS
% Adaptive Filter

% Main Code File
N=1000; 
p=8; 
sigma=0.5;
b=[1,0,0.5];
a=1;
w0=0.01*pi;
d=zeros(1,N);
count=500;
e_sq_new=zeros(1,N-1);
e_sq_new2=zeros(1,N);

for n=1:N
    d(n)=sin(w0*n);
end

for i=1:count
 g=normrnd(0,sigma,[1,N]);
 [e_sq,h]=LMSFilter(N,b,a,p,g);
 [e_sq2,h2]=RLSFilter(N,b,a,p,g);
 e_sq_new= e_sq_new+e_sq;
 e_sq_new2=e_sq_new2+e_sq2;
end
figure;
s=filter(b,a,g);
x=d+s;
plot(conv(x,h(N,:)));
hold on;
plot(d);
title('information signal(d(n)) and filter output comparison plot');
legend('h(n)*x(n)','d(n)');

figure;
plot(e_sq_new/count);hold on;
%xlabel('Number of iterations (n)');
%ylabel('Squared prediction error(e^2(n))');
%title('Learning Curve Plot(LMS)');
%figure;
plot(e_sq_new2/count);grid on;
xlabel('Number of iterations (n)');
ylabel('Squared prediction error(e^2(n))');
title('Learning Curve Plot');
legend('LMS','RLS');