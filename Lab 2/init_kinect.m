function [colourDevice, depthDevice] = init_kinect( )

%% Create videoinput Objects for colour and depth
colourDevice = videoinput('kinect', 1);
depthDevice = videoinput('kinect', 2);

triggerconfig(colourDevice, 'Manual');
colourDevice.FramesPerTrigger = 1;
colourDevice.TriggerRepeat = inf; 

start(colourDevice);
start(depthDevice);

end