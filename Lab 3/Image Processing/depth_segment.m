function [depthSeg] = depth_segment(depthImage, depthLevel)
% Takes in a depthImage produced by kinect sensor and segments it based on
% a given depthLevel.
% Pixels with a higher depth level then depthLevel become 0 aka black
% Remaining pixels are set to inf aka white
% Returns binary image 

Ds = depthImage;
sz = size(Ds);
for i=1:sz(1)
    for j=1:sz(2)
        if Ds(i,j) >= depthLevel || Ds(i,j) == 0
            Ds(i,j) = 0; 
        else 
           Ds(i,j) = Inf;
        end
    end
end
depthSeg = Ds;

end