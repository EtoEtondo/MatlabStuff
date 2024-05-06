clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

%a)
%load handel
%sound(y,Fs)

[s,FS]=audioread('ADF_Sprache.wav') %s sample Data, Fs sample rate = Abtastrate
info=audioinfo('ADF_Sprache.wav')
qbits=info.BitsPerSample %Quantisierungsbits
sound(s,FS,qbits)

%wav Format: - Container für digitale Signale, 
%-enthält meist unkomprimierte Abtastwerte (PCM=PlusCodeModulation)
%-unterstützt mehrere Kanäle, struktur besteht aus einer squenz von
%datenpaketen:
%davon erforderlich -> RIFF-Chunk identifiziert wav-Datei
%Format Chunk enthält die Abtastrate und quantisierung
%Data chunk enthählt Abtastwerte
%Abtastung Für 8 Amplitudenwerten sind 3 bits nötig -> ld(8) min 000 max 7 111
%Sprachabtastung: 8bit * 4 * 10^3/s * 2 = 64kbit/s

%b)
N=length(s)
T=1/FS
t=0:T:(N-1)*T %T*1000 für ms
figure(1)
subplot(2,1,1)
plot(t,s)
xlabel('t')
ylabel('s(t)')
title('Zeit')

subplot(2,1,2)
plot(s)
xlabel('k')
ylabel('s(k)')
title('Index')

%Ausgabe mit plot(s) mit s(k) k -> besser plot(t,s)   
%T: Abtastzeit, ft=1/T Abtastrate, N Anzahl Abtastwerte length(s),
%t=0:T:(N-1)*T