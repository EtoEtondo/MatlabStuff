function u = sigma_(x)
n=length(x);

for d=1:n,
    if x(1,d)<0
       u(1,d)=0;
    elseif x(1,d)>=0
           u(1,d)=1;
    end    
end
end