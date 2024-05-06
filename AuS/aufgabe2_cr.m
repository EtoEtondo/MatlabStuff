clear all
load('Cr_file')
figure(1)
plot(W(:,1),Mm(:,1),W(:,2),Mm(:,2),W(:,3),Mm(:,3),W(:,4),Mm(:,4),'Linewidth',2) %für 12V (:,4)
grid
title('Motorkennlinien')
xlabel('rad/s')
ylabel('Nm')
legend('3 V', '6 V', '9 V', '12 V')
axis([0 500 0 0.1])

%von den letzten Übungen
R=3
km=0.0232
U0=12
ke=0.024
Ml=0
L=400e-6

i=(U0-(ke*W(:,4)))/R
Cr=((km*i)-Mm(:,4))./W(:,4)
%[r m Cr_]  = regression(W, Cr)
h = mean(Cr(1:99))