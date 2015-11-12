function [layers depths] = create_model()

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


h4 = figure;
set(gcf,'currentchar',' ')         % set a dummy character
while get(gcf,'currentchar')==' '  % while loop breaks when key is pressed
    [I, D, X] = get_image(cv, dv, 1);
    [I, D, X] = align_mapping(I, D, X);
    
    Dcrop = imcrop(D, scene);
    Icrop = imcrop(I, scene);
    
    Cs = minus_background(Bcrop, Dcrop);
    [cx,cy,rad,out] = palm_finder(Cs);
    
    [depth, x, y, avg] = max_depth(Bcrop);
    backgroundSegement = depth_segment(Bcrop,avg-7);
%     tableDep = table_depth(Bcrop);
%     backgroundSegement = depth_segment(Bcrop,tableDep-7);
    backgroundSegmentOpen = bwareaopen(backgroundSegement, 50);
    layer1 = imdilate(backgroundSegmentOpen,strel('diamond',5));
    layer1 = layer1 + out;
    
    imshow(layer1);
    hold on;
    h=imshow(Icrop);
    set(h,'AlphaData',0.5);
    title('Depth and RGB comparison');
end

% Layer 1 
[depth, x, y, avg] = max_depth(Bcrop);
% tableDep = table_depth(Bcrop);
backgroundSegement = depth_segment(Bcrop,avg-7);
depth = avg-7;
% backgroundSegement = depth_segment(Bcrop,tableDep-7);
backgroundSegmentOpen = bwareaopen(backgroundSegement, 50);
layer1 = imdilate(backgroundSegmentOpen,strel('diamond',5));
layer1 = layer1 + out; 

% Layer 2 is taken from a safe distance above the hand
if (cx == 0) || (cy == 0) %catches the case when there is no hand
    disp('No hand');
    cx=1;
    cy=1;
end
handDepth = Dcrop(floor(cy),floor(cx));
layer2depth = handDepth - 30;
layer2segment = depth_segment(Dcrop,layer2depth);
layer2 = imdilate(layer2segment,strel('diamond',5));

% Layer 3 is 30mm above Layer 2 (There is no need to go higher)
layer3depth = layer2depth - 30;
layer3segment = depth_segment(Dcrop,layer3depth);
layer3 = imdilate(layer3segment,strel('diamond',5));

figure;
subplot(3,1,3);imshow(layer1);title('layer1 (ground zero)');
subplot(3,1,2);imshow(layer2);title('layer2');
subplot(3,1,1);imshow(layer3);title('layer3');

temp = cat(3,layer1,layer2);
layers = cat(3,temp,layer3);
depths = [0;depth-layer2depth;depth-layer3depth];
save('scene_demo.mat', 'scene');
save('layers_demo.mat', 'layers');
save('depths_demo.mat', 'depths');

%% Stop devices
stop(cv);stop(dv); 

end