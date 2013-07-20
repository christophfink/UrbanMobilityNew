z=[[]];
x=[5/90;15/80;30/65;1;80/15];
y=40:5:65;

tot = [];

exec('/Users/Juste/Repositories/UrbanMobilityNew/Results/calibration/obj.csv');
exec('/Users/Juste/Repositories/UrbanMobilityNew/Results/calibration/cal_3036.104.sci');


function res1 = getIndex(number,vector)
    res1 = 0
    for(k=1:1:length(vector))
        if abs(vector(k)-number)<0.01 then
            res1 = k
        end
    end
endfunction


//function res2 = getIndexes(number1,vector1,number2,vector2,number3,vector3)
//    for(k=1:1:length(vector1))
//        if vector1(k)==number1 & vector2(k)==number2 & vector3(k)==number3 then
//            res2 = k
//        end
//    end
//endfunction

//best=[];
//for i=1:1:length(obj)
//    best(i)=rents(998,i);
//end

sumyi=sum(obj)

for(j=1:1:length(congtres))
        tot(j)=0;

alpha = 0
for(i=1:1:length(obj))

//dont forget to rescale the data : optimisation among alpha of the MSE
//first calculation of \sum_{y_{i}x_{i}}
alpha = alpha + (obj(i) * (meancong(j,i)))

end
alpha = alpha / sumyi

for(i=1:1:length(obj))

    tot(j) = tot(j) + ((meancong(j,i) - (alpha * obj(i)))*(meancong(j,i) - (alpha * obj(i))));
    //best(i)=0
    //if meancong(j,i)>0 then
    //    best(i)=meancong(j,i+1);
    //end
    
end
//plot2d(2:1:9,best);
end

//m = min(tot);
//j=getIndex(m,tot);
//best=[];
//for i=1:1:length(obj)
//    best(i)=rents(j,i+1);
//    disp((rents(j,i) - obj(i))^2);
//end
//plot2d(2:1:9,best,12);



for j=1:1:length(ratio)
    if tolerance(j)==60 then
        disp(j)
        z(getIndex(ratio(j),x),getIndex(congtres(j),y))=min(tot(j),1000);
    end
end

//plot2d(2:1:9,obj,5);
//plot3d(x,y,z);


