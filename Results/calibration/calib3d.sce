z=[];
x=10000:1000:19000;
y=10000:2000:28000;

tot = [];

exec('obj.csv');
exec('cal_3036.104.sci');

function res = getIndex(number,vector)
    for(k=1:1:length(vector))
        if vector(k)==number then
            res = k
        end
    end
endfunction


function res = getIndexes(number1,vector1,number2,vector2,number3,vector3)
    for(k=1:1:length(vector1))
        if vector1(k)==number1 & vector2(k)==number2 & vector3(k)==number3 then
            res = k
        end
    end
endfunction

best=[];
for i=1:1:length(obj)
    best(i)=rents(998,i);
end




for(j=1:1:length(bnorm))
        tot(j)=0;
for(i=1:1:length(obj))

    tot(j) = tot(j) + ((rents(j,i) - obj(i))*(rents(j,i) - obj(i)));
    best(i)=0
    if rents(j,i)>0 then
        best(i)=rents(j,i+1);
    end
    
end
plot2d(2:1:9,best);
end

m = min(tot);
j=getIndex(m,tot);
best=[];
for i=1:1:length(obj)
    best(i)=rents(j,i+1);
    disp((rents(j,i) - obj(i))^2);
end
plot2d(2:1:9,best,12);



for j=1:1:length(bnorm)
    if bref(j)==11000 then
        z(getIndex(incomemean(j),x),getIndex(bnorm(j),y))=min(tot(j),10000);
    end
end

plot2d(2:1:9,obj,5);



