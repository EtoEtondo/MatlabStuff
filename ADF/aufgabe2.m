clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

%a)
%vorher audioread laden
% s(k) -> ge(k) -> ue(k) = s(k)+s(k-n)*0,8   
%n=floor(0.1*ft) nach unten runden
%alternativ ue(k)=s(k)*ge(k)=s(k)*d(k)
%ge(k)=(d(k)+0,8*d(k-n))
%ge=zeros(1,n); ge(1)=1; ge(n)=0,8; vektor mit 0en erstellen und werte eintragen
%ue = conv(s,ge)

[s,FS]=audioread('ADF_Sprache.wav') %wie in A1
info=audioinfo('ADF_Sprache.wav')
qbits=info.BitsPerSample
n=floor(0.2*FS) %Verzögerungszeit 200ms
ge=zeros(1,n)
ge(1)=1 %erster start
ge(n)=0.6 %zweites start signal 60% Reflektion
ue=conv(s,ge)
sound(ue,FS,qbits) %hat ein echo

%b) s(k)->ge(k)->ue(k) gekoppeltesAusgangssignal->y(k)
%   s(k)->gkomp(k)-> nach oben addiert Knoten
%ggesamt=g+gkomp=d(k)+0,8d(k-n)+gkomp=d(k) -> gkomp

gkomp=zeros(1,n)
gkomp(n)=-0.6 %um Verzerrung zu beheben, (die 1 nötig zum starten, dirac) lauter leiser
gges=ge+gkomp
ue2=conv(s,gges)
sound(ue2,FS,qbits) %ohne echo