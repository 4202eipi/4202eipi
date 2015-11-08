display = 0;
close all;
[cv, dv] = init_kinect();
%preview(cv);
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

 %%
h4 = figure;
while ishandle(h4)
    [I, D, X] = get_image(cv, dv, 1);
    [I, D, B] = align_mapping(I, D, B);
    if ~exist('scene','var')
        scene = crop_scene(I);
    end
    Dcrop = imcrop(D, scene);
    Icrop = imcrop(I, scene);
    
    Cs = minus_background(Bcrop, Dcrop);
    [cx,cy,rad,out] = palm_finder(Cs);
    
%     [depth, x, y, avg] = max_depth(Bcrop);
%     backgroundSegement = depth_segment(Bcrop,avg-5);
    tableDep = table_depth(Bcrop);
    backgroundSegement = depth_segment(Bcrop,tableDep-7);
    backgroundSegmentOpen = bwareaopen(backgroundSegement, 50);
    layer1 = imdilate(backgroundSegmentOpen,strel('diamond',5));
    layer1 = layer1 + out;
    
    imshow(layer1);
    hold on;
    h=imshow(Icrop);
    set(h,'AlphaData',0.5);
    title('Depth and RGB comparison');
end

%%
if display
    figure(1);subplot(3,1,1),
    h1=imshow(Bcrop,[1000, 1200]); colormap('jet');title('background');
    subplot(3,1,2);
    h2=imshow(Dcrop,[1000, 1200]); colormap('jet');title('hand depth');
    subplot(3,1,3);
    h3=imshow(Icrop);title('rgb');
end

if display
C4 = +out; %logical -> double so we can insert markers and shapes
mark = insertMarker(C4, [cx cy]); 
mark = insertShape(mark, 'circle', [cx cy sqrt(rad)],'linewidth', 4);
figure(4);imshow(mark);
end

%% Create layers of depth image corresponding to height (from ground zero)
% Two depth images are combined to create layer 1
% The hand image is identified and segemented on it's own for a more
% accurate result before adding to the rest of the scene.

%TODO wrap in function
%TODO clause for when cx,cy=0,0 aka there is no hand

[depth, x, y, avg] = max_depth(Bcrop);
backgroundSegement = depth_segment(Bcrop,avg-5);
backgroundSegmentOpen = bwareaopen(backgroundSegement, 50);
layer1 = imdilate(backgroundSegmentOpen,strel('diamond',5));
layer1 = layer1 + out; 

% Layer 2 is taken from a safe distance above the hand
handDepth = Dcrop(floor(cy),floor(cx));
layer2depth = handDepth - 30;
layer2segment = depth_segment(Dcrop,layer2depth);
layer2 = imdilate(layer2segment,strel('diamond',5));

% Consequent layers are taken every 3cm depending on obstacles
layer3dep = layer2depth - 30;
layer3segment = depth_segment(Dcrop,layer3dep);
layer3 = imdilate(layer3segment,strel('diamond',5));

if display
figure;
subplot(3,1,3);imshow(layer1);title('layer1 (ground zero)');
subplot(3,1,2);imshow(layer2);title('layer2');
subplot(3,1,1);imshow(layer3);title('layer3');
end

temp = cat(3,layer1,layer2);
layers = cat(3,temp,layer3);

%% Stop devices
stop(cv);stop(dv); 

