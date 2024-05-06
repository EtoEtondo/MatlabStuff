clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

%b=randn(M,1), mit E(b)=0 var(b)=1, Darstellung mit hist(b,50) 50 = Anzahl der Häufigkeitsklassen
%zusammenhang zwischen varianz von b und dessen leistung
%var(b)=Pb-[E(b)]^2
%Autokorrelation vergleiche A7
%phi_bb=KKF(b,b,k_max)

M=50000
b=randn(M, 1)
E_b=sum(b)/M
var_b=sum(b.^2 - E_b.^2)/M
P_b1=var_b + E_b.^2
figure(1)
hist(b, 50)

kmax=50
phi_bb=KKF(b, b, kmax)
figure(2)
stem(phi_bb)

phi_bb=[phi_bb(50:99); 0; phi_bb(1:49)]
figure(3)
stem(phi_bb)

N=100
PHI_bb=fft(phi_bb)
figure(4)
stem(real(PHI_bb))

P_b=sum(real(PHI_bb))/N

L=M/N
b_k=zeros(N, L)
B_m=zeros(N, L)
PHI_bb_j=zeros(N, L)
%Fenster und transformieren
for i = 1:L
    b_k(:, i)=b(i*N - (N-1) : i*N);
    B_m(:, i)=fft(b_k(:, i));
    PHI_bb_j(:, i)=abs(B_m(:, i)).^2/N;
end

%Mittelung
PHI_mittel_bb=(sum(PHI_bb_j, 2)/L);

%Rekursiv
PHI_bb_i=zeros(N, L)
PHI_bb_i(:, 1)=PHI_bb_j(:, 1)
for i = 2:L
   PHI_bb_i(:, i)=sum(PHI_bb_i(:, i-1))*(i-1)/i/N + PHI_bb_j(:, i)/i;
end

[s,FS]=audioread('ADF_Sprache.wav')
Ms=length(s)

kmax=50
phi_ss=KKF(s,s,kmax)
figure(5)
stem(phi_ss)

phi_ss=[phi_ss(50:99); 0; phi_ss(1:49)]
figure(6)
stem(phi_ss)

N=100
PHI_ss=fft(phi_ss)
figure(7)
stem(real(PHI_ss))

P_b=sum(real(PHI_ss))/N

L=floor(Ms/N)
s_k=zeros(N, L)
S_m=zeros(N, L)
PHI_ss_j=zeros(N, L)
for i = 1:L
    s_k(:, i)=s(i*N - (N-1) : i*N);
    S_m(:, i)=fft(s_k(:, i));
    PHI_ss_j(:, i) = abs(S_m(:, i)).^2/N;
end

PHI_mittel_ss=(sum(PHI_ss_j, 2)/L)

PHI_ss_i=zeros(N, L)
PHI_ss_i(:, 1)=PHI_ss_j(:, 1)
for i = 2:L
   PHI_ss_i(:, i)=sum(PHI_ss_i(:, i-1))*(i-1)/i/N + PHI_ss_j(:, i)/i;
end
