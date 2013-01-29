clear; clc; close all;

dirs = dir('*.mat');
dircell = struct2cell(dirs); clear dirs;
dircell = dircell(1,:)';
fileNum = length(dircell);

for j=1:fileNum
    fileName = cell2mat(dircell(j,1));
    load(fileName);
    lat = trip.Location.Latitude;
    lon = trip.Location.Longitude;
    
    dt = find(fileName=='.');
    fileName = fileName(1:dt-1);
    fileID = fopen(['text\' fileName],'w');
    for i=1:length(lat)
        fprintf(fileID, [num2str(lat(i),8) ' ' num2str(lon(i),8) '\n']);
    end
    fclose(fileID);
end