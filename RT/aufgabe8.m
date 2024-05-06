clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

%Nyquist Kriterien werden alle erfüllt

s=tf('s')
Gs=800000/((s+10)*(s+80)*(s+100))
Gm=1

Mp=0.2
tr=0.072
wc=1.44/tr
phi_r=69-106*Mp

T=tan(pi/2 - 42.2 * pi/180)/wc

V=1
Gr_strich=V*(s*T+1)/s

L_strich=Gr_strich*Gs*Gm
[betrag phase] = bode(L_strich,wc)
V=1/betrag
Gr=V*(s*T+1)/s
L=Gr*Gs*Gm

Gg= L/(1+L)

figure(1)
bode(Gs, Gr_strich, L_strich, L)
legend('Gs', 'Gr_ strich', 'L_ strich', 'L')
grid

figure(2)
step(Gg)
legend('show')
grid