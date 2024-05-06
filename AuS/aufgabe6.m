clear all

U0=12
Ml=0
R=3
ke=24e-3
km=23e-3
Cr=5e-6
L=400e-6
J=3e-6

w0=120
D=0.48

%ki=2
%kp=5

kp=1/km * (2*D*w0*J*R-ke*km-Cr*R)
ki=(J*R)/km * w0^2