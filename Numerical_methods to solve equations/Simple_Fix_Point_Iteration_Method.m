function [root] = Simple_Fix_Point_Iteration_Method(f,X0,n)
%This function calculates the given function's root by simple fix point method and
%returns it as output.
epsilon_s= 0.5*(10^(2-n));
syms F(x)
F(x)=f;
derivative=inline(diff(F(x),x),'x');
if derivative(X0) >= 1
    fprintf('The function that you use is not converge to a value');
    root=null(1);
    return 
end
i=1;
while 1
    X=f(X0);
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
fprintf('ROOT SİMPLE FİX POİNT=%d\n',X);
figure(4)
plot(iter,error,'r',LineWidth=1);
title('Simple fix point method');
axis([0 i 0 inf]);
xlabel('iteration')
ylabel('Aproximate Error')
grid on
end