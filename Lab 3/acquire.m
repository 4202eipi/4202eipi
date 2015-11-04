close all;
[cv, dv] = init_kinect();
preview(cv);
pause;

[I, D] = get_image(cv, dv, 2);
% figure;
% while (1)
% disp('Take depth of background');
% pause;
% imageBackground = getsnapshot(dv);
% D = imageBackground;
% imwrite(imageBackground, [testImagePath 'newimgback' '3' '.png']);
% imshow(D,[1050,1250]);colormap('jet');
% end
%% close
stop(cv);stop(dv); 