% Name: Souradeep Deb
% Roll No: 2019702004
% Adaptive Signal Processing
% Assignment #3
% C.7.1

% C.7.1(b) For a=0.8, evaluating MSE for p=1,2,....,20 and plotting a graph
% of MSE vs p

MSE=zeros(1,20);

for p=1:20
    
    MSE(p)=Wiener(p,0.8);
    
end

figure;
subplot(211);
plot(MSE,'ro-');
grid on;
title('Mean Squared Error vs Wiener Filter Order')
xlabel('Order of the filter(p)');
ylabel('Mean Squared Error(MSE)')

% C.7.1(c) For p=10, evaluating MSE for a=0.1,0.2,.....,0.9 and plotting a graph
% of MSE vs alpha

MSE=zeros(1,9);
alpha=zeros(1,9);
i=1;
for a=0.1:0.1:0.9
   
    MSE(i)=Wiener(10,a);
    alpha(i)=a;
    i=i+1;
end



subplot(212);
plot(alpha,MSE,'bo-');
grid on;
title('Mean Squared Error vs alpha')
xlabel('alpha');
ylabel('Mean Squared Error(MSE)')
