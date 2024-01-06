function [] = Grafical_Method()
%This function plots the given function's graphic and allows us to
%observe the function's root with  bare eyes.
x=0:0.02:4*pi;
f=(x.^3) - sin(x);
F=f;
figure(1);
plot(x,F);
title('Grafical Method')
grid on
end