function [out] = filt2(m,dt,t1,alpha,B,p,es,einf)
%FILT COLE COLE function
De=(es-einf);
Ap=zeros(p);
Ap(p)=1;
s=0;
for q=1:p-1
     Ap(p-q)=Ap(p-q+1)+factorial(p+1)/(factorial(q)*factorial(p-q+1));   
end

sum1=0;
sum2=0;
for r=1:B
    s=(1+1i*(r-0.5)*pi)/(m+0.01);
    sum1=sum1+(-1)^r*imag(De/((1+(s*t1/dt))^alpha));
end
%Euler
for q=1:p
    s=(1+1i*(B+q-0.5)*pi)/(m+0.01);
    sum2=sum2+(-1)^(B+q)*Ap(q)*imag(De/((1+(s*t1/dt))^alpha));
end
sum2=sum2*1/(2^(p+1));
    
out=(sum1+sum2)*exp(1)/((m+0.01));
end

