%Final Prony
%%FINAL 
number_of_d_cells=5000;
number_of_cole_cells=3000;
total_d_cells=number_of_d_cells+number_of_cole_cells;
number_of_time_cells=11000;
alpha=input('Alpha Cole Cole ');
t1=153*10^(-12);
B=21;
p=5;
einf=2;
es=50;
pr=input('Prony ');
De=es-einf;
Ex=zeros(total_d_cells);
Hy=zeros(total_d_cells,1);
a=1.26*10^10;
fe=6*10^9;
c=299792458;
dz=3*10^(-4);
dt=3*10^(-4)/(2*299792458);
m0=4*pi*10^-7;
e0=8.8541878128*10^-12;
EREF=zeros(101);
EINC=zeros(101);
ETOT=zeros(101);


%Creation of Filt coefficients array for number_of_time_cells
f=zeros(number_of_time_cells,1);
for m=1:number_of_time_cells
    f(m)=filt2(m-1,dt,t1,alpha,B,p,es,einf);
end

pronycoef=prony(pr,number_of_time_cells,f);
Q=zeros(pr,number_of_cole_cells);
S=0;
for i=1:pr
    S=S+pronycoef(i,1);
end
%empty space
Einc=zeros(number_of_time_cells);
Etot=zeros(number_of_time_cells);
for n=1:number_of_time_cells
    Ex(2:total_d_cells,1)=Ex(2:total_d_cells,1)-1/e0*dt/dz*(Hy(2:total_d_cells,1)-Hy(1:total_d_cells-1,1));
    Einc(n,1)=Ex(number_of_d_cells*8/10);
    Ex(number_of_d_cells/2,1)=exp(-a^2*((n-1)*dt-4/a)^2)*sin(2*pi*fe*((n-1)*dt-4/a))*heaviside((n-1)*dt);
    Hy(1:total_d_cells-1,1)=Hy(1:total_d_cells-1,1)-1/m0*dt/dz*(Ex(2:total_d_cells,1)-Ex(1:total_d_cells-1,1));
end


%Simulation Start
Ex=zeros(total_d_cells);
Hy=zeros(total_d_cells,1);
for n=1:number_of_time_cells
    
    Ex(2:number_of_d_cells,1)=Ex(2:number_of_d_cells,1)-1/e0*dt/dz*(Hy(2:number_of_d_cells,1)-Hy(1:number_of_d_cells-1,1));
    
    if(Ex(number_of_d_cells,1)~=0)
    %Using Prony method            
        for k=number_of_d_cells+1:total_d_cells
            sumQ=0;
            for i=1:pr
                sumQ=sumQ+(pronycoef(i,2)-1)*Q(i,k-number_of_d_cells);
            end
            Ex(k,1)=-sumQ/S-1/e0*dt/dz*(Hy(k,1)-Hy(k-1,1))/S;
            for i=1:pr
                Q(i,k-number_of_d_cells)=pronycoef(i,2)*Q(i,k-number_of_d_cells)+pronycoef(i,1)*Ex(k,1);
            end
        end
    end
        
    Etot(n,1)=Ex(number_of_d_cells*8/10);
    Ex(number_of_d_cells/2,1)=exp(-a^2*((n-1)*dt-4/a)^2)*sin(2*pi*fe*((n-1)*dt-4/a))*heaviside((n-1)*dt);
    Hy(1:total_d_cells-1,1)=Hy(1:total_d_cells-1,1)-1/m0*dt/dz*(Ex(2:total_d_cells,1)-Ex(1:total_d_cells-1,1));
    
    
    pause(0.0005);
    plot(Ex(1:total_d_cells,1))
    xlabel('’ξονας Z')
    ylabel('Ex')
    ylim([-1 1]);
    
end
figure()
plot(Einc(1:number_of_time_cells,1));
figure()
plot(Etot(1:number_of_time_cells,1));
Eref=zeros(number_of_time_cells);
Eref(1:number_of_time_cells)=Etot(1:number_of_time_cells)-Einc(1:number_of_time_cells);

%Calculate Fourier Transformations
EINC=DFT(Einc(1:number_of_time_cells),dt,10^9,2*10^10);
EREF=DFT(Eref(1:number_of_time_cells),dt,10^9,2*10^10);
ETOT=DFT(Etot(1:number_of_time_cells),dt,10^9,2*10^10);
REF=zeros(101);
freq=zeros(101);
for i=1:101
    REF(i)=EREF(i)/EINC(i);
    freq(i)=10^9+(i-1)*(2*10^10-10^9)/100;
end
theory=theoretical(es,einf,t1,alpha,10^9,2*10^10);
figure()
plot(freq,REF)
title('')
xlabel('Συχνότητα')
ylabel('Μέτρο Συντελεστή Ανάκλασης') 

hold on
plot(freq,theory)
legend({'SIMULATION','THEORETICAL'},'Location','southwest')
hold off
err=ERROR(REF,theory,101);



