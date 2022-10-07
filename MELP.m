function [lp] =MELP(A,B,n)
dx=1:255;
dy=1:63;
m=size(A,1)*size(A,2);
A=reshape(A,1,m);
B=reshape(B,1,m);
U=de2bi(A,n);
V=de2bi(B,n);
W=de2bi(dx,8);
Z=de2bi(dy,6);
x=[];fx=[];xd=[];

for p=1:128
for i=1:63
    g=0;
        for j=1:m
        x(j,:)=U(j,:);
        fx(j,:)=V(j,:);
        if(mod(sum(and(x(j,1:8),W(p,1:8))),2)==mod(sum(and(fx(j,1:6),Z(i,1:6))),2))
%             if(sum(x(j,:))==sum(fx(j,:)))
                g=g+1;
                
        end
        end
         xd(p,i)=((g/128)-1)^2;
    
end
end
  lp=max(max(xd));
end


























