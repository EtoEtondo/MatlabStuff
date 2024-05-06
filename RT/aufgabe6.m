clear all
s = tf('s')
Ls=0.1*(1/((s/40)+1))*(1/((s/40)-1))
L=160/(s^2-40^2)

figure(1)
bode(Ls)
figure(2)
bode(L)