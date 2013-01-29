clear; clc; close all;

routes = {'A_LC_to_I94'; 'A_SC_to_I94'; 'A_to_D_I96'; 'D_to_A_I96'};

for i=1:length(routes)
    routeName = cell2mat(routes(i));
    cd(routeName);
    dircell = dir(['*.mat']);
    dircell = struct2cell(dircell);
    dircell = dircell(1,:)';
    fileNum = length(dircell);
    for j=1:fileNum
        fileName = cell2mat(dircell(j));
        % filePath = [routeName '\' fileName];
        spaces = strfind(fileName, ' ');
        newFileName = [fileName(1:spaces(4)+8) '.mat'];
        disp(newFileName);
        % newFilePath = [routeName '\' fileName];
        dos(['rename "' fileName '" "' newFileName '"']);
    end
    cd('..');
end