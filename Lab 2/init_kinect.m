function [colourDevice, depthDevice] = init_kinect( )

%% Create videoinput Objects for colour and depth
colourDevice = videoinput('kinect', 1);
depthDevice = videoinput('kinect', 2);

triggerconfig(colourDevice, 'Manual');
colourDevice.FramesPerTrigger = 1;
colourDevice.TriggerRepeat = inf; 

triggerconfig(depthDevice, 'Manual');
depthDevice.FramesPerTrigger = 1;
depthDevice.TriggerRepeat = inf; 

start(colourDevice);
start(depthDevice);
% First trigger takes the most time
trigger(colourDevice);trigger(depthDevice);
getdata(colourDevice);getdata(depthDevice);

end