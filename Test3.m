v=normrnd(0,0.5,[1,1000]);
x=filter(1,[1,-0.1,-0.8],v);


rx=xcorr(x,x,'biased');
Rx=toeplitz(rx(N:N+p-1));
[V,D] = eig(Rx);
lambda_max=D(length(D),length(D));
mu=2/lambda_max;