function [points, refPoints] = detectMarker(image, refImage)

I = image;
J = refImage;

points = detectSURFFeatures(I);
refPoints = detectSURFFeatures(J);



end
