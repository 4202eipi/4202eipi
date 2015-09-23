% colorDevice = imaq.VideoDevice('kinect',1);
% depthDevice = imaq.VideoDevice('kinect',2);
% colourDevice.ReturnedDataType = 'uint8';
% step(colourDevice);
% step(depthDevice);
% 
% colourImage = step(colourDevice);
% depthImage = step(depthDevice);
% xyzPoints = depthToPointCloud(depthImage,depthDevice);
% 
% pcshow(xyzPoints,'VerticalAxis','y','VerticalAxisDir','down');
% xlabel('X (m)');
% ylabel('Y (m)');
% zlabel('Z (m)');

% Create system object for the Kinect device
    depthDevice = imaq.VideoDevice('kinect',2)
 
    % Warm up the cameras
    step(depthDevice);
 
    % Grab one frame from the devices. It takes a longer time to execute for
    % the first time in order to wake up the devices
    depthImage = step(depthDevice);
  
    % Convert to the point cloud from the depth image
    xyzPoints = depthToPointCloud(depthImage, depthDevice);
      
    % Render the point cloud with false color. The axis is set to better
    % visualize the point cloud
    figure;showPointCloud(xyzPoints, 'VerticalAxis', 'y', 'VerticalAxisDir', 'down');
    xlabel('X (m)');
    ylabel('Y (m)');
    zlabel('Z (m)');
 
    % Release the system objects
    release(depthDevice);