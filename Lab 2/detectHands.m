%% Generate and train detector

% Filepath of directory containing negitives
negativeFolder = fullfile('~', 'Downloads', 'negatives', 'train', '0000');

trainCascadeObjectDetector('detector.xml', positiveInstances, ...
    negativeFolder,'FalseAlarmRate',0.1,'NumCascadeStages',15, ...
    'FeatureType', 'Haar');

detector = vision.CascadeObjectDetector('detector.xml');


%% Detect hands in video
[colourDevice, depthDevice] = init_kinect();
vid = colourDevice;
detector = vision.CascadeObjectDetector('detector.xml');
isrunning(vid)

figure
i=0;
while 1
    
    tic;
    trigger(vid);
    isrunning(vid)
    I = getdata(vid);
    
    isrunning(vid)
    take = toc
    if rem(i,1)==0
        i=0;
        bboxes = step(detector, I);
    end
    I = insertObjectAnnotation(I, 'rectangle', bboxes, 'Hand');
    tic;
    imshow(I);
    show = toc
    i=i+1;
end




