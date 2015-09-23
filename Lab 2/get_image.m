function [photo, depth] = get_image(cv, dv, num)

calibFilePath = 'C:\Users\Lucas\Documents\4202eipi\Lab 2\RADOCCToolbox';

if num == 12
    % Save colour images for calibration
    for i=1:num
        image = getsnapshot(cv);
        imwrite(image, [calibFilePath 'calibphoto' int2str(i) '.jpg']);
        pause(1);
        disp(['Image' int2str(i) 'taken']);
        
    end
end

if num == 1
    
    figure;
    I=getsnapshot(cv); 
    D=getsnapshot(dv);
    subplot(1,2,1),h1=imshow(I); 
    subplot(1,2,2),h2=imshow(D,[0, 9000]); colormap('jet');

end


end
