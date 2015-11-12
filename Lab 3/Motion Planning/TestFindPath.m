close all; clc

searchTime = 15; % Seconds

loadedFile = load('layers_ex2.mat');
testObstacleMap = im2bw(loadedFile.layers);

figure
hold on
imshow(imcomplement(testObstacleMap),'InitialMagnification','fit')

title('Please select Initial Position')
display('Please select Initial Position')
[y, x] = ginput(1);
pI = [round(x) round(y)];

title('Please select Goal Position')
display('Please select Goal Position')
plot(pI(2), pI(1), '*r')
[y, x] = ginput(1);
pG = [round(x), round(y)];
close all

[path, pathLength, G, nodeTable] = FindOptimalPath(testObstacleMap, pI, pG, searchTime);

tic
[pathF, pathLengthF, GF, nodeTableF] = FindFastPath(testObstacleMap, pI, pG);
fastTime = toc;

close all
figure
subplot(1,2,1)
imshow(testObstacleMap,'InitialMagnification','fit')
hold on
plot(path(:,2), path(:,1), '-g')
plot(nodeTable(:,2), nodeTable(:,1), '*c')
plot(path(1,2), path(1,1), '^y')
plot(path(length(path),2), path(length(path),1), 'vy')
title(sprintf('Optimal path for search time of %ds', searchTime))

subplot(1,2,2)
imshow(testObstacleMap,'InitialMagnification','fit')
hold on
plot(pathF(:,2), pathF(:,1), '-g')
plot(nodeTableF(:,2), nodeTableF(:,1), '*c')
plot(pathF(1,2), pathF(1,1), '^y')
plot(pathF(length(pathF),2), pathF(length(pathF),1), 'vy')
title(sprintf('First complete path (Found in %1.1d seconds)', fastTime))

display(sprintf('Optimal path is %d%% shorter than first path.', round((pathLengthF-pathLength)/pathLength*100)))