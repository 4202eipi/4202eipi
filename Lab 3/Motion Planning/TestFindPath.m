clear all; close all; clc

pI = [3 3];
pG = [130 40];
searchTime = 25; % Seconds

loadedFile = load('layers_ex1.mat');
testObstacleMap = im2bw(loadedFile.layers);

[path, pathLength, G, nodeTable] = FindOptimalPath(testObstacleMap, pI, pG, searchTime);

tic
[pathF, pathLengthF, GF, nodeTableF] = FindFastPath(testObstacleMap, pI, pG);
fastTime = toc;

figure
imshow(testObstacleMap,'InitialMagnification','fit')
hold on
plot(path(:,2), path(:,1), '-g')
plot(nodeTable(:,2), nodeTable(:,1), '*c')
plot(path(1,2), path(1,1), '^y')
plot(path(length(path),2), path(length(path),1), 'vy')
title(sprintf('Optimal path for search time of %ds', searchTime))

figure
imshow(testObstacleMap,'InitialMagnification','fit')
hold on
plot(pathF(:,2), pathF(:,1), '-g')
plot(nodeTableF(:,2), nodeTableF(:,1), '*c')
plot(pathF(1,2), pathF(1,1), '^y')
plot(pathF(length(pathF),2), pathF(length(pathF),1), 'vy')
title(sprintf('First complete path (Found in %d seconds)', round(fastTime)))

display(sprintf('Optimal path is %d%% shorter than first path.', round((pathLengthF-pathLength)/pathLength*100)))