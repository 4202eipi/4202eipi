function [scene] = crop_scene(img)
%crop workspace based on rgb image
%top left and bottom right corner are the user inputs
h = imshow(img);
if ~exist('scene','var')
crop = ginput(2);
scene = [floor(crop(1,1)) floor(crop(1,2)) ...
    floor(crop(2,1)-crop(1,1)) floor(crop(2,2)-crop(1,2))];
end

end
