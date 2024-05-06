clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

s=tf('s')
Gs= 1/(1+0.2*s)
Gr=10
Gm=1
W=1/s
Gg=(Gr*Gs)/(1+Gr*Gs*Gm)
Ys=W*Gg
figure(1)
step(Gs, Gg)
grid on

Gr2=10/s
Gg2=(Gr2*Gs)/(1+Gr2*Gs*Gm)
figure(2)
step(Gs,Gg,Gg2)
grid on

%g) nochmal nachfragen!
Es=Gg/(Gr*Gs)
Es2=Gg2/(Gr2*Gs)
figure(3)
step(Es,Es2)
grid on

%Allternativ
%Es = 1/(1+GsGrGm);
%Es2 = 1/(1+GsGr2Gm);