function [out] = ERROR(f1,f2,len)
sum=0;
for i=1:len
    sum=sum+1/len*(f1(i)-f2(i))^2;
end
out=sum^(0.5);

end

