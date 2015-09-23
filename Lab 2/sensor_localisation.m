%% Setup Kinect v1.6 Runtime
%targetinstaller

%% Kinect adaptor and devices
clear all;
info = imaqhwinfo('kinect')

%% Start 
[colourDevice, depthDevice] = init_kinect();


scene = getsnapshot(colourDevice);  % Get scene
refImage = imread('fid.jpg');       % Get marker
refImage = rgb2gray(refImage);

grayScene = rgb2gray(scene);
grayScene = imrotate((transpose(grayScene)), -90);

[points, refPoints] = detectMarker(grayScene, refImage);

[features1, valid_points1] = extractFeatures(grayScene, points);
[features2, valid_points2] = extractFeatures(refImage, refPoints);

indexPairs = matchFeatures(features1, features2, 'Unique', true);

matchedPoints1 = valid_points1(indexPairs(:, 1), :);
matchedPoints2 = valid_points2(indexPairs(:, 2), :);

figure; showMatchedFeatures(grayScene, refImage, matchedPoints1, matchedPoints2);

[tform, inlierPoints2, inlierPoints1] = estimateGeometricTransform(matchedPoints2, matchedPoints1, 'affine');

figure; showMatchedFeatures(grayScene,refImage,inlierPoints1,inlierPoints2);

boxPolygon = [1, 1;...                           % top-left
        size(refImage, 2), 1;...                 % top-right
        size(refImage, 2), size(refImage, 1);... % bottom-right
        1, size(refImage, 1);...                 % bottom-left
        1, 1];                   % top-left again to close the polygon

newBoxPolygon = transformPointsForward(tform, boxPolygon);

figure;
imshow(grayScene);
hold on;
line(newBoxPolygon(:, 1), newBoxPolygon(:, 2), 'Color', 'y');
title('Detected Marker');


% Close handles
stop(colourDevice);
%stop(depthDevice);







