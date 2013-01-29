clear; clc; close all;

% fileList = cell(1000, 1); fileCnt = 0;
% currentPath = 'D:\Young\'; suffix = 'way.csv';
% [fileList, fileCnt] = traverseFolder(fileList, fileCnt, currentPath, suffix);
% fileList = fileList(1:fileCnt);

filePath = 'C:\Users\PhoenixDai\Desktop\StandardRoutes\A_LC_to_A_SC_Local\';
[fileList, fileCnt] = dirFolder(filePath, '.mat');
for i = 1:fileCnt
    fileName = cell2mat(fileList(i));
    pst = strfind(fileName, ' ');
    
%     filePath = fileName(1:slathPst(end)-1);
%     fileNameOnly = fileName(slathPst(end)+1:end);
%     folderName = fileName(slathPst(end-1)+1:slathPst(end)-1);
    newName = fileName(pst(1)+1:end);
    fileName = [filePath fileName];
    % newName = [filePath newName];
    dos(['rename "' fileName '" "' newName '"']); 
end