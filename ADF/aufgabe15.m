clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

N=40000
ft=10000
T=1/ft
k=0:1:N-1
f=500
As=sqrt(2*10^(-20/10))
s=As*sin(2*pi*f*k*T)

Ab=0.1
b=Ab*randn(1,N)
u=s+b
%sound(u)
n=50
Pb=Ab^2
phi_bb=diag(Pb*ones(n,1),0)
phiss=KKF(s, s, n)
phi_ss=diag(phiss(1)*ones(n,1),0)

for i = 1:n-1
    phi_ss = phi_ss + diag(phiss(i)*ones(n-i, 1), i);
    phi_ss = phi_ss + diag(phiss(i)*ones(n-i, 1), -i);
end

beta_opt=(phi_bb+phi_ss)^(-1) * phi_ss(:,1)
%beta_column=beta_opt(:,1,:)
y=conv(u,beta_opt)
%sound(y) %n größer wählen um rauschen zu verringern

figure(1)
subplot(3,1,1)
stem(s(1:500))
subplot(3,1,2)
stem(u(1:500))
subplot(3,1,3)
stem(y(1:500))

[sd,FS]=audioread('ADF_Sprache.wav', [1 N])

ud1=sd'+b
ud2=sd'+s

phidd=KKF(sd, sd, n)
phi_dd=diag(phidd(1)*ones(n,1),0)

for i = 1:n-1
    phi_dd = phi_dd + diag(phidd(i)*ones(n-i, 1), i);
    phi_dd = phi_dd + diag(phidd(i)*ones(n-i, 1), -i);
end

beta_opt_1=(phi_dd+phi_ss)^(-1) * phi_dd(:,1)
beta_opt_2=(phi_bb+phi_ss)^(-1) * phi_dd(:,1)

y1=conv(ud1,beta_opt_1)
y2=conv(ud2,beta_opt_2)

%sinus klingt besser
%sound(y1)
%sound(y2)




