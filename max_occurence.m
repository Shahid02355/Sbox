function [occ] = max_occurence(M)
x=[];
for i=1:256
 x(i)=length(find(M==i-1));
end
occ=max(x);


end

