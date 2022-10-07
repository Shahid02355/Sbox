function [pos_min] = find_pos_min(f1,f2)
f=f2.*ones(1,256);
diff=abs(minus(f,f1));
% diff=abs(minus(f1,f2));
pos_min=find(diff==min(diff));



end

