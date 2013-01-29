
h = gcf;
axesObjs = get(h, 'Children');
dataObjs = get(axesObjs, 'Children');
xdata = get(dataObjs, 'XData');
ydata = get(dataObjs, 'YData');
fileNames = get(dataObjs, 'DisplayName');
tripCnt = size(fileNames,1);

tripPath = 'C:\Users\PhoenixDai\Desktop\';
savePath = 'C:\Users\PhoenixDai\Desktop\20121104\';
dircell = dir([tripPath '*.mat']);
dircell = struct2cell(dircell);
dircell = dircell(1,:)';
fileNum = length(dircell);

for i=1:fileNum
    fileName = cell2mat(dircell(i));
    for j=1:tripCnt
        thisTrip = cell2mat(fileNames(j));
        if strfind(fileName, thisTrip)
            copyfile([tripPath fileName], [savePath fileName]);
        end
    end
end