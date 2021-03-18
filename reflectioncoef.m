%%PLOT REFLECTON COEFFICIEN
er=zeros(51);
gamma=zeros(51);
count=0;
for f=0.1*10^9:1.98*10^8:10^10
    count=count+1;
    er(count)=2+48/(1+(1i*2*pi*f*153*10.^(-12)).^0.8);
end
for i=1:100
    gamma(i)=(sqrt(er(i))-1)/(sqrt(er(i))+1);
end
plot(f,abs(gamma));