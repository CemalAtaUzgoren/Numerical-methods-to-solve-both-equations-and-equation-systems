function [root] = Secan_Method_Function(f,X01,X02,n)
%This function calculates the given function's root by Secand method and
%returns it as output.
epsilon_s= 0.5*(10^(2-n));
i=1;
while 1
   X=X02-((f(X02)*(X01-X02))/(f(X01)-f(X02)));
   epsilon_a=abs((X-X02)/X)*100;
    error(i)=epsilon_a;
    iter(i)=i;
   if epsilon_a <= epsilon_s
        root=vpa(X,n);
        break
   end
   X01=X02;
   X02=X;
   i=i+1;
end
fprintf('ROOT SECAND METHOD=%d\n',X);
figure(6)
plot(iter,error,'r',LineWidth=1);
title('secand Method');
axis([0 i 0 inf]);
xlabel('iteration')
ylabel('Aproximate Error')
grid on
end