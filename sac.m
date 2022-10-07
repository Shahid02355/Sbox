function [SS] = sac(A,B,n)
m=size(A,1)*size(A,2);
A=reshape(A,1,m);
B=reshape(B,1,m);
U=de2bi(A,n);
V=de2bi(B,n);
D=eye(n,n);
x=[];xd=[];fx=[];fxd=[];S=[];
SS=[];

for i=1:n
    for j=1:m
        x(j,:)=U(j,:);
        fx(j,:)=V(j,:);
        xd(j,:)=xor(x(j),D(i,:));
        for k=1:m
            if(xd(j,:)==U(k,:))
                fxd(j,:)=V(k,:);
            end
        end
       
        S(j,:)=xor(fx(j,:),fxd(j,:));
    end
    SS(i,:)=(1/m).*sum(S);
    x=[];xd=[];fx=[];fxd=[];S=[];
end





end





