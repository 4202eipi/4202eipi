%% Setup Kinect v1.6 Runtime
%targetinstaller

%% Kinect adaptor and devices
clear all;
info = imaqhwinfo('kinect')

%% Start 
[colourDevice, depthDevice] = init_kinect();

scene = getsnapshot(colourDevice);
refImage = imread('fid.jpg');
refImage = rgb2gray(refImage);

grayScene = rgb2gray(scene);
grayScene = imrotate((transpose(grayScene)), -90);

[points, refPoints] = detectMarker(grayScene, refImage);

[features1, valid_points1] = extractFeatures(grayScene, points);
[features2, valid_points2] = extractFeatures(refImage, refPoints);

indexPairs = matchFeatures(features1, features2);

matchedPoints1 = valid_points1(indexPairs(:, 1), :);
matchedPoints2 = valid_points2(indexPairs(:, 2), :);

figure; showMatchedFeatures(grayScene, refImage, matchedPoints1, matchedPoints2);


%imshow(grayScene);hold on;
%plot(valid_points.selectStrongest(4), 'showOrientation', true);






% Close handles
stop(colourDevice);
%stop(depthDevice);







