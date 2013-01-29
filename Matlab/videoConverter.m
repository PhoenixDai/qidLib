clear; clc;

%% only read current folder
dirs = dir('*.avi');
dircell = struct2cell(dirs); clear dirs;
dircell = dircell(1,:)';
fileNum = length(dircell);
parfor j=1:fileNum
    fileName = cell2mat(dircell(j,1));
    videoObj = mmreader(fileName);
    psn = find(fileName=='.');
    fileName = fileName(1:psn-1);
    mkdir(fileName);
    frames = read(videoObj);
    % numFrames = get(videoObj, 'NumberOfFrames');
    cnt = 0;
    for i=1:length(frames)
        if mod(i,100)==0
            fprintf('%d frames processed\n',i);
        end
        l = mod(i,3); 
        switch l
            case {0,1}
                cnt = cnt+1;
                frameName = [fileName '\' fileName '_' num2str(cnt) '.jpg'];
                imwrite(frames(:,:,:,i),frameName, 'jpeg');
                % fprintf('%f %f Well done.\n',i,l);
            otherwise
                % fprintf('%f %f Fine\n',i,l);
        end
    end
    fprintf(['\n ' fileName ' processed\n\n']);
end

%% Read folder depth: 2
% folders = dir;
%
% for i=3:length(folders)
%     if folders(i,1).isdir
%         folderName = folders(i,1).name;
%         dirs = dir([folderName '\*.avi']);
%         dircell = struct2cell(dirs); clear dirs;
%         dircell = dircell(1,:)';
%         fileNum = length(dircell);
%         for j=1:fileNum
%             fileName = cell2mat(dircell(j,1));
%             videoObj = mmreader([folderName '\' fileName]);
%             psn = find(fileName=='.');
%             fileName = fileName(1:psn-1);
%             mkdir(folderName, fileName);
%             frames = read(videoObj);
%             numFrames = get(videoObj, 'NumberOfFrames');
%             for k=1:floor(numFrames/2)
%                 serial = 2*k-1;
%                 frameName = [folderName '\' fileName '\' fileName '_' num2str(serial) '.jpg'];
%                 imwrite(frames(:,:,:,serial),frameName, 'jpeg');
%             end
%         end
%     end
% end