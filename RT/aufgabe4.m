clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

%Aufgabe 4
s=tf('s');
GM=1;
%a
GRa=10;
GSa=5/(s+5);
La=GRa*GSa*GM;
T= GRa*GSa/(1+La);
subplot(2,2,1)
step(T)
%b
GRb=50/s;
GSb=5/(s+5);
Lb=GRb*GSb*GM;
Tb= GRb*GSb/(1+Lb);
subplot(2,2,2)
step(Tb)
%c
GRc=5;
GSc=5/(s*(s+5));
Lc=GRc*GSc*GM;
Tc= GRc*GSc/(1+Lc);
subplot(2,2,3)
step(Tc)
%d
GRd=5;
GSd=5/(s+5);
GMd=1/s;
Ld=GRd*GSd*GMd;
Td= GRd*GSd/(1+Ld);
subplot(2,2,4)
step(Td)

