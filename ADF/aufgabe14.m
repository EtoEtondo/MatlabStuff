clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

%Rauschsignal generieren: r = wurzel(Pr)*randn() mit N=100k
%Pr=-40dB = 0.0001
%Ausgangssignal erzeugen y=conv(r,g)
%phi_ry(k) mit KKF()
%Darstellung von g(k), g_dach(k) und fehler e(k)=g(k)-g_dach(k) mit subplot und stem
%Wie verändert sich der Fehler bei N1=N/10
%dazu berechnen Eg/Ee=10*log10((sum(g.^2))/(sum(e.^2))) = 40db bei N, 30db bei N1
%u=r+s ,s auf länge von r beschränken
%Darstellung von u(k), g_dach(k), e(k)

N=100000
N1=N/10
Pr=0.0001
g=zeros(1,N)
dirac=5
for j = 1:dirac
    g(j) = dirac;
    dirac = dirac-1;
end
r=sqrt(Pr)*randn(1,N)
y=conv(r,g)

phi_ry=KKF(r',y',5)
phi_ry=[phi_ry(5:9);0;phi_ry(1:4)]

g_dach=(1/Pr)*phi_ry
e=g(1:10)'-g_dach(1:10)

figure(1)
subplot(3,1,1)
stem(g(1:10))
subplot(3,1,2)
stem(phi_ry(1:10))
subplot(3,1,3)
stem(e(1:10))

g_c=[5:-1:1, zeros(1,N1-5)]
r_c=sqrt(Pr)*randn(1,N1)
y_c=conv(r_c, g_c)

phi_ry_c=KKF(r_c', y_c', 5)
phi_ry_c=[phi_ry_c(5:9); 0; phi_ry_c(1:4)]
g_dach_c=(1/Pr)*phi_ry_c
e_c=g_c(1:10)'-g_dach_c

Eg_durch_Ee=10*log10(sum(g(1:10).^2)/sum(e.^2))
Eg_durch_Ee_c=10*log10(sum(g_c(1:10).^2)/sum(e_c.^2))

[s,FS]=audioread('ADF_Sprache.wav', [1 N])
Ns=length(s)
u=r'+s
y1=conv(u,g')
phi_ry1=KKF(r',y1,5)
phi_ry1=[phi_ry1(5:9);0;phi_ry1(1:4)]

g_dach_d=phi_ry1/Pr
e_d=g(1:10)'-g_dach_d

figure(2)
subplot(3,1,1)
stem(u(1:10))
subplot(3,1,2)
stem(g_dach_d(1:10))
subplot(3,1,3)
stem(e_d(1:10))
