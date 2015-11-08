B=imread('newimgback2.png');
D=imread('newimgdepth2.png');
I=imread('newimgrgb2.jpg');

[I, D, B] = align_mapping(I, D, B);

%crop workspace based on rgb image
h = imshow(I);
if ~exist('scene','var')
crop = ginput(2);
scene = [floor(crop(1,1)) floor(crop(1,2)) ...
    floor(crop(2,1)-crop(1,1)) floor(crop(2,2)-crop(1,2))];
end
Bcrop = imcrop(B, scene);
Dcrop = imcrop(D, scene);
Icrop = imcrop(I, scene);

figure(1);subplot(1,3,1),
h1=imshow(Bcrop,[1000, 1200]); colormap('jet');title('background');
subplot(1,3,2);
h2=imshow(Dcrop,[1000, 1200]); colormap('jet');title('hand dep');
subplot(1,3,3);
h3=imshow(Icrop);title('rgb');

%% Minus the background and the depth image
Cs = Bcrop - Dcrop;
sz = size(Cs);
for i=1:sz(1)
    for j=1:sz(2)
        if Cs(i,j) < 7 % 7mm is the approx noise in the 'flat table'
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
imshow(C3);title('depth segemented and dilated/edited');

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

rad = (cx-mx)^2 + (cy-my)^2 ;

C4 = +C3; %logical -> double so we can insert markers and shapes
mark = insertMarker(C4, [cx cy]); 
mark = insertShape(mark, 'circle', [cx cy sqrt(rad)],'linewidth', 4);
figure(4);imshow(mark);

%futher dialate to account for dodgy mapping
C3=imdilate(C3,strel('diamond',5));

% compare binary depth image to rgb (just a test)
figure;imshow(C3);
hold on;
h=imshow(Icrop);
set(h,'AlphaData',0.4);
title('Depth and RGB comparison');

%TODO take original depth at [cx cy] to find height of hand (add atleast
%2cm above it and call it a new layer)

%layer 1 is the table. all obstacles will be visible. 
%layer 2 is hand? 
%layer x is (layer2 - 30 ) times x 

[depth, x, y, avg] = max_depth(Bcrop);
layer1 = depth_segment(Bcrop,avg+7)
layer1a = bwareaopen(layer1, 50);
% se90 = strel('line', 3, 90);
% se0 = strel('line', 3, 0);
% layer1b = imdilate(layer1a,[se0 se90]);
layer1b = imdilate(layer1a,strel('diamond',5));
layer1b = layer1b + C3; 
figure;
subplot(3,1,3);imshow(layer1b);title('layer1 (ground zero)');

handDepth = Dcrop(floor(cy),floor(cx));
layer2dep = handDepth - 30;
layer2 = depth_segment(Dcrop,layer2dep);
layer2a = imdilate(layer2,strel('diamond',5));
subplot(3,1,2);imshow(layer2a);title('layer2');

layer3dep = layer2dep - 30;
layer3 = depth_segment(Dcrop,layer3dep);
layer3a = imdilate(layer3,strel('diamond',5));
subplot(3,1,1);imshow(layer3a);title('layer3');

%%
h3 = figure;
while ishandle(h3)
    trigger(dv);trigger(cv);
    D=getdata(dv);I=getdata(cv);
    [I, D] = align_mapping(I, D, 0);
    imshow(D,[900,1300]);colormap('jet');
    hold on;
    h=imshow(I);
    set(h,'AlphaData',0.4);
end



