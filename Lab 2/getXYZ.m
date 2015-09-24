function positions = getXYZ(points, depthImage, intrinsics, origin)
    
    numPoints = size(points, 1);
    k_camera = intrinsics.KK;
    cc = intrinsics.cc;
    originDepth = depthImage(round(origin(2)), round(origin(1)));
    positions = [0 0 0];
    for i = 1: numPoints
        
        %TODO: Calculate position in xyz
        xPixel = round(points(i, 1));
        yPixel = round(points(i, 2));
        Zdepth = depthImage(xPixel, yPixel);
        
        xPixel = double(xPixel);
        yPixel = double(yPixel);
        Zdepth = double(Zdepth);
        
        realspace = k_camera\[xPixel*Zdepth; yPixel*Zdepth; Zdepth];
        Xposition = realspace(1) - cc(1)
        Yposition = realspace(2) - cc(2)
        Zposition = realspace(3) - originDepth
        position = [Xposition Yposition Zposition];
    end
end
