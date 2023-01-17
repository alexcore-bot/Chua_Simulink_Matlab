%CHUA'S DIODE
clear all; close all; clc;

a = 15.6; 
b = 28;

m = -1.143;
n = -0.714;

x = -2:0.01:2;
g = n*x+0.5*(m-n)*(abs(x+1)-abs(x-1)); 

d = 2;
a1 = -(35*(((d.^2) - 1).^2))*(m-n)/(16*d.^7);
b1 = ((45*(d.^4) - 50*(d.^2) + 21)*(m-n)/(16*d.^5)) +n;
h = a1*x.^3 + b1*x;

plot(x,g,'b')
hold on 
grid on
plot(x,h,'r')
xlabel('x') 
ylabel('g , h') 
