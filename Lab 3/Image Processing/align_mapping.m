function [I, D, B] = align_mapping(IRGB, Depth, Background)
% Approximate aligning of depth and rgb images

A = [1 0 0; 0 1 0; -32 -28 1]; % approx translation
tform = affine2d(A); % creates tform object from matrix A

Rout = imref2d(size(IRGB)); %rgb world co ords
Rout.XWorldLimits(2) = Rout.XWorldLimits(2)+20;
Rout.YWorldLimits(2) = Rout.YWorldLimits(2)+24;

% Translate image then resizes (approximate mapping)
[It,Rout] = imwarp(IRGB,tform,'OutputView',Rout); 
Dr = imresize(Depth,0.92); 
Br = imresize(Background,0.92);

D = Dr;
B = Br;
I = It;

end
