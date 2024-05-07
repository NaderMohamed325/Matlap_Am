clc;
clear ;
fs =100 ;
t=0:1/fs :100;
fm=1;%modulating sigal frequency
fc=10;
x=cos(2*pi*fm*t) %modulating signal
plot(t,x)
axis([0 10 -1 1])