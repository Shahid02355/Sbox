function [dp] =Dp(A,B,n)
dx=0:255;
% dy=0:1:255;
m=size(A,1)*size(A,2);
A=reshape(A,1,m);
B=reshape(B,1,m);
U=de2bi(A,n);
V=de2bi(B,n);
W=de2bi(dx,n);
% Z=de2bi(dy,n);
xd=[];fxd=[];occ=[];
for i=1:256
    for j=1:m
        x(j,:)=U(j,:);
        fx(j,:)=V(j,:);
        xd(j,:)=xor(W(257-i,:),x(j,:));
        for k=1:m
            if(xd(j,:)==U(k,:))
                fxd(j,:)=V(k,:);
            end
        end
r(j,:)=xor(fx(j,:),fxd(j,:));

   
end
    s=reshape(bi2de(r),sqrt(m),sqrt(m));
    occ(i)=max_occurence(s);
end
dp=reshape(occ,sqrt(m),sqrt(m));
  
end


