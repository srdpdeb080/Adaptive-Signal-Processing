%Name: Souradeep Deb
%Roll No: 2019702004
%MS By Research(ECE)
%Adaptive Signal Processing
%Assignment #6

%LMS Function Script File for Question # C9.8

function [e_sq,h]=LMS_new(N,b,a,p,v)
x=filter(b,a,v);

h=zeros(p,N);
e_sq=zeros(1,N-p+1);
e=zeros(1,N-p);
c1=5;
c2=1; %for part(a) take c2=1, for part(b) take c2 as any other value(preferably low like c2 < 3)
for n = p:N-1
    mu=1/(c1+c2*n);
    v_vec=v(n:-1:n-p+1)';
    e(n)=x(n)-h(:,n)'*v_vec;
    e_sq(n)=e(n)*e(n);
    %LMS Update
    h(:,n+1)=h(:,n)+mu*e(n)*v_vec;
    
    
end
   h=h';
end

