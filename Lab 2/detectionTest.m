clc
clear all
close all

% Generate and train detector
load('stopSigns.mat'); %data contains imagenames with bounding boxes

% Filepath of directory containing positives
imDir = fullfile(matlabroot,'toolbox','vision','visiondata', ...
    'stopSignImages');

addpath(imDir);

% Filepath of directory containing negitives
negativeFolder = fullfile(matlabroot,'toolbox','vision', ...
    'visiondata','nonStopSigns');

trainCascadeObjectDetector('stopSignDetector.xml',data, ...
    negativeFolder,'FalseAlarmRate',0.2,'NumCascadeStages',5);

detector = vision.CascadeObjectDetector('stopSignDetector.xml');


vid = videoinput('kinect', 1, 'RGB_640x480');
src = getselectedsource(vid);
vid.FramesPerTrigger = 30;

while(vid.FramesAcquired<=500)
    data = getdata(vid,1); 
    
    bboxes = step(detector, I);
    Signs = insertObjectAnnotation(I, 'rectangle', bboxes, 'Sign');
    imshow(Signs);
    
end

