display = 1;
close all;
[cv, dv] = init_kinect();
preview(cv);
pause;

[I, D, B] = get_image(cv, dv, 1);
stop(cv);stop(dv); 
[I, D, B] = align_mapping(I, D, B);

scene = crop_scene(I);
Bcrop = imcrop(B, scene);
Dcrop = imcrop(D, scene);
Icrop = imcrop(I, scene);

if display
figure(1);subplot(3,1,1),
h1=imshow(Bcrop,[1000, 1200]); colormap('jet');title('background');
subplot(3,1,2);
h2=imshow(Dcrop,[1000, 1200]); colormap('jet');title('hand depth');
subplot(3,1,3);
h3=imshow(Icrop);title('rgb');
end

%% Minus the background and the depth image
%TODO make table noise dynamic
Cs = Bcrop - Dcrop;
sz = size(Cs);
for i=1:sz(1)
    for j=1:sz(2)
        if Cs(i,j) < 7 
            Cs(i,j) = 0;
        else 
            Cs(i,j) = inf;
        end
    end
end

%% Dilate and remove holes to single out the hand
figure;imshow(Cs); title('depth segmented pre-clean');
C1 = bwareaopen(Cs,50);    %removes stray holes 
se90 = strel('line', 3, 90); 
se0 = strel('line', 3, 0);
C2 = imdilate(C1,[se0 se90]);   %dilation
C3 = bwareaopen(C2, 200);
pause;
imshow(C3);title('depth segemented post dilated/processing');

%% Find centre of palm (largest remaining blob)
% may need to implment code to account for more than one 'circle found'
stats=regionprops(C3,'Centroid');
if length(stats) == 1
    cx=stats.Centroid(1);
    cy=stats.Centroid(2);
else
    i = 3;
    while length(stats) > 1
        C3 = bwareaopen(C2, i*100);
        stats=regionprops(C3,'Centroid');
        i = i + 1;
    end
    cx=stats.Centroid(1);
    cy=stats.Centroid(2);
end

%% Identity the palm
out = C3;
boundary=bwboundaries(out);
minDist=2*640*640;
mx=cx;
my=cy;
bImg=uint8(zeros(480,640));
for i=1:length(boundary)
    cell=boundary{i,1};
    for j=1:length(cell)
        y=cell(j,1);
        x=cell(j,2);
        sqrDist=(cx-x)*(cx-x)+(cy-y)*(cy-y);
        bImg(x,y)=255;
        if(sqrDist<minDist)
            minDist=sqrDist;
            mx=x;
            my=y;
        end
    end    
end

if display
rad = (cx-mx)^2 + (cy-my)^2 ;
C4 = +C3; %logical -> double so we can insert markers and shapes
mark = insertMarker(C4, [cx cy]); 
mark = insertShape(mark, 'circle', [cx cy sqrt(rad)],'linewidth', 4);
figure(4);imshow(mark);
end
%futher dialate to account for dodgy mapping
%C3=imdilate(C3,strel('diamond',5));

%% Create layers of depth image corresponding to height (from ground zero)
% Two depth images are combined to create layer 1
% The hand image is identified and segemented on it's own for a more
% accurate result before adding to the rest of the scene.
[depth, x, y, avg] = max_depth(Bcrop);
backgroundSegement = depth_segment(Bcrop,avg-5);
backgroundSegmentOpen = bwareaopen(backgroundSegement, 50);
layer1 = imdilate(backgroundSegmentOpen,strel('diamond',5));
layer1 = layer1 + C3; 

% Layer 2 is taken from a safe distance above the hand
handDepth = Dcrop(floor(cy),floor(cx));
layer2depth = handDepth - 30;
layer2segment = depth_segment(Dcrop,layer2depth);
layer2 = imdilate(layer2segment,strel('diamond',5));

% Consequent layers are taken every 3cm depending on obstacles
layer3dep = layer2depth - 30;
layer3segment = depth_segment(Dcrop,layer3dep);
layer3 = imdilate(layer3segment,strel('diamond',5));


figure;
subplot(3,1,3);imshow(layer1);title('layer1 (ground zero)');
subplot(3,1,2);imshow(layer2);title('layer2');
subplot(3,1,1);imshow(layer3);title('layer3');

%% Test of effectiveness visual representation
% compare binary depth image to rgb

figure;imshow(layer1);
hold on;
h=imshow(Icrop);
set(h,'AlphaData',0.4);
title('Depth and RGB comparison');

