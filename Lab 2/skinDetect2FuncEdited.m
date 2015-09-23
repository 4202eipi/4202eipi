function out=skinDetect2FuncEdited(img)

sz=size(img);
r=1;g=2;b=3;
filteredImg=img;

% Filter for skin coloured pixels
for i=1:sz(1)
    for j=1:sz(2)
        u = img(i,j,r)-img(i,j,g);
        if u>20 && u<74
            filteredImg(i,j,r)=255;
            filteredImg(i,j,g)=255;
            filteredImg(i,j,b)=255;
        
        else
            filteredImg(i,j,r)=0;
            filteredImg(i,j,g)=0;
            filteredImg(i,j,b)=0;
        end
    end
end

% Convert to binary image
out=im2bw(filteredImg);

% Remove components smaller than 100 pixels
out=bwareaopen(out,100);

end