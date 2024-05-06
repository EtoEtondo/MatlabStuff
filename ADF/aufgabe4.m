clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

%Reflektion von Lautsprecher trifft in Mikro

[s,fT]=audioread('ADF_Sprache.wav')

%vektor erzeugen, u einlesen und abtastrate bestimmen, n bestimmen
V=2; %rauschen bei 18 (durch probieren) 
N=length(s) %Abtastwerte
fT=11025; %gegeben aus Aufgabe
Tt=0.1;
n=floor(Tt*fT) %abrunden wie in A2
t=0:1:N-1 %*Tt %zeitvektor
u=[t' s];
%Error using horzcat
%Dimensions of matrices being concatenated are not consistent.
%Error in aufgabe4 (line 17)
%u=[t s]

%sim starten
sim('aufgabe_4')
sound(y,fT,16)
%sound(udach,fT,16)