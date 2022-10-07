function y=logistic(p,y0)
y(1)=y0;
   
  for k1=1:255
   y(k1+1)=p*(y(k1))*(1-y(k1));
  end