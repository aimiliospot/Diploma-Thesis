function [out] = prony(m,n,f)
%Calculation of polynomial coefficients
A=zeros(n-m,m);
B=zeros(n-m);
gamma=zeros(m);
for i=1:n-m
    B(i)=-f(i+m);
    for j=1:m
        A(i,j)=f(m+i-j);
    end
end
gamma=A\B;
poly=zeros(1,m+1);
for i=2:m+1
    poly(1,i)=gamma(i-1,1);
end
poly(1,1)=1;
r=roots(poly);
M=zeros(n,m);
x=zeros(n);
for i=1:n
    x(i)=f(i);
    for j=1:m
        M(i,j)=r(j)^(i-1);
    end
end
a=M\x;

export=zeros(m,2);
for i=1:m
    export(i,1)=a(i);
    export(i,2)=r(i);
end
out=export;
end

