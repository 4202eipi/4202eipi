function [ intrinsics ] = calibrate_kinect(colourDevice, depthDevice)
cd('RADOCCToolbox');
disp('Begin Calibration');
get_image(colourDevice, depthDevice, 12);

dX = 28; dY = 28;


% Run the RADOCCToolkit to determine the intrisic and extrinsic
% camera calibration data
ima_read_calib();
add_suppress();
click_calib();
go_calib_optim();


ext_calib();

saving_calib();
type Calib_Results.m
load('Calib_Results.mat')
cd ..

field1 = 'cc';  value1 = cc;
field2 = 'fc';  value2 = fc;
field3 = 'alpha_c';  value3 = alpha_c;
field4 = 'kc';  value4 = kc;
field5 = 'KK'; value5 = KK;

intrinsics = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5);


end


