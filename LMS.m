%LMS Function Script File for Question # 1

function [e_sq,h]=LMS(N,b,a,p,mu,v)
x=filter(b,a,v);
h=zeros(p,N);
e_sq=zeros(1,N-p+1);
e=zeros(1,N-p);
for n = p:N-1
    x_vec=x(n:-1:n-p+1)';
    e(n)=x(n+1)-h(:,n)'*x_vec;
    e_sq(n)=e(n)*e(n);
    %LMS Update
    h(:,n+1)=h(:,n)+mu*e(n)*x_vec;
end
   h=h';
end

