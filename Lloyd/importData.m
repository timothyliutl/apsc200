Table = readtable("./CSV Files/neighbourhood-profiles-2016-csv.csv");
PopulationTable = Table(strcmp(Table.Category, 'Population'),:);
Toronto = PopulationTable(:,{'CityOfToronto', 'Characteristic'});



CityNames = Table.Properties.VariableNames;
%Need to find a way to get longitude and lattitude data in the tables





%Testing how to parse kingston data
KingstonTable = readtable("./CSV Files/neighbourhoods.csv");
KingstonLocations = KingstonTable(:,{'x__NAME_', 'GeoJSON'});
table = jsondecode(KingstonLocations{1,2}{1,1});

longitude = table.coordinates(:,:,1);
lattitude = table.coordinates(:,:,2);

% length(jsondecode(KingstonLocations{:,2}{1,1}).coordinates)
KingstonPlottingData = array2table(cell(9,3));
for i=1:9
    temp1=0;
    temp2=0;
    %disp(length(jsondecode(KingstonLocations{i,2}{1,1}).coordinates))
    for j=1:length(jsondecode(KingstonLocations{i,2}{1,1}).coordinates)
        
        temp1 = temp1 + jsondecode(KingstonLocations{i,2}{1,1}).coordinates(1,j,1);
        temp2 =temp2 + jsondecode(KingstonLocations{i,2}{1,1}).coordinates(1,j,2);
    end
    KingstonPlottingData.Var1(i) = {temp1/length(jsondecode(KingstonLocations{i,2}{1,1}).coordinates)};
    KingstonPlottingData.Var2(i) = {temp2/length(jsondecode(KingstonLocations{i,2}{1,1}).coordinates)};
    KingstonPlottingData.Var3(i)= KingstonLocations{i,1};
    %disp(KingstonPlottingData.Var2{i,1})
    geodensityplot(KingstonPlottingData.Var2{1,1}, KingstonPlottingData.Var1{1,1}, 1000)
    geolimits([43.2 44.1],[-80 -79])
    %For some reason this won't plot onto the chart
end 


