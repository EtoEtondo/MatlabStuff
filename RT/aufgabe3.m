clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

s=tf('s')
Gs=(1+s/10)/(1+s/60)

figure(1)
bode(Gs)
figure(2)
step(Gs)