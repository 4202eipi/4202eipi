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
Bcrop = imcrop(B, scene);
Dcrop = imcrop(D, scene);
Icrop = imcrop(I, scene);

if scene(3) > scene(4) 
   pix2mmX = 320/scene(3);
   pix2mmY = 192/scene(4);
else 
   pix2mmY = 320/scene(3);
   pix2mmX = 192/scene(4);
end

layers = create_model(cv,dv,scene,Bcrop);

if display
    figure(1);subplot(3,1,1),
    h1=imshow(Bcrop,[1000, 1200]); colormap('jet');title('background');
    subplot(3,1,2);
    h2=imshow(Dcrop,[1000, 1200]); colormap('jet');title('hand depth');
    subplot(3,1,3);
    h3=imshow(Icrop);title('rgb');
end



