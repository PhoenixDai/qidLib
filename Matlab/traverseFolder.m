function [fileList, cnt] = traverseFolder(fileList, cnt, currentPath, suffix)

tmpList = dir(currentPath);
tmpLength = size(tmpList,1);
for i=3:tmpLength
    tmp = tmpList(i,1);
    if tmp.isdir
        thisPath = [currentPath tmp.name '\'];
        % tmpCnt = cnt;
        [fileList, cnt] = traverseFolder(fileList, cnt, thisPath, suffix);
        % fileList(tmpCnt+1:cnt) = thisList; 
    end
end

dircell = dir([currentPath '*' suffix]);
dircell = struct2cell(dircell);
dircell = dircell(1,:)';
fileNum = size(dircell,1);
for i=1:fileNum
    fileName = cell2mat(dircell(i));
    dircell(i) = {[currentPath fileName]};
end
fileList(cnt+1:cnt+fileNum) = dircell;
cnt = cnt+fileNum;
disp(['folder: ' currentPath]);
disp(['file count: ' num2str(cnt)]);