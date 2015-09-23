%% Generate and train detector

% Filepath of directory containing negitives
negativeFolder = fullfile('~','Documents','UQ', ...
    '2015 Sem 2','METR4202', 'Lab2', 'NegitivesBW');

trainCascadeObjectDetector('detectorBW.xml', positiveInstancesBW, ...
    negativeFolder,'FalseAlarmRate',0.01,'NumCascadeStages', 10, ...
    'FeatureType', 'Haar');

%% Detect hands in video
clear cam
cam = webcam(1);
detectorBW = vision.CascadeObjectDetector('detectorBW.xml');

figure
while 1
    I = snapshot(cam);
    I = imresize(I, 0.5);
    I = skinDetect2FuncEdited(I);
    I = +I;
    bboxes = step(detectorBW, I);
    I = insertObjectAnnotation(I, 'rectangle', bboxes, 'Hand');
 
    imshow(I);
end




