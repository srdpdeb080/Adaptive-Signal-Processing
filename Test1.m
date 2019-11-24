n=1000;
p=2;
v=randn(1,n);
x=filter(1,[1,-1.5,0.8],v);

h=zeros(p,n);
%e=zeros(p,n);
mu=0.01;

for n=p:N-1
    x_vec=x(n:-1:n-p+1)';
    h_curr=h(:,n)';
    e(n)= x(n+1)-h_curr*x_vec;
    
    %LMS update
    h(:,n+1)=h(:,n)+ mu*e(n)*x_vec;
    
end

figure;
plot(h');grid on;
%plot(e.^2);grid on;