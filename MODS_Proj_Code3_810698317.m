clear,clc

g=9.81;
L1=2.5;
P=g*10*10^3;
sigma_y_1=250*10^6;
FS=10;


S1=9950*10^3*10^(-9);
A1=70300*10^(-6);
I1=2260*10^(-6);
tw=42.2*10^(-3);
tf=67.6*10^(-3);
bf=419*10^(-3);
bI=455*10^(-3);
Q1=bf*tf*1/2*(bI-tf)+(bI/2-tf)*tw*0.5*(bI/2-tf);

gama_1=7860*g;
V1=P+gama_1*A1*L1;
M1=P*L1+1/2*gama_1*A1*L1^2;

% for two cylinders we have

gama_2=7860*g;
gama_3=7860*g;
h2=1;
h3=h2+1.5;
T0=200;
syms x
T=int(200,x,[0,1]);
sigma_y_2=250*10^6;
sigma_y_3=250*10^6;
            
            
calcs=zeros(1,4);
for d=0.1:0.01:1 %in m
    for D=0.1:0.01:1 %in m
        if d<D
            A2=pi/4*(D^2-d^2);
            M2=M1;
            W2=gama_2*A2*h2;
            N2=V1+W2;
            I2=pi/4*((D/2)^4-(d/2)^4);
            J2=2*I2;
            sigma2=N2/A2+M2*(D/2)/I2;
            taw2=T*(D/2)/J2;
            R2=sqrt((sigma2/2)^2+(taw2)^2);
            condition2=R2<sigma_y_2/(2*FS);
            
            A3=pi/4*d^2;
            M3=M2;
            W3=gama_3*A3*h3;
            N3=N2+W3;
            I3=pi/4*(d/2)^4;
            J3=2*I3;
            sigma3=N3/A3+M3*(d/2)/I3;
            taw3=T*(d/2)/J3;
            R3=sqrt((sigma3/2)^2+(taw3)^2);
            condition3=R3<sigma_y_3/(2*FS);
            
            if condition2 && condition3
                calcs=[calcs;d,D,R2,R3];
            end
        end
    end    
end
calcs(1,:)=[];
d=calcs(1,1)
D=ans2(1,2)
