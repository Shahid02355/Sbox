function [Nf] = nonlinear(U,V,n)
%Nonlinear property
U=reshape(U,1,size(U,1)*size(U,2));
V=reshape(V,1,size(V,1)*size(V,2));
m=length(U);
A=zeros(m,n);
B=zeros(m,n);
C=zeros(m,n);
F=zeros(m,n);
G=zeros(m,1);
% K=[1 0 0 0 0 0 0 0];
w=0:15;
p=length(w);
S=zeros(1,p);
Nf=[];
for k=1:n
for j=1:p
    for i=1:m
        A(i,:)=de2bi(U(i),n);
        F(i,:)=de2bi(V(i),n);
        B(i,:)=de2bi(w(j),n);
        C(i,:)=and(A(i,:),B(i,:));
%         if(mod(sum(C(i,:)),2)~=0)
%           F(i,:)=xor(F(i,:),1);
%         end
if(mod(sum(C(i,:)),2)~=0)
G(i)=xor(1,F(i,k));
else
    G(i)=F(i,k);
end

        
%         S(j)=(-1).^(bi2de(F(i,:)))+S(j);
        S(j)=(-1).^(G(i))+S(j);
    end
end

Nf(k)=2.^(n-1).*(1-(2.^(-(n))).*max(max(abs(S))));
S=zeros(1,p);
end     
end

