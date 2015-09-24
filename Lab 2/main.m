close all; clear all;

%%Calibrate
[colourDevice, depthDevice] = calibrate_kinect();

disp(' Press any key to continue')
pause;
%%
colour_calibration(colourDevice);

disp(' Press any key to continue')
pause;

sensor_localisation(colourDevice, depthDevice);

disp(' Press any key to continue')
pause;

detectorBW = vision.CascadeObjectDetector('detectorBW.xml');
i = 0;
figure
while i < 100
    I = getsnapshot(colourDevice);
    
    %I = imresize(I, 0.75);
   
    if rem(i, 15) == 0
        D = getsnapshot(depthDevice);
        I = skin2BW(I);
        I = +I;
        bboxes = step(detectorBW, I);
        midpoints = euclidean_hands(bboxes);
        
        I = insertObjectAnnotation(I, 'rectangle', bboxes, 'Hand');
        imshow(I);
        i=0;
    end
    
    i = i + 1;
end


