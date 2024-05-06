clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles


%g(kT)
%Laden von gk mit load('dateiname')
%Darstellung über der Zeit k*T von 0 bis (n-1)*T 
%n ist länge der Stoßantwort anzahl der abtastwerte, ordnung des systems
%D mittels v und Tt berechnen

gk=load('ADF_Kanal.dat') %gibt array zurück
T=1/11025 %gegeben aus Aufgabe
n=length(gk)
k = 0:1:n-1
figure(1)
plot(k*T,gk)

vs=1200000/3600
%durch ablesen von gk sieht man, dass beim 18. Element der Wert +-0.1
%überschreitet/unterschreitet -> i=17, i*T=Tt
D=vs*T*17 %da soll ungefähr ein halber meter rauskommen -> 0.514

%N=20000 Abtastwerte in Vektor S_n
%Ausgangssignal mit conv berechnen und Ausgabe mit sound
%Ausgangssignal als Skalarprodukt berechnen y(k)=S(k)transponiert*g
%skalarmultiplikation mit Vektor S(k) g
%neu bilden S(k) der länge n in einer for Schleife mit 0<=k<=N+n-2 aus dem
%Signalvektor S_n laden und damit y(k) berechnen
%Dazu den Vektor S_n zuvor mit 0en ergänzen zeros(), um einen Indexfehler bei k<n
%und k>N zu vermeiden, S_n0 als Zeilenvektor bilden
%s(k) nach dem Auslesen asu Sn0 noch spiegeln für neuste Wert! -> mit fliplr(array) oder
%flipud(array) oder rot90(aray)

N=20000
[s,FS]=audioread('ADF_Sprache.wav')
y_conv=conv(gk,s(1:N))
sound(y_conv,FS)

%s_n=[zeros([n-1,1]);s;zeros([n-1,1])] %vorne hinten 0en, mitte s alternative Lösung
s_n2 = [zeros(1, n-1), s', zeros(1, n-1)]
for k = 1:1:N+n-1   %n-1 da wir von 1 anfangen statt n-2
    %y_skalar(k)=flipud(s_n(k:k+n-1))'*gk       alternative Lösung (Fehlerhaft)
    s_n_flip = fliplr(s_n2(k:k+n-1));       
    y_skalar2(k) = s_n_flip * gk';          
end

%Vergleich Lösungen mittels plot, subplot -> Graphen müssen gleich aussehen!
figure(2)
subplot(2,1,1)
plot(y_conv)
subplot(2,1,2)
plot(y_skalar2)