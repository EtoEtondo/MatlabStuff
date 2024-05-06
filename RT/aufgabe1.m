clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

%G(s)=1/s*1/1+s*tau  tau=1/5
%o(t)->G(s)->y(s)   Y(s)=G(s)*U(s)
%1/s                Y(s)=1/s*1/1+s*tau*1/s=1/s^2 
% A/s^ + B/s + C/stau
%->Partialbruchzerlegung -> Laplace rücktrafo für y(t)

s=tf('s') %time transfer funktion
tau=0.2
G=(1/s)*(1/(1+s*tau))
%G1 = 1/(s^2)
%G2 = -tau/s
%G3 = tau^2/(1+s*tau)
figure(1)
[y,t]=step(G)
plot(t,y)
%plot(0:0.1:1,0:0.1:1)
%plot(0:0.1:1,-tau:0.1:1-tau)
grid
%[x y]=bode(G, 0.1) %richtiger betrag, nicht in db!
figure(2)
bode(G)
grid