clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles


%Vektor x_1N soll N=10k zufällige Würfelergebnisse (1-6) enthalten
%Berechnung von x_1N mit rand(1,N) - liefert Zeilenvektor mit N
%gleichverteilten Zufallszahlen im Bereich 0 bis 1
%und ceil() - rundet auf nächstgrößere integer zahl ceil(6 * rand(1,N));
%Aus x_1N Erwartungswert und Varianz berechnen, sum()
%Häufigkeitverteilung h(x_1N) mit hist(x_1N, h) darstellen (Histogram) 
%-> h: Vektor mit Häufigkeitklassen, d.h. h=[1:6]

N=10000
anz=6
x_1N = ceil(6 * rand(1,N))
x_2N = ceil(6 * rand(1, N))
h=[1:6]
E_x1N = (1/N) * sum(x_1N)
var_x1N = (1/N) * sum(x_1N.^2 - E_x1N^2)
E_x2N = (1/N) * sum(x_2N)
var_x2N = (1/N) * sum(x_2N.^2 - E_x2N^2)
figure(1)
hist(x_1N,h)

%neue Zufallsvariable y1=2*x1-1
%Stichprobe y_1N aus x_1N berechnen
%wie oben E var hist von y_1N berechnen

E_x1 = sum(h)/length(h);
E_x2 = sum(h)/length(h);
var_x1 = sum(h.^2 - E_x1^2)/length(h);
y1=2*h-1
y_1N = 2*x_1N-1;
E_y1N = (1/N) * sum(y_1N)
var_y1N = (1/N) * sum(y_1N.^2 - E_y1N^2)
E_y1=sum(y1)/anz
var_y1 = sum(y1.^2 - E_y1^2)/anz;
figure(2)
hist(y_1N,y1)

%x_2n sei Stichprobe von x2, x2 gehe ebenfalls aus einem Würfelexperiment hervor
%x2 ist unabhängig von x1
%Bilde y2 = x1-x2
%Wieder E var von y2

y2=[-5:1:5]
anz2=11
y_2N = x_1N - x_2N
E_y2N = (1/N) * sum(y_2N)
var_y2N = (1/N) * sum(y_2N.^2 - E_y2N^2)
E_y2=sum(y2)/anz2
%var_y2 = sum(y2.^2 - E_y2^2)/anz2
var_y2 = 2*var_x1
figure(3)
hist(y_2N,y2)

%darstellung mit scatter(x_1N, x_2N)
%Analog cov(x_1N, y_1N) und cov(x_1N, y_2N)

cov_x1N_x2N = 1/N * sum(x_1N.*x_2N-E_x1N*E_x2N)
figure(4)
scatter(x_1N,x_2N)

cov_x1N_y1N = 1/N * sum(x_1N.*y_1N-E_x1N*E_y1N)
figure(5)
scatter(x_1N,y_1N)

cov_x1N_y2N = 1/N * sum(x_1N.*y_2N-E_x1N*E_y2N)
figure(6)
scatter(x_1N,y_2N)