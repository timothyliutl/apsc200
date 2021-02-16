Table = readtable("./CSV Files/neighbourhood-profiles-2016-csv.csv");
PopulationTable = Table(strcmp(Table.Category, 'Population'),:);