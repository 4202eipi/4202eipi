function positions = getXYZ(points, depthImage, intrinsics, origin)
    
    numPoints = size(points, 1);
    k_camera = intrinsics.KK;
    cc = intrinsics.cc;
    originDepth = depthImage(round(origin(2)), round(origin(1)));
    positions = zeros(numPoints, 3);
    for i = 1: numPoints
        
        %TODO: Calculate position in xyz
        xPixel = round(points(i, 1));
        yPixel = round(points(i, 2));
        Zdepth = depthImage(yPixel, xPixel);
        
        xPixel = double(xPixel);
        yPixel = double(yPixel);
        Zdepth = double(Zdepth);
        
        if Zdepth ~= 0 
            realspace = k_camera\[xPixel*Zdepth; yPixel*Zdepth; Zdepth];
            positions(i, 1) = realspace(1) - cc(1);
            positions(i, 2) = realspace(2) - cc(2);
            positions(i, 3) = realspace(3) - originDepth;
        else
            display(sprintf('Bad depth data for hand #%d', i))
        end
    end
end
