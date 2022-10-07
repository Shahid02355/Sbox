clear all;clc;
disp('***** y^2 = x^3 + 8x + 7 mod p *****');
p=input('insert prime p: ');
% x=input('insert varible x: ');
% y=input('insert varible y: ');
a=12;
b=16;

f=@(x,y) y.^2 - (x.^3 + a*x + b );
%figure
pts=[];
for i=1:p
    for j=1:p
         if mod(f(i,j),p) == 0
       pts=[pts;i,j]  ; 
         end
    end
end
 A=pts(:,2);
 B=mod(A',16);
   B=unique(B,'stable');
   %C=B(1:16);
   D=reshape(B,4,4);
   d=mod(D,16)
   S=[ 8    13     7     2;
     9     4    10    15;
     3    11     0    12;
    14     6     1     5];
 A=nonlinear(S,D,4)
