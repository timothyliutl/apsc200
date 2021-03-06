function centroids = calcCentroids2(agentPoints)
%% calcCentroids
% Calculates the centroid of each agent's observed region
%
% Parameters:
%   agentPoints (Determined based on Veronoi cells in assignAgentPoints function)
%     n-by-1 cell array, where cell i contains agent i's observed points
%     (determined by Voronoi diagram)
%     each cell i is a m-by-2 array (or m-by-3 if we want weight for each point)
%     where k is the number of points in agent i's Voronoi polygon
%     containing (x,y,weight) for each point
%   mass (NOT USED FOR K-MEANS)
%     n-by-1 vector where the ith entry is the mass of agent i's observed
%     region
%   density (NOT USED FOR K-MEANS, WE USE agentPoints INSTEAD)
%     (sides*partitions)-by-(sides*partitions) matrix of the density for
%     the current iteration
%   agentPositions (Probably not used for K-means??)
%     n-by-2 vector of the x, y positions for n agents
%   partitions (NOT USED FOR K-MEANS)
%     Number of subdivisions within each unit length of the arena
%
% Returns:
%   centroids
%     n-by-2 vector of the x, y positions of the centroids of each region
n=length(agentPoints);
centroids=zeros(n,2); %Create an empty array which will have 
weighted_x_sum=0;
weighted_y_sum=0;
weight_sum=0; %Variables that will be used to calculate centroid of each Voronoi polygon
for i=1:n %Runs for each agent, i.e. each Voronoi polygon
    weighted_x_sum=0;
    weighted_y_sum=0;
    weight_sum=0; %Reset the sum values to 0 before calculating centroid of each Voronoi polygon
    m=length(agentPoints{j}(:,1)); %k is the number of rows in the cell agentPoints{j},  which is the number of points in the polygon
    for j=1:m %Runs for each point in the current Voronoi polygon
        weighted_x_sum=weighted_x_sum+agentPoints{i}(j,1)*agentPoints{i}(j,3); 
        %Adds the x coordinate multiplied by the weight of the current point to the x sum
        weighted_y_sum=weighted_y_sum+agentPoints{i}(j,2)*agentPoints{i}(j,3); 
        %Adds the y coordinate multiplied by the weight of the current point to the y sum
        weight_sum=weight_sum+agentPoints{i}(j,3);
        %Adds the weight of the current point to the weight sum
        xCoord=weighted_x_sum/weight_sum;
        yCoord=weighted_y_sum/weight_sum; %Find the x and y coordinate of the centroid
        centroids(j)=[xCoord yCoord]; %Enters the x and y coordinates of the centroid to the jth row of centroids array
    end
end


