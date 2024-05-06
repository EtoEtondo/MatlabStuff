clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

%Simulink Werte
R=3
R_dach=1
Lm=400e-6
f=logspace(2, 4, 100)
w=2*pi*f
%dt=110.041e-6
Ls=0.1*Lm*(2*rand-1)
U_dach=12
L=Lm+Ls
T = 1e-5;
sim('aufgabe_2')
dt = finddelay(U(50:length(U), :), i(50:length(U), :)).*T
phi=dt.*w
L_ = tan(phi) * (R+R_dach)./w;
%L_=(R/w)*tan(phi)
figure(1)
loglog(f, phi);
figure(2)
loglog(f, L);