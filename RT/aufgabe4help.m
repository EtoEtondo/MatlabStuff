clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

%s=tf('s');
syms s
Ys=(5/s)-(5*s)/((s+5/2)^2+975/4) - 25/((s+5/2)^2+975/4)
yt=ilaplace(Ys)