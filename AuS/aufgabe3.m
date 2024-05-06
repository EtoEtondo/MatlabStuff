clear all
load('Aufgabe_3_Current_2')
load('Cr_file')
figure(1)
plot(tout,Current) %strom der vom motor ausgegeben wird

R=3
km=0.0227
U0=12
ke=0.024
Ml=0
L=400e-6
Cr=5.0e-6
J=0.5e-6 %5.5e-6

sim('aufgabe_3_1')
figure(2)
subplot(3,1,1)
plot(i)
subplot(3,1,2)
plot(w)
subplot(3,1,3)
plot(phi)