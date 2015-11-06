function [path, pathLength, G, nodeTable] = FindOptimalPath(obstacleMap, initialPoint, goalPoint, maxSearchTime)
    %FindPath Finds a path from initialPoint to goalPoint.

    % Tunable parameters
    D = 30; % Maximum edge length (pixels)
    d = 1; % Minimum edge length (pixels)
    xPadding = 1; % x padding for collision (pixels)
    yPadding = 1; % y padding for collision (pixels)

    % Initialisation
    [xMax, yMax] = size(obstacleMap);
    G = graph;
    G = addnode(G,2);
    nodeTable = [initialPoint; goalPoint];

    % Generate Graph
    tic
    countdown = maxSearchTime;
    while toc < maxSearchTime
        x = randi([1 xMax]);
        y = randi([1 yMax]);
        if isInCollision(obstacleMap, y, x, xPadding, yPadding) == 0
            if isFarFromExistingNodes(x, y, d, G, nodeTable) == 1
                G = addnode(G,1);
                nodeTable = [nodeTable; x y];
                for i = 1:numnodes(G)-1
                    if pdist([nodeTable(i,:); x, y]) <= D
                        % If edge from nodeTable[i] to [x,y] is collision free
                        if edgeIsInCollision(obstacleMap, x, y, nodeTable(i,1), nodeTable(i,2), D) == 0
                            dist = sqrt((x-nodeTable(i,1))^2 + (y-nodeTable(i,2))^2);
                            G = addedge(G, numnodes(G), i, dist);
                        end
                    end
                end
            end
        end
        if countdown ~= round(maxSearchTime-toc)
            countdown = round(maxSearchTime-toc);
            clc
            display('Searching for optimal path...')
            display(sprintf('%d seconds remaining', countdown))
        end
    end
    display('Optimal path search complete')

    [nodePath, pathLength] = shortestpath(G, 1, 2);

    path = zeros(length(nodePath), 2);
    for i = 1:length(nodePath)
        node = nodePath(i);
        path(i, :) = nodeTable(node,:);
    end
end

