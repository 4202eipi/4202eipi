function [I, D, B] = get_image(cv, dv, num)

%calibFilePath = 'C:\Users\Lucas\Documents\4202eipi\Lab 2\RADOCCToolbox\';
testImagePath = 'C:\Users\Lucas\Documents\4202\lab3images\';

if num > 2
    % 
%     for i=26:num
%         imageRGB = getsnapshot(cv);
%         imageDepth = getsnapshot(dv);
%        
%         imwrite(imageRGB, [testImagePath 'imgrgb' int2str(i) '.jpg']);
%         imwrite(imageDepth, [testImagePath 'imgdepth' int2str(i) '.png']);
%         pause;
%         disp(['Images' int2str(i) 'taken']);
%         
%     end
end

if num == 1
    trigger(cv);trigger(dv);
    I=getdata(cv); 
    D=getdata(dv);
    B=D; 
elseif num == 2
    trigger(cv);trigger(dv);
    I=getdata(cv); 
    D=getdata(dv);
end

% disp('Take depth of background');
%     pause;
%     imageBackground = getsnapshot(dv);
%         B = imageBackground;
%     imwrite(imageBackground, [testImagePath 'newimgback' '3' '.png']);
%     disp('Insert hand');
%     pause;
%     imageRGB = getsnapshot(cv);
%         I = imageRGB;
%     imageDepth = getsnapshot(dv);
%         D = imageDepth;
%     imwrite(imageRGB, [testImagePath 'newimgrgb3' '.jpg']);
%     imwrite(imageDepth, [testImagePath 'newimgdepth3' '.png']);
%     disp(['Images Taken']);

end
