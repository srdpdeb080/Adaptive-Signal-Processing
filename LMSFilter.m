%% Souradeep Deb
%  M.S(By Research)
%  Adaptive Signal Processing Course Project
%  Roll No. 2019702004
%  International Institute of Information Technology Hyderabad

%LMS Filter Function Script File
function [e_sq,h]=LMSFilter(N,b,a,p,g)
s=filter(b,a,g);
mu=0.001;
%beta=0.1;
%mu=beta/norm(g); %normalized LMS
h=zeros(p,N);
e_sq=zeros(1,N-p+1);
e=zeros(1,N-p);
d=zeros(1,N);
k=25;
w0=0.01*pi;
for n=1:N
    d(n)=sin(w0*n);
end
x=d+s;
del=[zeros(1,k) 1];
x_del=filter(del,1,x);
for n = p:N-1
    x_vec=x_del(n:-1:n-p+1)';
    e(n)=x(n)-h(:,n)'*x_vec;
    e_sq(n)=e(n)*e(n);
    %LMS Update
    h(:,n+1)=h(:,n)+mu*e(n)*x_vec;
end
   h=h';
end

