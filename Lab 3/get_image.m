function [I, D, B] = get_image(cv, dv, num)
% Inputs: colour and depth kinect devices, num images required
% Outputs:  rgb image, I
%           depth image with hand, D
%           depth image w/o hand, B
%
% when num argument is 1 images are returned 
% whereas when num is 2, images are also saved to disk aswell as returned


%calibFilePath = 'C:\Users\Lucas\Documents\4202eipi\Lab 2\RADOCCToolbox\';
testImagePath = 'C:\Users\Lucas\Documents\4202eipi\Lab 3\testImages';

if num == 1
    disp('Take depth of background');
    pause;
    B = getsnapshot(dv);
    disp('Insert hand');
    pause;
    I = getsnapshot(cv);
    D = getsnapshot(dv);
    disp(['Images Taken']);

end

if num == 2
    disp('Take depth of background');
    pause;
    imageBackground = getsnapshot(dv);
        B = imageBackground;
    imwrite(imageBackground, [testImagePath 'newimgback.png']);
    disp('Insert hand');
    pause;
    imageRGB = getsnapshot(cv);
        I = imageRGB;
    imageDepth = getsnapshot(dv);
        D = imageDepth;
    imwrite(imageRGB, [testImagePath 'newimgrgb.jpg']);
    imwrite(imageDepth, [testImagePath 'newimgdepth.png']);
    disp('Images Taken');
end

if num > 2
    % For calibration
    for i=1:num
        imageRGB = getsnapshot(cv);
        imageDepth = getsnapshot(dv);
       
        imwrite(imageRGB, [testImagePath 'imgrgb' int2str(i) '.jpg']);
        imwrite(imageDepth, [testImagePath 'imgdepth' int2str(i) '.png']);
        pause;
        disp(['Images' int2str(i) 'taken']);
        
    end
end

end
