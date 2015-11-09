function [ output_args ] = moveMotors( angles )
%MOVEMOTORS Summary of this function goes here
%   Detailed explanation goes here

DEFAULT_PORTNUM = 3; % Communicate via COM3
DEFAULT_BAUDNUM = 1; % Communicate at 1Mbps
GOAL_INDEX = 30;     % Index of goalset in Library
SPEED_INDEX = 32;    % Index of speedset in Library
loadlibrary('dynamixel', 'dynamixel.h');
libfunctions('dynamixel');
resp = calllib('dynamixel', 'dxl_initialize', DEFAULT_PORTNUM, DEFAULT_BAUDNUM);

if resp==1
    position_value = [0 0 0 0];
    for i=1:4
        calllib('dynamixel','dxl_write_word',i,SPEED_INDEX,300);
        pause(0.05);
        angle = angles(i);
        if i==1
            angle = angle + 90;
        end
        if i==2
            % 90 = 60
            % 0 = 150
            angle = 150 - angle;
        end
        if i==3 || i==4
            % 90 = 150
            % 180 = 60
            angle = 240 - angle;
        end
        if i==1
            position_value(i) = max(0,min(angle * 4096 / 360, 4095));
        else
            position_value(i) = max(0,min(angle * 1024 / 300, 1023));
        end
    end
    for i=1:4
        calllib('dynamixel','dxl_write_word',i,GOAL_INDEX,position_value(i));
        pause(0.01);
    end
end

%Terminate
calllib('dynamixel', 'dxl_terminate');
unloadlibrary('dynamixel');
end

