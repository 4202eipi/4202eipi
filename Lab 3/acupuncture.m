function acupuncture( points )
%OUTLINEOBJECT Summary of this function goes here
%   Detailed explanation goes here

    % Get the image
    loadFile = load('layers_ex2.mat');
    image = im2bw(loadFile.layers);

    moveIntoWorkspace();
    
    for i=1:length(points)
        moveTo(points(i,1), points(i,2), 150);
        pause(5);
        points(i,:)
        moveIncremental([points(i,1) points(i,2) 150], points(i,:));
        pause(2);
        moveIncremental(points(i,:), [points(i,1) points(i,2) 150]);
    end
    
    moveIntoWorkspace();
    moveOutofWorkspace();

end

