clear %l�scht Arbeitsspeicher
home %scrolled command window (oder clc l�scht cw)
close all %schlie�t alles

%s=tf('s');
syms s
Ys=(5/s)-(5*s)/((s+5/2)^2+975/4) - 25/((s+5/2)^2+975/4)
yt=ilaplace(Ys)