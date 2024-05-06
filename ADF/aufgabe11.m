clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

%Impulsantwort g der Länge N aus Datei laden
%AKF phi_Egg(k) mittels conv() berechnen und von N bis 2*N-1 darstellen (k>=0), hier plot() nutzen
%EDS aus g berechnen mittels der Funktion fft()
%AKF1 aus EDS ermitteln mit ifft() und darstellen
%Fehlersignal AKF-AKF1 darstellen
%g mit N Nullen am Ende ergänzen -> g2 der Länge 2N
%EDS2 aus g2 bestimmen
%AKF2 aus EDS2 ermitteln und das Fehlersignal berechnen AKF-AKF2 darstellen
%Vergleich von Fehlersignalen
%Energieberechnung Eg=phi_Egg(0)=1/N summe O_Egg(m)

g=load('ADF_Kanal.dat')
N=length(g)
phi_Egg=conv(g,flipud(g))
figure(1)
subplot(5,1,1)
plot(phi_Egg(N:2*N-1))
title("AKF")

EDS=abs(fft(g)).^2
AKF1=ifft(EDS)
subplot(5,1,2)
plot(AKF1)
title("AKF1")

Fehlersignal1=phi_Egg(N:2*N-1)-AKF1
subplot(5,1,3)
plot(Fehlersignal1)
title("Fehler1")

g2=[g; zeros(N,1)]
EDS2=abs(fft(g2)).^2
AKF2=ifft(EDS2)
subplot(5,1,4)
plot(AKF2(N:2*N-1))
title("AKF2")

Fehlersignal2=phi_Egg(N:2*N-1)-AKF2(N:2*N-1)
subplot(5,1,5)
plot(Fehlersignal2)
title("Fehler2")

Energie=(1/N)*sum(EDS)
Energie2=(1/(N*2))*sum(EDS2)

