A=[-.1,-0.09,0.648;1,0,0;0,1,0];
B=[1,0,0]';
C=[1,0,0];
w=normrnd(0,1,10,1);
v=normrnd(0,0.8,10,1);
sigmaw=1;
sigmav=0.8;
xi=[0,0,0]';
x1=xi;
for i=1:10
    X(:,i)=A*x1+sigmaw*B*w(i);
    x1=X(:,i);
end
Y=X(1,:)'+v;
Qw=(sigmaw^2)*B*B';
Qv=sigmav^2;

x2=xi;
Pi=[1,0,0;0,0,0;0,0,0];
Pprev=Pi;
for n=1:10
  Xest=A*x2;
  Pest=A*Pprev*A'+Qw;
  K(:,n)=Pprev*C'/(C*Pprev*C'+Qv);
  err=K(:,n)*(Y(n)-C*Xest);
  Pnext=(eye(3)-K(:,n)*C)*Pprev;
  x2=Xnext(:,n);
  Pprev=Pnext;
  errsqu(n)=trace(Pprev);
end