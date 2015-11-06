function inCollision = edgeIsInCollision(obstacleMap, x, y, xf, yf, D)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

inCollision = 0;
X = linspace(x, xf, ceil(D/2));
Y = linspace(y, yf, ceil(D/2));
for i = 1:length(X)
    if isInCollision(obstacleMap, round(Y(i)), round(X(i)), 1, 1) == 1
        inCollision = 1;
        return
    end
end
end

