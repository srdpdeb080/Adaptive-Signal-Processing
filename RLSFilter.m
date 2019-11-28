%% Souradeep Deb
%  M.S(By Research)
%  Adaptive Signal Processing Course Project
%  Roll No. 2019702004
%  International Institute of Information Technology Hyderabad

% RLS Filter Function Script File
function [e_sq2,h2] = RLSFilter(N,b,a,p,g)

s=filter(b,a,g);
k=3;             % delay
lambda=1;        % forgetting factor
laminv=1/lambda;
h2=zeros(p,1);    % filter coefficients
P=eye(p);        % inverse correlation matrix
e=zeros(1,N-p);           % error signal
d=zeros(1,N);
e_sq2=zeros(1,N-2);
w0=0.01*pi;

for n=1:N
    d(n)=sin(w0*n);
end
x=d+s;
del=[zeros(1,k) 1];
x_del=filter(del,1,x);

for m = p:length(x)
    x_vec=x_del(m:-1:m-p+1)';
    e(m) = x(m)-h2'*x_vec;
    e_sq2(m)=e(m)*e(m);
    
    Pi = P*x_vec;
    
    % Filter gain vector update
    k = (Pi)/(lambda+x_vec'*Pi);
    
    % Inverse correlation matrix update
    P = (P - k*x_vec'*P)*laminv;
    
    % Filter coefficients adaption
    h2 = h2 + k*e(m);
    
    
end
end


