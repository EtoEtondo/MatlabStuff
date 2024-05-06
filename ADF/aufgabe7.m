clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

%Autokorrelation des Sprachsignals s(k) mit KKF berechnen
%Kmax=100, Aufruf mit phi_uv=KKF(s,s,100)
%Mittelwert rekursive Mittelwert

[s,FS]=audioread('ADF_Sprache.wav')
N=30000
kmax=100
phi_uv=KKF(s,s,kmax)
figure(1)
plot(phi_uv)
k = -(kmax-1):1:(kmax-1);
%Leistung P=phi_ss(0)
P=phi_uv(kmax)

figure(2)
phi1 = KKF(s(1:N), s(1:N), kmax);
subplot(3, 1, 1);
plot(k, phi1);

phi2 = KKF(s(N+1:2*N), s(N+1:2*N), kmax);
subplot(3, 1, 2);
plot(k, phi2);

phi3 = KKF(s(2*N+1:3*N), s(2*N+1:3*N), kmax);
subplot(3, 1, 3);
plot(k, phi3); %sehen ähnlich aus

%Bedingung N>>kmax aus VL gilt