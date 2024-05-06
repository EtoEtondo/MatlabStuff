clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

s= tf('s')
Gs= 10/((1+5*s)*(1+1.25*s)*(1+0.333*s))
Gm= 1

%figure(1)
%margin(Gs)
%grid

Mp= 0.2
tr= 0.72
wc= 1.44/tr

phi_r_soll= 69-106 * Mp
[betrag phase]= bode(Gs,wc)
phi_r_ist= 180 + phase
phi_pd = phi_r_ist - phi_r_soll
dphi = abs(phase) - 180 + phi_r_soll + 5

m = tan((dphi * pi/180 + pi/2)/2)^2
T= sqrt(m)/wc %T1
Tr= 1/(wc * sqrt(m)) %T2
T3= 10*T

V=1
Gr_strich=V * (1+s * T3) * (1+s * T)/(s * (1+s * Tr))

L_strich= Gr_strich * Gs * Gm
[betrag phase]= bode(L_strich,wc)
V= 1/betrag
Gr= V * (1+s * T3) * (1+s * T)/(s * (1+s * Tr))
L= Gr * Gs * Gm
Gg= L/(1+L)

figure(1)
bode(Gs, Gr_strich, L_strich, L)
legend('Gs', 'Gr_ strich', 'L_ strich', 'L')
grid

figure(2)
step(Gg)
legend('show')
grid

