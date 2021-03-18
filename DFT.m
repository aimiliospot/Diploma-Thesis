function [out] = DFT(E,dt,fr1,fr2)
step=(fr2-fr1)/100;
Ef=zeros(101);
length=numel(E);
for i=1:101
    for j=1:length
        Ef(i)=Ef(i)+E(j)*exp(-1i*2*pi*(fr1+(i-1)*step)*(j-1)*dt)*dt;
    end
end
out=abs(Ef);
    
end

