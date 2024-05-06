clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

%R=3.4 + (2.7-3.4).*rand(100,1)

N = 100;
u_o= 0;
u_end = 12;
R = [2.6 3.4];
delta_u=(u_end-u_o)/N

u = u_o:delta_u:u_end

for n = 1:1:N
    R = 3+(2*rand-1)*0.4;
    i(n)= u(n) / R
end

[r,m,b]=regression(u(1:N),i)
R_est=1/m

plot(u(1:N), i, 'o', u(1:N), m*u(1:N) + b)
xlabel("V")
ylabel("A")
