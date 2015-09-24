function [colourDevice, depthDevice] = calibrate_kinect()
%[colourDevice, depthDevice] = init_kinect();
%get_image(colourDevice, depthDevice, 12);

% Run the RADOCCToolkit to determine the intrisic and extrinsic
% camera calibration data
ima_read_calib();
add_suppress();
click_calib();
go_calib_optim();

ext_calib();
%ext_calib2();

saving_calib();
type Calib_Results.m
end


