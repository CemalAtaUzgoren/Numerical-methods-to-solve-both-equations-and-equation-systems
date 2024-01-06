function [root] = False_Position_Method_function(Xl,Xu,n,f)
%This function calculates the given function's root by False position Method and
%returns it as output.

epsilon_s= 0.5*(10^(2-n));
counter=0;
while 1
    if f(Xl)*f(Xu) >0
        fprintf('There is no root between chosen Xl and Xu.')
        root=null(1);
        return
    end
    Xr=Xu-((f(Xu)*(Xl-Xu))/(f(Xl)-f(Xu)));
    if counter~=0
        epsilon_a=abs((Xr-Xr_old)/Xr)*100;
        iter(counter)=counter;
        error(counter)=epsilon_a;
        if epsilon_s>epsilon_a
            root=vpa(Xr,n);
            break
        end
    end
     if f(Xu) * f(Xr) < 0
        Xl=Xr;
     elseif f(Xl) * f(Xr) < 0
            Xu=Xr;
     end
 Xr_old=Xr;
counter=counter+1;
end
fprintf('ROOT FALSE POSİTİON METHOD=%d\n',Xr);
figure(3)
plot(iter,error,'r',LineWidth=1);
title('False position method');
xlabel('iteration')
ylabel('Aproximate Error')
grid on
end