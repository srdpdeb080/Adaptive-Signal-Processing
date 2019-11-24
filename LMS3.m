


%LMS Function Script File for Question # 3

function [e_sq,h]=LMS3(N,b,a,p,v,gamma,v1)
x=filter(b,a,v);

beta=0.1;
mu=beta/norm(v);
h=zeros(p,N);
e_sq=zeros(1,N-p+1);
e=zeros(1,N-p);
for n = p:N-1
    v_vec=v(n:-1:n-p+1)';
    e(n)=x(n)+gamma*v1(n)-h(:,n)'*v_vec;
    e_sq(n)=e(n)*e(n);
    %LMS Update
    h(:,n+1)=h(:,n)+mu*e(n)*v_vec;
end
   h=h';
end

