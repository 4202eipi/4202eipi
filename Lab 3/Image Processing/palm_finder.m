function [cx,cy,rad,out] = palm_finder(img)

C1 = bwareaopen(img,50);    %removes stray noisy holes 
se90 = strel('line', 3, 90); 
se0 = strel('line', 3, 0);
C2 = imdilate(C1,[se0 se90]);   %dilation
C3 = bwareaopen(C2, 200);
% if display
%     figure;imshow(Cs); title('depth segmented pre-clean');
%     imshow(C3);title('depth segemented post dilated/processing');
% end

% Finds the centre of the palm to calculate hand depth 
stats=regionprops(C3,'Centroid');
if length(stats) == 1
    cx=stats.Centroid(1);
    cy=stats.Centroid(2);
    hand = 1;
elseif length(stats) > 1
    i = 3;
    while length(stats) > 1
        C3 = bwareaopen(C2, i*100);
        stats=regionprops(C3,'Centroid');
        i = i + 1;
    end
    cx=stats.Centroid(1);
    cy=stats.Centroid(2);
    hand = 1;
elseif isempty(stats)
    % no hand
    hand = 0;
end

if hand 
    %finds the radius of palm
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
    rad = (cx-mx)^2 + (cy-my)^2;
    out = C3;
end

if hand == 0
   cx = 0;
   cy = 0;
   rad = 0;
   sz = size(img);
   out = zeros(sz(1),sz(2));
end

end