cd 'C:\Program Files\MATLAB\R2015a\toolbox\matlab\winfun\win64'
DEFAULT_PORTNUM = 3;
DEFAULT_BAUDNUM = 1;
loadlibrary('dynamixel', 'dynamixel.h');
libfunctions('dynamixel');
resp = calllib('dynamixel', 'dxl_initialize', DEFAULT_PORTNUM, DEFAULT_BAUDNUM)

id = 1;
Goal_Pos = 450;     % Position to move to (Goal_pos x 0.29 degrees)(max 1023)
Goal_index = 30;    % Index of Command in Library
Speed_index = 32;    % Index of Command in Library

if (resp == 1) 
    
    Moving(1) = (calllib('dynamixel','dxl_read_byte',id,46))                 % Read Movement
    PresentPos(1) = int32(calllib('dynamixel','dxl_read_word',id,36))         % Read Position

    
    %Move to first position
    calllib('dynamixel','dxl_write_word',id,Goal_index,Goal_Pos)           % Set goal position
    pause(0.01);
    calllib('dynamixel','dxl_write_word',id,Speed_index,1000)               % Set movement speed
    pause(0.6);
    
    Moving(2) = (calllib('dynamixel','dxl_read_byte',id,46))                % Read Movement
    PresentPos(2) = int32(calllib('dynamixel','dxl_read_word',id,36))         % Read Position
    
end



%close device
calllib('dynamixel', 'dxl_terminate');
unloadlibrary( 'dynamixel');