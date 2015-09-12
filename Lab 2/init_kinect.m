function [colourDevice, depthDevice] = init_kinect( )

%% Create videoinput Objects for colour and depth
colourDevice = videoinput('kinect', 1);
depthDevice = videoinput('kinect', 2);

start(colourDevice);
start(depthDevice);

end