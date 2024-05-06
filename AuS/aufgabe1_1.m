clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

N=100
Km_dev = 0.003
Km_mean = 0.023
radius=0.01
delta_i=(2-0)/N
i=0:delta_i:2

for n = 1:1:N
    Km = Km_mean + (2*rand - 1)*Km_dev
    f(n) = i(n)*Km / radius
end

[r,m,b] = regression(i(1:N),f * radius);
Km_est=m;
plot(i(1:N),f * radius,'o',i(1:N),m*i(1:N)+b)
grid
