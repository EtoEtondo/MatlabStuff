clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

%a)

Mp1=0.2
tr1=2
wc1=1.44/tr1
phi_r1=69-106*Mp1
d1=sqrt(log(Mp1)^2/((pi^2)+log(Mp1)^2))
w01=wc1/sqrt(-2*(d1^2)+sqrt(1+4*(d1^4)))
Ts1=3/(w01*d1)


Mp2=0.4
tr2=0.02
wc2=1.44/tr2
phi_r2=62-76*Mp2
d2=sqrt(log(Mp2)^2/((pi^2)+log(Mp2)^2))
w02=wc2/sqrt(-2*(d2^2)+sqrt(1+4*(d2^4)))
Ts2=3/(w02*d2)


Mp3=0.3
tr3=0.1
wc3=1.44/tr3
phi_r3=62-76*Mp3
d3=sqrt(log(Mp3)^2/((pi^2)+log(Mp3)^2))
w03=wc3/sqrt(-2*(d3^2)+sqrt(1+4*(d3^4)))
Ts3=3/(w03*d3)

%b)
%gib mehr Phasenrand, gibr mehr Verstärkung






