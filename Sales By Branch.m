close all;
clear all;
clc;


m=7;
n=5;
m1 = [4 6 7 4 6];

data1 = [610 855 998 2020 0 0 0; 396 580 613 885 891 1449 0; 268 390 690 834 1008 1016 1201; 169 604 757 1567 0 0 0; 524 541 806 991 1079 1661 0];

data2=data1.';

Brighton_Hove = {'Books',610.00;'Electronics',855.00;'Hardware',998.00;'Software',2020.00;'',0;'',0;'',0};
Chichester = {"Home&Garden",396;"Health&Beauty",580;"Sports",613;"Software",885;"Electronics",891;"DIY",1449;'',0 };
Portsmouth ={"Books",268;"Home&Garden",390;"Electronics",690;"DIY",834;"Sports",1008;"Clothes",1016;"Toys&Children",1201 };
Southampton = {"DIY",169;"Hardware",604;"Electronics",757;"Sports",1567;'',0;'',0;'',0};
Winchester = {"Hardware",524;"Sports",541;"Books",806;"Software",991;"Toys&Children",1079;"Electronics",1661;'',0};



%---------------code with 2nd approach starts here----------------------

level1 = sum(data2);
r= treemap(level1);
%colors = rand(5,3);



for j = 1:n
%     colors = (3*repmat(rand(1,3),m,1) + rand(m,3))/4;
%     rNew = treemap(data2(:,j),r(3,j),r(4,j));
%     rwwww = rNew;
%     rNew(1,:) = rNew(1,:) + r(1,j);
%     rNew(2,:) = rNew(2,:) + r(2,j);
%     plotRectangles(rNew,[],colors);
    
    
    if(j == 1)
        colors = (3*repmat(rand(1,3),m,1) + rand(1,3))/4;
        %colors = ones(m1(j),3);
        rNew = treemap(data2(:,j),r(3,j),r(4,j));
        
        rNew(1,:) = rNew(1,:) + r(1,j);
        rNew(2,:) = rNew(2,:) + r(2,j);
        rwwww = rNew;
        labels = Brighton_Hove(:,1);
        plotRectangles(rNew,labels,colors);
        title('hi');
        outline(rwwww);
        
        
    elseif(j == 2)
        colors = (3*repmat(rand(1,3),m,1) + rand(1,3))/4;
        %colors = ones(m1(j),3) * 0.3;
        rNew = treemap(data2(:,j),r(3,j),r(4,j));
        
        rNew(1,:) = rNew(1,:) + r(1,j);
        rNew(2,:) = rNew(2,:) + r(2,j);
        rwwww = rNew;
        labels = Chichester(:,1);
        plotRectangles(rNew,labels,colors);

        outline(rwwww);
    elseif(j == 3)
        colors = (3*repmat(rand(1,3),m,1) + rand(1,3))/4;
        %colors = ones(m1(j),3) * 0.5;
        rNew = treemap(data2(:,j),r(3,j),r(4,j));
        
        rNew(1,:) = rNew(1,:) + r(1,j);
        rNew(2,:) = rNew(2,:) + r(2,j);
        rwwww = rNew;
        labels = Portsmouth(:,1);
        plotRectangles(rNew,labels,colors);
        outline(rwwww);
    elseif(j == 4)
        colors = (3*repmat(rand(1,3),m,1) + rand(1,3))/4;
        %colors = ones(m1(j),3) * 0.7;
        rNew = treemap(data2(:,j),r(3,j),r(4,j));
        
        rNew(1,:) = rNew(1,:) + r(1,j);
        rNew(2,:) = rNew(2,:) + r(2,j);
        rwwww = rNew;
        labels = Southampton(:,1);
        plotRectangles(rNew,labels,colors);
        outline(rwwww);
    elseif(j == 5)
        colors = (3*repmat(rand(1,3),m,1) + rand(1,3))/4;
        %colors = ones(m1(j),3) * 0.9;
        rNew = treemap(data2(:,j),r(3,j),r(4,j));
        
        rNew(1,:) = rNew(1,:) + r(1,j);
        rNew(2,:) = rNew(2,:) + r(2,j);
        rwwww = rNew;
        labels = Winchester(:,1);
        plotRectangles(rNew,labels,colors);
        outline(rwwww);
    end
    
end

outline(r);
title('Sales by Branch');

%axis([-0.01 1.01 -0.01 1.01])







