%theoretically pointsX and pointsY would be the input for the function
pointsX = rand(1,10);
pointsY = rand(1,10);
xaverage=0;
yaverage=0;

for index = 1:length(pointsX)
    xaverage=xaverage+pointsX(index);
    yaverage=yaverage+pointsY(index);
end

xaverage = xaverage/length(pointsX);
yaverage = yaverage/length(pointsY);
%return x and y average
