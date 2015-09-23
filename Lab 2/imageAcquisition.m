clc
clear all
close all
vid = videoinput('kinect', 1, 'RGB_640x480');
src = getselectedsource(vid);
vid.FramesPerTrigger = 30;

while(vid.FramesAcquired<=500)
    data = getdata(vid,1); 
    
end

for i=1:15
start(vid)
sprintf('Capture Image %d', i)
imwrite(getdata(vid), sprintf('C:\\Users\\Lucas\\Documents\\4202\\toolbox_calib\\TOOLBOX_calib\\image%d.jpg', i));

end

'Done aquiring calibration images'