clear,clc
syms S1 A1
g=9.81;
gama_1=0*g;
L1=2.5;
P=g*10*10^3;
sigma_y_1=250*10^6;
FS=10;

V1=P+gama_1*A1*L1;
M1=P*L1+1/2*gama_1*A1*L1^2;
sigma1=M1/S1;

R1_1=sigma1/2;
eqn1=R1_1==sigma_y_1/(2*FS);
S1_solved=solve(eqn1,S1);
%S1 must be equal or greater than S1_solved -> App.C -> W360X551
S1=9950*10^3*10^(-9);
A1=70300*10^(-6);
I1=2260*10^(-6);
tw=42.2*10^(-3);
tf=67.6*10^(-3);
bf=419*10^(-3);
bI=455*10^(-3);
Q1=bf*tf*1/2*(bI-tf)+(bI/2-tf)*tw*0.5*(bI/2-tf);
