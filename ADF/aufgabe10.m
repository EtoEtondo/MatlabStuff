clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

%a) Zeit und Frequenzachse definieren t=0:T:(N-1)*T; mit f analog
%Spektrum berechnen S=fft(s) (ifft inverse)
%Darstellung von s, RE{S} real, Im{S} imag, |S| abs und phi(S) angle
%plot(t,real(S))
% x-Achse immer exakt auf N Werte begrenzen mit xlim([xmin xmax]) -> für t [T (N-1)*T
N=64
ft=25
T=1/ft
t=0:T:(N-1)*T
F=1/(N*T)
f=0:F:(N-1)*F
s=t.*exp(-t/0.4)
S=fft(s)

figure(1)
plot(t, s)
xlim([0 (N-1)*T])
title("s")

figure(2);
subplot(4, 1, 1)
plot(f, real(S))
xlim([0 (N-1)*F])
title("Realteil")
subplot(4, 1, 2)
plot(f, imag(S))
xlim([0 (N-1)*F])
title("Imaginärteil")
subplot(4, 1, 3)
plot(f, abs(S))
xlim([0 (N-1)*F])
title("Betrag")
subplot(4, 1, 4)
plot(f, angle(S))
xlim([0 (N-1)*F])
title("Phase")

%Sepektrum der gespiegelten Zeitfunktion (k=k*T) b)
%s1(k)=s(-k) -> S1(m)=S*(m) nach fliplr letzten Wert nach vorn verschieben
s1=fliplr(s)
s1=[s1(length(s1)) s1(1:length(s1)-1)];
S1=fft(s1)

figure(3);
plot(t, s1);
xlim([0 (N-1)*T])
title("inverse s")

figure(4);
subplot(4, 1, 1)
plot(f, real(S1))
xlim([0 (N-1)*F])
title("konjugiert komplexe Realteil")
subplot(4, 1, 2)
plot(f, imag(S1))
xlim([0 (N-1)*F])
title("konjugiert komplexe Imaginärteil")
subplot(4, 1, 3)
plot(f, abs(S1))
xlim([0 (N-1)*F])
title("konjugiert komplexe Betrag")
subplot(4, 1, 4)
plot(f, angle(S1))
xlim([0 (N-1)*F])
title("konjugiert komplexe Phase")

%Spektrum der priodischen Zeitfunktion ifft() c)
m=10
S2=S.*exp(j*2*pi*m*f/N)
s2=ifft(S2)

figure(5)
plot(t-m, s2)
xlim([-m (N-1)*T-m])
title("s2 verschoben")

figure(6);
subplot(4, 1, 1)
plot(f-m, real(S2))
xlim([-m (N-1)*F-m])
title("Realteil verschoben")
subplot(4, 1, 2)
plot(f-m, imag(S2))
xlim([-m (N-1)*F-m])
title("Imaginärteil verschoben")
subplot(4, 1, 3)
plot(f-m, abs(S2))
xlim([-m (N-1)*F-m])
title("Betrag verschoben")
subplot(4, 1, 4)
plot(f-m, angle(S2))
xlim([-m (N-1)*F-m])
title("Phase verschoben")

%Zeitsignal mit N Nullen ergänzen d)
T3=T
N3=2*N
F3=1/(T3*N3)
s3=[s, zeros(1,N)]
f3=0:F3:(N3-1)*F3
t3=0:T3:(N3-1)*T3
S3=fft(s3)

figure(7);
plot(t3, s3);
xlim([0 (N3-1)*T3])
title("inetrpoliert im Frequenzbereich s")

figure(8);
subplot(4, 1, 1)
plot(f3, real(S3))
xlim([0 (N3-1)*F3])
title("interpoliert im Frequenzbereich Realteil")
subplot(4, 1, 2)
plot(f3, imag(S3))
xlim([0 (N3-1)*F3])
title("interpoliert im Frequenzbereich Imaginärteil")
subplot(4, 1, 3)
plot(f3, abs(S3))
xlim([0 (N3-1)*F3])
title("interpoliert im Frequenzbereich Betrag")
subplot(4, 1, 4)
plot(f3, angle(S3))
xlim([0 (N3-1)*F3])
title("interpoliert im Frequenzbereich Phase")

%Spektrum mit N Nullen mittig ergänzen e)
N4=2*N
F4=F
T4=1/(N4*F4) %=T/2
S4=[S(1:N/2), zeros(1,N), S(N/2+1:N)]
f4=0:F4:(N4-1)*F4
t4=0:T4:(N4-1)*T4
s4=ifft(S4)

figure(9);
plot(t4, real(s4));
xlim([0 (N4-1)*T4])
title("inetrpoliert im Zeitbereich s")

figure(10);
subplot(4, 1, 1)
plot(f4, real(S4))
xlim([0 (N4-1)*F4])
title("interpoliert im Zeitbereich Realteil")
subplot(4, 1, 2)
plot(f4, imag(S4))
xlim([0 (N4-1)*F4])
title("interpoliert im Zeitbereich Imaginärteil")
subplot(4, 1, 3)
plot(f4, abs(S4))
xlim([0 (N4-1)*F4])
title("interpoliert im Zeitbereich Betrag")
subplot(4, 1, 4)
plot(f4, angle(S4))
xlim([0 (N4-1)*F4])
title("interpoliert im Zeitbereich Phase")