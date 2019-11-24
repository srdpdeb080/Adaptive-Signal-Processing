% C.7.2(a) Generating 500 samples of the random process x(n) and v2(n)
g=randn(1,500);
v2=filter(1,[1,-0.8],g);
w=0.05*pi;
d=zeros(1,500);
for n=1:500
    phi=-1+2*rand;
d(n)=sin(n*w+phi*pi);
end
x=d+g;

figure;
subplot(211);
plot(x);
hold on;
plot(d);
title('x(n)');
subplot(212);
plot(v2);
title('v2(n)');

% C.7.2(b) and (c) Using p=2,4 and 6, we evaluate MSE for each case and plot the
% respective graphs

rxv2=xcorr(x,v2,'biased');
rv2=xcorr(v2,v2,'biased');

% for p=2
rv2_2=zeros(1,2);
Rxv2_2=zeros(1,2);
for i=1:2
   rv2_2(i)=rv2(i); 
   Rxv2_2(i)=rxv2(i);
end

Rv2_2=toeplitz(rv2_2);

hopt_2=pinv(Rv2_2)*transpose(Rxv2_2);

g_hat2=filter(hopt_2,1,v2);
MSE_2=0;

for j=1:500
    MSE_2= MSE_2+(g_hat2(j)-g(j)).^2;
end

MSE_2=sqrt((1/500)*MSE_2);

% for p=4
rv2_4=zeros(1,4);
Rxv2_4=zeros(1,4);
for i=1:4
   rv2_4(i)=rv2(i); 
   Rxv2_4(i)=rxv2(i);
end

Rv2_4=toeplitz(rv2_4);

hopt_4=pinv(Rv2_4)*transpose(Rxv2_4);
g_hat4=filter(hopt_4,1,v2);
MSE_4=0;

for j=1:500
    MSE_4= MSE_4+(g_hat4(j)-g(j)).^2;
end

MSE_4=sqrt((1/500)*MSE_4);

% for p=6
rv2_6=zeros(1,6);
Rxv2_6=zeros(1,6);
for i=1:6
   rv2_6(i)=rv2(i); 
   Rxv2_6(i)=rxv2(i);
end

Rv2_6=toeplitz(rv2_6);

hopt_6=pinv(Rv2_6)*transpose(Rxv2_6);
g_hat6=filter(hopt_6,1,v2);
MSE_6=0;

for j=1:500
    MSE_6= MSE_6+(g_hat6(j)-g(j)).^2;
end

MSE_6=sqrt((1/500)*MSE_6);


figure;
subplot(411);
plot(g_hat2);
title('g_hat for p=2');
subplot(412);
plot(g_hat4);
title('g_hat for p=4');
subplot(413);
plot(g_hat6);
title('g_hat for p=6');
subplot(414);
plot([2,4,6],[MSE_2,MSE_4,MSE_6],'r--');
title('MSE vs order p');

% C.7.2(d) Performance of Wiener noise canceller for different values of alpha for
% p=2,4 and 6

for alpha=0.1:0.1:0.4
v0=v2+alpha*d;
rxv0=xcorr(x,v0,'biased');
rv0=xcorr(v0,v0,'biased');

% for p=2
rv2_2=zeros(1,2);
Rxv2_2=zeros(1,2);
for i=1:2
   rv2_2(i)=rv2(i); 
   Rxv2_2(i)=rxv2(i);
end

Rv2_2=toeplitz(rv2_2);

hopt_2=pinv(Rv2_2)*transpose(Rxv2_2);

g_hat2=filter(hopt_2,1,v2);
MSE_2=0;

for j=1:500
    MSE_2= MSE_2+(g_hat2(j)-g(j)).^2;
end

MSE_2=sqrt((1/500)*MSE_2);

% for p=4
rv2_4=zeros(1,4);
Rxv2_4=zeros(1,4);
for i=1:4
   rv2_4(i)=rv2(i); 
   Rxv2_4(i)=rxv2(i);
end

Rv2_4=toeplitz(rv2_4);

hopt_4=pinv(Rv2_4)*transpose(Rxv2_4);
g_hat4=filter(hopt_4,1,v2);
MSE_4=0;

for j=1:500
    MSE_4= MSE_4+(g_hat4(j)-g(j)).^2;
end

MSE_4=sqrt((1/500)*MSE_4);

% for p=6
rv2_6=zeros(1,6);
Rxv2_6=zeros(1,6);
for i=1:6
   rv2_6(i)=rv2(i); 
   Rxv2_6(i)=rxv2(i);
end

Rv2_6=toeplitz(rv2_6);

hopt_6=pinv(Rv2_6)*transpose(Rxv2_6);
g_hat6=filter(hopt_6,1,v2);
MSE_6=0;

for j=1:500
    MSE_6= MSE_6+(g_hat6(j)-g(j)).^2;
end

MSE_6=sqrt((1/500)*MSE_6);


figure;
subplot(411);
plot(g_hat2);
title('g_hat for p=2');
subplot(412);
plot(g_hat4);
title('g_hat for p=4');
subplot(413);
plot(g_hat6);
title('g_hat for p=6');
subplot(414);
plot([2,4,6],[MSE_2,MSE_4,MSE_6],'r--');
endrv2=xcorr(v2,v2,'biased');

% for p=2
rv2_2=zeros(1,2);
Rxv2_2=zeros(1,2);
for i=1:2
   rv2_2(i)=rv2(i); 
   Rxv2_2(i)=rxv2(i);
end

Rv2_2=toeplitz(rv2_2);

hopt_2=pinv(Rv2_2)*transpose(Rxv2_2);

g_hat2=filter(hopt_2,1,v2);
MSE_2=0;

for j=1:500
    MSE_2= MSE_2+(g_hat2(j)-g(j)).^2;
end

MSE_2=sqrt((1/500)*MSE_2);

% for p=4
rv2_4=zeros(1,4);
Rxv2_4=zeros(1,4);
for i=1:4
   rv2_4(i)=rv2(i); 
   Rxv2_4(i)=rxv2(i);
end

Rv2_4=toeplitz(rv2_4);

hopt_4=pinv(Rv2_4)*transpose(Rxv2_4);
g_hat4=filter(hopt_4,1,v2);
MSE_4=0;

for j=1:500
    MSE_4= MSE_4+(g_hat4(j)-g(j)).^2;
end

MSE_4=sqrt((1/500)*MSE_4);

% for p=6
rv2_6=zeros(1,6);
Rxv2_6=zeros(1,6);
for i=1:6
   rv2_6(i)=rv2(i); 
   Rxv2_6(i)=rxv2(i);
end

Rv2_6=toeplitz(rv2_6);

hopt_6=pinv(Rv2_6)*transpose(Rxv2_6);
g_hat6=filter(hopt_6,1,v2);
MSE_6=0;

for j=1:500
    MSE_6= MSE_6+(g_hat6(j)-g(j)).^2;
end

MSE_6=sqrt((1/500)*MSE_6);


figure;
subplot(411);
plot(g_hat2);
title('g_hat for p=2');
subplot(412);
plot(g_hat4);
title('g_hat for p=4');
subplot(413);
plot(g_hat6);
title('g_hat for p=6');
subplot(414);
plot([2,4,6],[MSE_2,MSE_4,MSE_6],'r--');
title('MSE vs order p');
end
