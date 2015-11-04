function [I, D] = get_image(cv, dv, num)

%calibFilePath = 'C:\Users\Lucas\Documents\4202eipi\Lab 2\RADOCCToolbox\';
testImagePath = 'C:\Users\Lucas\Documents\4202\lab3images\';

if num > 2
    % 
    for i=26:num
        imageRGB = getsnapshot(cv);
        imageDepth = getsnapshot(dv);
       
        imwrite(imageRGB, [testImagePath 'imgrgb' int2str(i) '.jpg']);
        imwrite(imageDepth, [testImagePath 'imgdepth' int2str(i) '.png']);
        pause;
        disp(['Images' int2str(i) 'taken']);
        
    end
end

if num == 1
    
%     figure;
    I=getsnapshot(cv); 
    D=getsnapshot(dv);
%     subplot(1,2,1),h1=imshow(I); 
%     subplot(1,2,2),h2=imshow(D,[0, 9000]); colormap('jet');

end

if num == 2
    disp('Take depth of background');
    pause;
    imageBackground = getsnapshot(dv);
    imwrite(imageBackground, [testImagePath 'newimgback' '3' '.png']);
    disp('Insert hand');
    pause;
    imageRGB = getsnapshot(cv);
        I = imageRGB;
    imageDepth = getsnapshot(dv);
        D = imageDepth;
    imwrite(imageRGB, [testImagePath 'newimgrgb3' '.jpg']);
    imwrite(imageDepth, [testImagePath 'newimgdepth3' '.png']);
    disp(['Images Taken']);
end


end
