function [out] = Ref(Etot,Einc,time)
for i=1:time
    if ((Etot(i)-Einc(i))~=0)
        n=i;
        break;
    end
end
out=n;
end
