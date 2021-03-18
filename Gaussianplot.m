%%Gaussian Plot
dt=10^(-12);
gau=zeros(10000,1);
a=1.26*10^10;
fe=6*10^(9);
for i=1:100000
    gau(i,1)=exp(-a^2*((i-1)*dt-4/a)^2)*sin(2*pi*fe*((i-1)*dt-4/a));
end
plot(gau(1:2500,1))
title('Gaussian Παλμός')
xlabel('t(ps)')