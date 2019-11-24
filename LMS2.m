%LMS Function Script File for Question # 2

function [e_sq,h]=LMS2(N,b,a,p,v)
x=filter(b,a,v);


rx=xcorr(x,x,'biased');
Rx=toeplitz(rx(N:N+p-1));
[V,D] = eig(Rx);
lambda_max=D(length(D),length(D));
mu_max=2/lambda_max;
mu=0.1*mu_max; %Repeat for mu=0.01*mu_max and mu=0.2*mu_max
h=zeros(p,N);
e_sq=zeros(1,N-p+1);
e=zeros(1,N-p);
for n = p:N-1
    v_vec=v(n:-1:n-p+1)';
    e(n)=x(n)-h(:,n)'*v_vec;
    e_sq(n)=e(n)*e(n);
    %LMS Update
    h(:,n+1)=h(:,n)+mu*e(n)*v_vec;
end
   h=h';
end

