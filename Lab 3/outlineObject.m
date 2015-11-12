function outlineObject( startPoint, stopPoint )
%OUTLINEOBJECT Summary of this function goes here
%   Detailed explanation goes here

    % Get the image
    loadFile = load('layers_ex2.mat');
    image = im2bw(loadFile.layers);
    
    height = 10;

    [path, ~, ~, ~] = FindOptimalPath(image, metricToPixel(startPoint), metricToPixel(stopPoint), 7);

    for i=1:length(path)
        path(i) = pixelToMetric(path(i));
    end

    moveIntoWorkspace();
    moveTo([path(1,1) path(1,2) height]);
    pause(5);

    moveIncremental([path(1,1) path(1,2) height], startPoint);

    for i=1:length(path)-1
        moveIncremental([path(i,1) path(i,2) startPoint(3)], [path(i+1,1) path(i+1,2) startPoint(3)])
    end
    
    moveIncremental(stopPoint, [stopPoint(1) stopPoint(2) height]);
    
    moveIntoWorkspace();
    moveOutofWorkspace();

end

