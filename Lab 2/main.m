close all; clear all;
% Main script - Team $$ e^{i\times\pi} $$
% Run from path Lab 2 folder
%
%
%% Initialise Kinect objects
[colourDevice, depthDevice] = init_kinect();

%% Calibrate
intrinsics = calibrate_kinect(colourDevice, depthDevice);
load('Calib_Results.mat');
disp(' Press any key to continue')
pause;
colour_calibration(colourDevice);
disp(' Press any key to continue')
pause;

%% Locate camera relative to baseframe
sensor_localisation(colourDevice, depthDevice, intrinsics);
disp(' Press any key to continue')
pause;

% Load the dectector trained prior to the lab
detectorBW = vision.CascadeObjectDetector('detectorBW.xml');

i = 0;
figure;
while i < 100
    I = getsnapshot(colourDevice);
    
    %I = imresize(I, 0.75); % Resizing may break code
   
    if rem(i, 15) == 0
        D = getsnapshot(depthDevice);
        I = skin2BW(I);
        I = +I;
        bboxes = step(detectorBW, I);
        midpoints = middle_hands(bboxes);
        %TODO
        % Calculate distance from origin given mid points
        
        I = insertObjectAnnotation(I, 'rectangle', bboxes, 'Hand');
        imshow(I);
        i=0;
    end
    
    i = i + 1;
end


