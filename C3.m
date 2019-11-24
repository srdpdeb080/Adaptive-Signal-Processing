%Generating 1000 samples of zero mean unit variance white gaussian noise
n=1000;
variance=1;
v=randn(n,1);
x=sqrt(variance)*v;

%Generating the autocorrelation of the above sample sequence
rx=xcorr(x,x,'biased');

%Segmenting the white noise sequence into 10 different white noise sequence
%each having a length of 100 samples
v1=v(1:100);
v2=v(101:200);
v3=v(201:300);
v4=v(301:400);
v5=v(401:500);
v6=v(501:600);
v7=v(601:700);
v8=v(701:800);
v9=v(801:900);
v10=v(901:1000);

%Estimating the autocorrelation by averaging the sample autocorrelations of
%each subsequence

rv1=xcorr(v1,v1,'biased');
rv2=xcorr(v2,v2,'biased');
rv3=xcorr(v3,v3,'biased');
rv4=xcorr(v4,v4,'biased');
rv5=xcorr(v5,v5,'biased');
rv6=xcorr(v6,v6,'biased');
rv7=xcorr(v7,v7,'biased');
rv8=xcorr(v8,v8,'biased');
rv9=xcorr(v9,v9,'biased');
rv10=xcorr(v10,v10,'biased');

rv_avg=zeros(1,199);
for i=1:199
    rv_avg(i)=(rv1(i)+rv2(i)+rv3(i)+rv4(i)+rv5(i)+rv6(i)+rv7(i)+rv8(i)+rv9(i)+rv10(i))/10;
end

%comparing the average autocorrelation with true autocorrelation

error_sq1=zeros(1,200);
sum1=0;
for i=1:199
    error_sq1(i)= ((rx(n-51+i)-rv_avg(i))^2);
    sum1=sum1+error_sq1(i);
    
end

error1=sqrt(sum1/200);

%Generating 10000 samples of zero mean unit variance white gaussian noise
%and estimating the autocorrelation function of the same
n1=10000;
variance=1;
v_new=randn(n1,1);
x1=sqrt(variance)*v_new;
rx1=xcorr(x1,x1,'biased');

%Comparing (d) with (b)
error_sq2=zeros(1,200);
sum2=0;
for j=1:199
    error_sq2(j)= ((rx(n-51+j)-rx1(n1-51+j))^2);
    sum2=sum2+error_sq2(j);
    
end

error2=sqrt(sum2/200);


figure;
subplot(511)
plot(x);
title('3.3(a): 1000 samples of White Gaussian Noise x');
subplot(512)
stem(rx(n-50:n+50));
title('3.3(b): First 100 lags of the autocorrelation function rx');
subplot(513)
stem(rv_avg(50:150));
title('3.3(c): Average Autocorrelation of the segments rv_avg');
subplot(514)
plot(x1);
title('3.3(d): 10000 samples of White Gaussian Noise v_new');
subplot(515)
stem(rx1(n1-50:n1+50));
title('3.3(d): Autocorrelation Function rx1 of v_new');
