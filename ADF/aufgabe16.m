clear %löscht Arbeitsspeicher
home %scrolled command window (oder clc löscht cw)
close all %schließt alles

T=0.1
N=30
R=25
A=[1 T; 0 1]
b=0
c=[1 0]
d=0
E=eye(2)
y=load('ADF_Position.txt')
lambda=1

X(1:2,1) = [0; 0]
P=[1000 0; 0 1000]

for i=1:N
    X(1:2,i+1)=A*X(1:2,i);
    P=A*P*A'*1/(lambda^2);
    K=P*c'*((c*P*c'+R)^-1);
    X(1:2,i+1)=X(1:2,i+1)+K*(y(i)-c*X(1:2,i+1));
    P = (E-K*c)*P;
end

figure(1)
plot(y(1:N), 'o');
hold on;
plot(X(1, 1:N))

figure(2)
plot(X(2, 1:N))
hold on;

%Änedrung von X keine wirklichen Änderungen beobachtet
%P sehr klein -> Konvergenz schlecht
%lambda kleiner -> eher gestaucht?