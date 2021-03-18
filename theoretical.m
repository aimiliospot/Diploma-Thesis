function [out] = theoretical(es,einf,t1,alpha,fr1,fr2)
step=(fr2-fr1)/100;
ref=zeros(101);
for i=1:101
    e=einf+(es-einf)/(1+(1i*2*pi*(fr1+step*(i-1))*t1)^alpha);
    ref(i)=(1-e^0.5)/(1+e^0.5);
end
out=abs(ref);
