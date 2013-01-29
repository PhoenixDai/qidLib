% This is a Matlab script for writing images to a .avi file

clear; clc; close all;

videoName = 'test.avi';

% Prepare the new file.

% vidObj = VideoWriter(videoName); 
% this is the default config of the Video Compression Method, but doesn't
% work well with one of my player. The one below works well with all my
% players in testing.

vidObj = VideoWriter(videoName, 'Uncompressed AVI');
vidObj.FrameRate = 10; % set video frame rate HERE
open(vidObj);
disp('Program initialed correctly!');

% get the iamges
imagePath = 'C:\Users\PhoenixDai\Desktop\pic\'; % set the path of images HERE
dircell = dir([imagePath '*.bmp']);
dircell = struct2cell(dircell);
dircell = dircell(1,:)';
frameNum = size(dircell,1);

for i = 1:frameNum 
    thisImage = cell2mat(dircell(i));
   [cdata colormap] = imread(thisImage);
   
   % Write each frame to the file.
   currFrame = im2frame(cdata, colormap);
   writeVideo(vidObj, currFrame);
   if mod(i,100)==0
       disp(['Processed ' num2str(i) ' frames.']);
   end
end

% Close the file.
close(vidObj);
disp('Video created successfully!');