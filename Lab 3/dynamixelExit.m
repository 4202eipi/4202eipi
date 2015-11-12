function dynamixelExit( ~ )
%DYNAMIXELEXIT Summary of this function goes here
%   Detailed explanation goes here
    calllib('dynamixel', 'dxl_terminate'); % End communication
    unloadlibrary('dynamixel'); % Unload the library

end

