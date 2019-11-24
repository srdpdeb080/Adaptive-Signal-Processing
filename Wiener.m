% C.7.1(a) Designing a pth order FIR Wiener Filter to estimate d(n) and
% evaluate Mean Squared Error(MSE)

function MSE= Wiener(p,a)


Rd=toeplitz(a.^(0:p-1));
Rv=eye(p);

Rx=Rd+Rv;

rd=transpose(a.^(0:p-1));

hopt=pinv(Rx)*rd;

MSE=rd(1)-transpose(rd)*hopt;

end
