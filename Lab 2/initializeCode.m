%% Setup Kinect v1.6 Runtime
%targetinstaller

%% Kinect adaptor and devices
clear all;
info = imaqhwinfo('kinect')

%% Create videoinput Object for Color Stream


info.DeviceInfo(1)
vid = videoinput('kinect', 1, 'RGB_640x480');

set(vid, 'ReturnedColorSpace', 'gray');
set(vid, 'Triggerrepeat', Inf);
vid.FrameGrabInterval = 1;
vid.FramesPerTrigger = 10;
figure; % Ensure smooth display
set(gcf, 'doublebuffer', 'on');
start(vid)
while(vid.FramesAcquired<=800)
    l = getdata(vid, 1);
    i = edge(l, 'canny', .27);
    figure(1), imshow(i);
    flushdata(vid);
end
stop(vid)







