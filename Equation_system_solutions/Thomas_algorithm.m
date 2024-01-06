function [root_matrix] = Thomas_algorithm(matrix)
%This function makes manuplations on the given 3 diagonal matrix 
% to solve the system of equations. 

%CREATİNG THE DİAGONAL MATRİXES
upper_diagonal=[];%c
diagonal=[];%b
lower_diagonal=[];%a
agumented=[];

for n=1:1:size(matrix,1)-1
    upper_diagonal(n)=matrix(n,n+1);
    lower_diagonal(n)=matrix(n+1,n);
    diagonal(n)=matrix(n,n);
    agumented(n)=matrix(n,size(matrix,2));
    if n==size(matrix,1)-1
       diagonal(n+1)=matrix(n+1,n+1);
       agumented(n+1)=matrix(n+1,size(matrix,2));
    end
end

%ELEMİNATİON/DECOMPOSİTİON
pvtCoff=[];
for k=1:1:size(matrix,1)-1
    pvtCoff(k)=lower_diagonal(k)/diagonal(k);
    diagonal(k+1)=diagonal(k+1)-(pvtCoff(k)*upper_diagonal(k));
end

%FORWARD SUBSTİTUTİON
for k=2:1:size(matrix,1)
    agumented(k)=agumented(k)-(pvtCoff(k-1)*agumented(k-1));
end

%BACWARD SUBSTİTUTİON
root=agumented./diagonal;
for i=size(matrix,1)-1:-1:1
    root(i)=(agumented(i)-(upper_diagonal(i)*root(i+1)))/diagonal(i);
end
root_matrix=root.';

