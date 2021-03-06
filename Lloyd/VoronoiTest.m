x =[0.499116013482590,0.535801055751113,0.445183165296042,0.123932277598070,0.490357293468018,0.852998155340816,0.873927405861733,0.270294332292698,0.208461358751314,0.564979570738201];
y = [0.640311825162758,0.417028951642886,0.205975515532243,0.947933121293169,0.0820712070977259,0.105709426581721,0.142041121903998,0.166460440876421,0.620958643935308,0.573709764841198];
% make input array of points that need to be determined if they are in the
% area or not 
plot(x,y,'.')
axis([0 1 0 1])

voronoi(x,y)
[a,b] = voronoi(x,y);
figure()
plot(a,b)
axis([0 1 0 1])
%a=a';
%b=b';
%a = [a(:,1); a(:,2)];
%b = [b(:,1); b(:,2)];
% points = [a b];
% points = unique(points, 'rows');
% dt = delaunay(points(:,1), points(:,2));
% triplot(dt,points(:,1),points(:,2))
% axis([0 1 0 1])


%need to make shapes
%can use delaunytriangulation, but we need to extract unique points out of
%the arrays
%can also construct an adjacency matrix from the sides

dt = delaunayTriangulation(x(:),y(:));
[a,b] = voronoiDiagram(dt);


for index = 1:10
    %excludes infinite points
    logic = isfinite(a(b{index},:));
    points = b{index};
    poly1 = a(points(logic(:,1)),:);
    
    area = polyshape(poly1(:,1), poly1(:,2));
    figure()
    plot(area)
    %issue right now is that for unbounded cases, polygons cannot be
    %created for them
    %need to find a way to add boundary points into the sides created by
    %the voronoiDiagram function
end
