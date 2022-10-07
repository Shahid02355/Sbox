function [GG,HH] = bic_sac(A,B,n)
m=size(A,1)*size(A,2);
A=reshape(A,1,m);
B=reshape(B,1,m);
U=de2bi(A,n);
V=de2bi(B,n);
D=eye(n,n);
x=[];xd=[];H=[];T=[];
L=[];
SS=[];
GG=[];
GG=[];
S1=[];S2=[];S3=[];S4=[];S5=[];S6=[];S7=[];S8=[];
SA1=[];SA2=[];SA3=[];SA4=[];SA5=[];SA6=[];SA7=[];SA8=[];
fx=zeros(m,n);
fxd=zeros(m,n);

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
        for s=1:n
              for p=1:n
                H(s,p)=xor(fx(j,s),fx(j,p));
                T(s,p)=xor(fxd(j,s),fxd(j,p));
              end
        end
        S1(j,:)=xor(H(1,:),T(1,:));
        S2(j,:)=xor(H(2,:),T(2,:));
        S3(j,:)=xor(H(3,:),T(3,:));
        S4(j,:)=xor(H(4,:),T(4,:));
        S5(j,:)=xor(H(5,:),T(5,:));
        S6(j,:)=xor(H(6,:),T(6,:));
        S7(j,:)=xor(H(7,:),T(7,:));
        S8(j,:)=xor(H(8,:),T(8,:));
        H=[];T=[];
    end
    SA1(i,:)=sum(S1);
    SA2(i,:)=sum(S2);
    SA3(i,:)=sum(S3);
    SA4(i,:)=sum(S4);
    SA5(i,:)=sum(S5);
    SA6(i,:)=sum(S6);
    SA7(i,:)=sum(S7);
    SA8(i,:)=sum(S8);
    x=[];xd=[];
end
    SA1(:,1)=zeros(8,1);
    SA2(:,2)=zeros(8,1);
    SA3(:,3)=zeros(8,1);
    SA4(:,4)=zeros(8,1);
    SA5(:,5)=zeros(8,1);
    SA6(:,6)=zeros(8,1);
    SA7(:,7)=zeros(8,1);
    SA8(:,8)=zeros(8,1);
       
GG(1,:)=max(0.5*abs(minus(128*ones(8,8),SA1)));
GG(2,:)=max(0.5*abs(minus(128*ones(8,8),SA2)));
GG(3,:)=max(0.5*abs(minus(128*ones(8,8),SA3)));
GG(4,:)=max(0.5*abs(minus(128*ones(8,8),SA4)));
GG(5,:)=max(0.5*abs(minus(128*ones(8,8),SA5)));
GG(6,:)=max(0.5*abs(minus(128*ones(8,8),SA6)));
GG(7,:)=max(0.5*abs(minus(128*ones(8,8),SA7)));
GG(8,:)=max(0.5*abs(minus(128*ones(8,8),SA8)));

HH=(SA1+SA2+SA3+SA4+SA5+SA6+SA7+SA8)./(7*m);





end