%% Generate and train detector

% Filepath of directory containing negitives
negativeFolder = fullfile('~','Documents','UQ', ...
    '2015 Sem 2','METR4202', 'Lab2', 'NegitivesBW');

trainCascadeObjectDetector('detectorBW.xml', positiveInstancesBW, ...
    negativeFolder,'FalseAlarmRate',0.01,'NumCascadeStages', 10, ...
    'FeatureType', 'Haar');

%% Detect hands in video

[colourDevice, depthDevice] = init_kinect();
vid = colourDevice;
detectorBW = vision.CascadeObjectDetector('detectorBW.xml');
%vid.FramesPerTrigger = 30;
i = 0;
figure
while i < 100
    I = getsnapshot(vid);
    I = imresize(I, 0.75);
   
    if rem(i, 15) == 0
    tic;
    I = skin2BW(I);
    I = +I;
    bboxes = step(detectorBW, I);
    midpoints = euclidean_hands(bboxes);
    I = insertObjectAnnotation(I, 'rectangle', bboxes, 'Hand');
    detect = toc
    imshow(I);
    i=0;
    end
    
    i = i + 1;
end




