close all; clear all; clc;
% Main script - Team $$ e^{i\times\pi} $$
% Run from path Lab 2 folder
%
%
%% Initialise Kinect objects
[colourDevice, depthDevice] = init_kinect();
preview(colourDevice);
pause;
%% Calibrate
intrinsics = calibrate_kinect(colourDevice, depthDevice);
load('Calib_Results.mat');
disp('Press any key to continue to color cab')
pause;
colour_calibration(colourDevice);
disp(' Face marker - Press any key to continue')
pause;

%% Locate camera relative to baseframe
r = 'r';
c = 'c'
x = 'r'
while x == 'r'
    origin = sensor_localisation(colourDevice, depthDevice, intrinsics);
    prompt = 'Continue(c) or repeat(r)? ';
    x = input(prompt);
end

disp('Hands ready - Press any key to continue')
pause;

% Load the dectector trained prior to the lab
detectorBW = vision.CascadeObjectDetector('detectorBW.xml');

i = 0;
figure;
%while 1
    trigger(colourDevice);
    I = getdata(colourDevice);
    
    %I = imresize(I, 0.75);
   
    %if rem(i, 15) == 0
        D = getsnapshot(depthDevice);
        I = skin2BW(I);
        I = +I;
        bboxes = step(detectorBW, I);
        
        I = insertObjectAnnotation(I, 'rectangle', bboxes, 'Hand');
        imshow(I);
        
        midpoints = middle_hands(bboxes)
        positions = getXYZ(midpoints, D, intrinsics, origin);
        %i=0;
    %end
    
    %i = i + 1;
%end


