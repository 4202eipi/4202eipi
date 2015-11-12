function drawShape( points )
%OUTLINEOBJECT Summary of this function goes here
%   Detailed explanation goes here

    height = height;

    % Get the image
    loadFile = load('layers_ex2.mat');
    image = im2bw(loadFile.layers);

    moveIntoWorkspace();
    moveTo(points(1,1), points(1,2), height);
    pause(5);
    moveIncremental([points(1,1) points(1,2) height], points(1,:));
    pause(1);
    
    for i=1:length(points)-1
        moveIncremental(points(i,:), points(i+1,:));
        pause(1);
    end
    
    moveIncremental(points(length(points),:), points(1,:));
    moveIncremental(points(1,:), [points(1,1) points(1,2) height]);
    
    moveIntoWorkspace();
    moveOutofWorkspace();

end

