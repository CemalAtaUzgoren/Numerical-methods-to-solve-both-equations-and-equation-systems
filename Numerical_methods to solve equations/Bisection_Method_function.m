function [root] = Bisection_Method_function(Xl,Xu,n,f)
%This function calculates the given function's root by bisection method and
%returns it as output.

epsilon_s= 0.5*(10^(2-n));
counter=0;
while 1
    if f(Xl)*f(Xu) >0
        fprintf('There is no root between chosen Xl and Xu.')
        root=null(1);
        return
    end
    Xr=(Xl+Xu)/2;
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
fprintf('ROOT BİSECTİON=%d\n',Xr);
figure(2)
plot(iter,error,'r',LineWidth=1);
title('Bisection Method')
axis([0 counter 0 inf]);
xlabel('iteration')
ylabel('Aproximate Error')
grid on
end