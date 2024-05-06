clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

s= tf('s')
Gs= 10/((1+s/10)*(1+s/100))
Gm= 1

figure(1)
margin(Gs)
grid

Mp= 0.1
tr= 0.048
wc= 1.44/tr
phi_r_ist= 90
phi_r_soll= 69-106 * Mp
phi_pi= phi_r_ist - phi_r_soll

T= tan(pi/2 - phi_pi * pi/180)/wc

V= 1
Gr_strich= V*(s*T+1)/s

L_strich= Gr_strich * Gs * Gm
[betrag phase]= bode(L_strich,wc)
V= 1/betrag
Gr= V * (s*T+1)/s
L= Gr * Gs * Gm

Gg= L/(1+L)

nGr= V * 10 * (s*T+1)/s
nL= nGr * Gs * Gm
nGg= nL/(1+nL)

figure(2)
bode(Gs, Gr_strich, L_strich, L, nL)
legend('Gs', 'Gr_ strich', 'L_ strich', 'L', 'nL')
grid

figure(3)
step(Gg, nGg)
legend('show')
grid