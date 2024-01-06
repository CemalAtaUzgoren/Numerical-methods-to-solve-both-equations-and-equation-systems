function [root] = Newton_Raphson_method(f,X0,n)
%This function calculates the given function's root by Newton Raphson method and
%returns it as output.
epsilon_s= 0.5*(10^(2-n));
i=1;
syms F(x)
F(x)=f;
derivative=inline(diff(F(x),x),'x');
while 1
   X=X0-((f(X0)/(derivative(X0))));
   epsilon_a=abs((X-X0)/X)*100;
    error(i)=epsilon_a;
    iter(i)=i;
   if epsilon_a <= epsilon_s
        root=vpa(X,n);
        break
   end
   X0=X;
   i=i+1;
end
fprintf('ROOT NEWTON RAPHSON=%d\n',X);
figure(5)
plot(iter,error,'r',LineWidth=1);
title('Newton Raphson Method');
axis([0 i 0 inf]);
xlabel('iteration')
ylabel('Aproximate Error')
grid on
end