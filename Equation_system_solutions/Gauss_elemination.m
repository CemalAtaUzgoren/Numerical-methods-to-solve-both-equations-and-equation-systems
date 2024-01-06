function [root_matrix] = Gauss_elemination(matrix)
%This function solves the given agumented matrix(n,n+1) by using the gauss elemination
%method and returns a vector that contains the roots of the system of
%equations
%you are able to solve not only the matrix that is given at the question but also every agumented matrix.(I have made for extra)

for j=1:1:size(matrix,2)-2%for columns
    eb=j;
    %PARTİAL PİVOTİNG%(optional for gauss elemination)
    for i=j:1:size(matrix,1)-1%for rows
        %magnitude control
        if abs(matrix(j,j))<=abs(matrix(i+1,j))
            which_row=i+1;
            eb=which_row;
        else
            which_row=eb;
        end
    end
    %exchanging the rows
    reminder=matrix(j,:);
    matrix(j,:)=matrix(which_row,:);
    matrix(which_row,:)=reminder;

    %MAKİNG ESHOLON FORM%
    for k=j+1:1:size(matrix,1)
        if matrix(j,j)*matrix(k,j)<0
            matrix(k,:)=matrix(k,:)+((abs(matrix(k,j))/abs(matrix(j,j)))*matrix(j,:));
        elseif matrix(j,j)*matrix(k,j)>0
            matrix(k,:)=matrix(k,:)-((matrix(k,j)/matrix(j,j))*matrix(j,:));
        end
    end
end
%FİNDİNG THE ROOTS%
count=size(matrix,2)-1;
flag=1;
root=[];
for t=size(matrix,1):-1:1
    x=matrix(t,size(matrix,2));
    for m=size(matrix,2):-1:2
        if count~=m-1
        x=x-matrix(t,m-1);
        end
    end
    x=x/matrix(t,count);
    root(t,1)=x;
    for y=size(matrix,1)-flag:-1:1
    matrix(y,count)=root(t,1)*matrix(y,count);
    end
    count=count-1;
    flag=flag+1;
end
root_matrix=root;
end