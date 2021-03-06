function coverage = calcCoverage(popPoints, sitePoints)
    RADIUS_OF_COVERAGE = 4;
    
    count = 0;
    for i=1:length(popPoints)
        currentDist = shortestDist(popPoints{i,1}, sitePoints);
        if currentDist <= RADIUS_OF_COVERAGE 
            count = count + 1;
        end
    end
    
    coverage = count / length(popPoints);
%% coverage
% Calculates how much of the arena is being observed as a percentage.
% Considers a weighted average of the density matrix.
%
% Parameters:
%   popPoints
%       n-by-1 cell array with 2-by-1 double array (x,y) of the population points
%
%   sitePoints
%       n-by-1 cell array with 2-by-1 double array(x,y) of the site points
%
% Returns
%   coverage
%     Percent value between 0 and 1 representing coverage
end

function dist = shortestDist(popPoint, sitePoints)

    dist = distance(popPoint, sitePoints{1,1});
    for i=1:length(sitePoints)
        current = distance(popPoint, sitePoints{i,1});
        if current < dist
            dist = current;
        end
    end
end

function dist = distance(point, site)
    x1 = point(1); y1 = point(2);
    x2 = site(1); y2 = site(2);
    
    dist = sqrt((x1-x2)^2 + (y1-y2)^2);

end