%% Generate and train detector

% Filepath of directory containing negitives
negativeFolder = fullfile('~', 'Downloads', 'negatives', 'train', '0000');

trainCascadeObjectDetector('detector.xml', positiveInstances, ...
    negativeFolder,'FalseAlarmRate',0.1,'NumCascadeStages',15, ...
    'FeatureType', 'Haar');

detector = vision.CascadeObjectDetector('detector.xml');


%% Detect hands in video
clear cam
cam = webcam(1);

figure
i=0;
while 1
    I = snapshot(cam);
    if rem(i,1)==0
        i=0;
        bboxes = step(detector, I);
    end
    I = insertObjectAnnotation(I, 'rectangle', bboxes, 'Sign');
    imshow(I);
    i=i+1;
end




