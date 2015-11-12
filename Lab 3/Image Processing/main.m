display = 0;
close all;
[cv, dv] = init_kinect();
disp('Start - take background image');
pause;
[I, D, B] = get_image(cv, dv, 1);%first call to obtain background
[I, D, B] = align_mapping(I, D, B);
if ~exist('scene','var')
    scene = crop_scene(I);
end
Bcrop  = imcrop(B, scene);
Dcrop = imcrop(D, scene);
Icrop = imcrop(I, scene);

disp('Start - dynamic model building');
pause;
[layers depths] = create_model();



