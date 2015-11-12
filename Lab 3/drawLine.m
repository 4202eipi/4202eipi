function drawLine( startPoint, endPoint )
%OUTLINEOBJECT Summary of this function goes here
%   Detailed explanation goes here

    height = 10;

    % Get the image
    loadFile = load('layers_ex2.mat');
    image = im2bw(loadFile.layers);

    moveIntoWorkspace();
    
    moveTo(startPoint(1), startPoint(2), height);
    pause(5);
    moveIncremental([startPoint(1) startPoint(2) height], startPoint);
    pause(2);
    moveIncremental(startPoint, endPoint);
    pause(2);
    moveIncremental(endPoint, [endPoint(1) startPoint(2) height]);
    
    moveIntoWorkspace();
    moveOutofWorkspace();

end

