%clear %löscht Arbeitsspeicher
%home %scrolled command window (oder clc löscht cw)
%close all %schließt alles

%Aufgabe als Funktion deklarieren dann sind Matlab Unterfunktionen möglich
%DFT() und iDFT jeweils mit 2 verschachtelten for Schleifen implementieren
%Eingabe des Testsignals mit ":", fliplr() und zeros() sollte länge 32 haben!
%Plotten des real -und imaginärTeils von S(m)
%Nach Rücktransformation nur Realteil von s(k) plotten

function aufgabe8()
%Error: File: aufgabe8.m Line: 12 Column: 10
%Function with duplicate name "aufgabe8" cannot be defined.
%clear Auskommentiert und es klappt
N = 32
t=0:1:N-1 %ohne dies gäbe es eine Autoskalierung
f=0:1/N:(N-1)*(1/N)
s=10:-1:0
s=[s, zeros(1, N - 11)]
S=DFT(s)
s_=iDFT(S)
figure(1)
subplot(4,1,1)
plot(t,s)
subplot(4,1,2)
plot(t,real(s_))
subplot(4,1,3)
plot(f,real(S))
subplot(4,1,4)
plot(f,imag(S))
%Quelle https://de.mathworks.com/help/matlab/ref/real.html
%https://de.mathworks.com/help/matlab/creating_plots/plot-imaginary-and-complex-data.html
end


function S=DFT(s)
    N=length(s)
    S=zeros(1,N)
    for m=1:N
        for k=1:N
            S(m)=S(m)+s(k)*exp(-j*2*pi*m*k/N);
        end
    end
end

    
function s=iDFT(S)
    N=length(S)
	s=zeros(1,N)
	for k=1:N
        for m=1:N
            s(k)=s(k)+S(m)*exp(j*2*pi*m*k/N);
        end
        s(k)=s(k)*1/N;
	end
end


%A9 (freiwillig) Erstellung Matrix w_32
%quadratische NxN Matrix erstellen mit ones(), der Elemente jeweils den Wert w_N aufweisen
%dann 2. NxN Matrix erzeugen welche die Exponenten von w_32 enthält
%dazu Vektor erzeugen V[0...31]
%M als Matrixprodukt aus V generieren, ergibt sich elementweise
%Potenzierung .^ Operator, S=w_32*s,s=inv(w_32)*S
%Plotten wie A8 Realteil bilden