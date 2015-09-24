function sensor_localisation(colourDevice, depthDevice)

info = imaqhwinfo('kinect')

%% Start 
%[colourDevice, depthDevice] = init_kinect();
%%
scene = getsnapshot(colourDevice);  % Get scene
refImage = imread('fid.jpg');       % Get marker
refImage = rgb2gray(refImage);

gScene = rgb2gray(scene);
gScene = imrotate((transpose(gScene)), -90);

[points, refPoints] = detectMarker(gScene, refImage);

[features1, valid_points1] = extractFeatures(gScene, points);
[features2, valid_points2] = extractFeatures(refImage, refPoints);

indexPairs = matchFeatures(features1, features2, 'Unique', true);

matchedPoints1 = valid_points1(indexPairs(:, 1), :);
matchedPoints2 = valid_points2(indexPairs(:, 2), :);

showMatchedFeatures(gScene, refImage, matchedPoints1, matchedPoints2);

[tform, inlierPoints2, inlierPoints1] = estimateGeometricTransform(matchedPoints2, matchedPoints1, 'affine');

showMatchedFeatures(gScene,refImage,inlierPoints1,inlierPoints2);

boxPolygon = [1, 1;...                           % top-left
        size(refImage, 2), 1;...                 % top-right
        size(refImage, 2), size(refImage, 1);... % bottom-right
        1, size(refImage, 1);...                 % bottom-left
        1, 1];                   % top-left again to close the polygon

newBoxPolygon = transformPointsForward(tform, boxPolygon);

imshow(gScene);
hold on;
line(newBoxPolygon(:, 1), newBoxPolygon(:, 2), 'Color', 'y');
title('Detected Marker');

pixelCoords = transformPointsForward(tform, inlierPoints2.Location) 
pixelCoord = mean(pixelCoords);
hold on;
plot(pixelCoord(1),pixelCoord(2),'r.','MarkerSize', 20); % centre of marker

%%
cc = [ 302.955744784712920 ; 242.792195166124090 ];
origin = [newBoxPolygon(4,1), newBoxPolygon(4,2)];
plot(origin(1),origin(2),'g.','MarkerSize', 20); %origin
xy = cc - origin'; % xy dist in pixels of camera

figure;
D = getsnapshot(depthDevice);D=flipdim(D,2);
imshow(D,[0,9000]);colormap('jet');

ax = 118; %mm     Dimensions of real world marker
by = 125; %mm

w = 640;  % Image width in pixels
h = 480;  % Image height in pixels
i = origin(1);j = origin(2);
z = D(round(i),round(j));

x_scale = ax/(newBoxPolygon(2,1) - newBoxPolygon(1,1));
y_scale = by/(newBoxPolygon(3,2) - newBoxPolygon(2,2));

x_cam = x_scale * xy(1)
y_cam = y_scale * xy(2)
z_cam = z


end





