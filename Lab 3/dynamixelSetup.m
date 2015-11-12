function dynamixelSetup( ~ )
%DYNAMIXELSETUP Summary of this function goes here
%   Detailed explanation goes here

    DEFAULT_PORTNUM = 3; % Communicate via COM3
    DEFAULT_BAUDNUM = 1; % Communicate at 1Mbps

    loadlibrary('dynamixel', 'dynamixel.h'); % Load the library
    %libfunctions('dynamixel'); % Get the library functions
    calllib('dynamixel', 'dxl_initialize', DEFAULT_PORTNUM, DEFAULT_BAUDNUM); % Check for communication
end

