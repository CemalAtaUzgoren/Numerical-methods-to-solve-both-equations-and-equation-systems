
clc
close all

% % %HOMEWORK-2% % %

% % % %QUESTİON ONE% % % %
F=@(x) (x^3) - sin(x);
%a-)Grafical Method%
Grafical_Method();
%b-)Bisection Method%
root_bisec=Bisection_Method_function(0.8,6,8,F);
%c-)False Position Method%
root_falsepos=False_Position_Method_function(0.8,6,8,F);
%d-)Simple Fixed Point İteration Method%
X=@(x) (sin(x))^(1/3);
root_Fixedpoint= Simple_Fix_Point_Iteration_Method(X,5,8);
%e-)Newton Raphson Method%
root_NewtonRaphson=Newton_Raphson_method(F,3,8);
%f-)Secand Method%
root_sec=Secan_Method_Function(F,5,8,8);

