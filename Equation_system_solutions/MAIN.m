clc
clear all
%%%%%%%%%%%%%%%%%%%
%%HOMEWORK 3 MAİN%%
%%%%%%%%%%%%%%%%%%%

%GİVEN MATRİX%
matrix=[-100,20,0,0,0;
        20,-80,60,0,0;
        0,60,-260,200,0;
        0,0,-200,200,15000];


%GAUSS ELEMİNATİON METHOD%
gauss=Gauss_elemination(matrix);%calling Gauss_elemination function
fprintf('ROOTS FOUND BY GAUSS ELEMİNATİON METHOD\n');
for i=1:1:size(matrix,1)
    fprintf('X%d=%d\n',i,gauss(i));
end

%THOMAS ALGORİTHM%
thomas=Thomas_algorithm(matrix);%calling Thomas_algorithm function
fprintf('\nROOTS FOUND BY THOMAS ALGORİTHM\n');
for i=1:1:size(matrix,1)
    fprintf('X%d=%d\n',i,thomas(i));
end
%JACOBİ İTERATİON METHOD%
incon=[0,0,0,0];
jacobi=Jacobi_method(matrix,incon,0.0002);
fprintf('\nROOTS FOUND BY JACOBİ METHOD\n');
for i=1:1:size(matrix,1)
    fprintf('X%d=%d\n',i,jacobi(i));
end
%GAUSS SEİDEL İTERATİON METHOD%
incon=[0,0,0,0];
seidel=Gauss_seidel_method(matrix,incon,0.0002);
fprintf('\nROOTS FOUND BY GAUSS SEİDEL METHOD\n');
for i=1:1:size(matrix,1)
    fprintf('X%d=%d\n',i,seidel(i));
end
%SOR METHOD%
incon=[0,0,0,0];
sor=SOR_method(matrix,incon,0.0002,0.8);
fprintf('\nROOTS FOUND BY SOR METHOD\n');
for i=1:1:size(matrix,1)
    fprintf('X%d=%d\n',i,sor(i));
end
legend('jacobi','gauss seidel','SOR')