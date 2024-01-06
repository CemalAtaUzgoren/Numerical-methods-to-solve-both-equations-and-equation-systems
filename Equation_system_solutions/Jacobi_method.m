function [root_matrix] = Jacobi_method(matrix,incon,epsilon_s)
%This function solves the given agumented matrix(n,n+1) by using the jacobi
%method and returns a vector that contains the roots of the system of
%equations

%PARTİAL PİVOTİNG%(partial pivoting is obligatory for jacobi iteration)
for j=1:1:size(matrix,2)-2%for columns
    eb=j;
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
end
matrix_reminder=matrix;%equations must remain same

%İTERATİONS FOR ROOT FİNDİNG
epsilon_a=[];
epsilon_eb=[];
iter=[];
counter=1;
a=1;
while a==1
    matrix=matrix_reminder;
    c=1;
    for i=1:1:size(matrix,1)%row
        for j=1:1:size(matrix,1)%column
            if c==j
               continue
            end
        matrix(i,j)=matrix(i,j)*incon(j);
        matrix(i,size(matrix,2))=matrix(i,size(matrix,2))-matrix(i,j);
       end
        matrix(i,size(matrix,2))=matrix(i,size(matrix,2))/matrix(i,c);%root candidate
        c=c+1;
    end
    incon_reminder=incon;
    for k=1:1:size(matrix,1)%this loop is out of the "row" loop because of the requirements of the jacobi method      
       incon(k)=matrix(k,size(matrix,2)); %updating the incon
    end
    %error calculation
    if counter~=1
        for e=1:1:size(matrix,1)
            epsilon_a(counter,e)=((incon(1,e)-incon_reminder(1,e))/incon(1,e))*100;
            if e>1 && epsilon_a(counter,e)>epsilon_a(counter,e-1)
                eb_ep=epsilon_a(counter,e);
                epsilon_eb(counter)= eb_ep;
            elseif e>1 
                 eb_ep=epsilon_a(counter,e-1);
                 epsilon_eb(counter)= eb_ep;
            end
        end
        if eb_ep< epsilon_s
           root_matrix=incon.';
           a=a+1;
        end
    end
    iter(counter)=counter;
    counter=counter+1;
end
plot(iter,epsilon_eb);
grid on
xlabel('iteration')
ylabel('error')
hold on

end