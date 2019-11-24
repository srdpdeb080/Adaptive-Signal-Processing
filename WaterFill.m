%Wireless Communication Assignment #5
%Question #2
%Souradeep Deb, MS(By Research)
%Roll No. 2019702004

%Water Filling Algorithm Function
function C=WaterFill(sigma,SNR_in,B)
SNR_inv=10^((SNR_in)/10);
gamma=SNR_inv*(sigma.^2); %SNR of individual channels
gamma_o=0; %Threshold SNR
n=length(gamma);
sum=0;
k=0;  

    for i=1:n
      if gamma(i)>gamma_o
      sum=sum+(1/gamma(i));
      k=k+1;
      else
          gamma(i)=0;
          
      end
      gamma_o=k/(1+sum);
      
    end
    
P_alloc=zeros(1,n); %Allocated Power/Total Power
C=0; %Shannon's Channel Capacity

for i=1:n
    if gamma(i)>gamma_o
    P_alloc(i)=(1/gamma_o)-(1/gamma(i));
    C=C+B*log2(1+P_alloc(i)*gamma(i));
    else
        continue;
    end
end
end
