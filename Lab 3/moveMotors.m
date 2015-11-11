function [ output_args ] = moveMotors( angles )
%MOVEMOTORS Summary of this function goes here
%   Detailed explanation goes here

DEFAULT_PORTNUM = 3; % Communicate via COM3
DEFAULT_BAUDNUM = 1; % Communicate at 1Mbps
GOAL_INDEX = 30;     % Index of goalset in Library
SPEED_INDEX = 32;    % Index of speedset in Library

loadlibrary('dynamixel', 'dynamixel.h'); % Load the library
libfunctions('dynamixel'); % Get the library functions
resp = calllib('dynamixel', 'dxl_initialize', DEFAULT_PORTNUM, DEFAULT_BAUDNUM); % Check for communication

if resp==1 % We can communicate
    position_value = [0 0 0 0]; % Set position values to 0
    % Go through each motor, set the speed to 300
    for i=1:4
        calllib('dynamixel', 'dxl_write_word', i, SPEED_INDEX, 300); % Set speed to 300
        pause(0.05);
        angle = angles(i);
        angle = mod(angle, 360); % Angles must be 0<=angle<360
        
        % Deal with angle offsets from kinematics
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
        
        % Set position value vectors
        if i==1 % Motor 1
            position_value(i) = max(0,min(angle * 4096 / 360, 4095));
        else % Motors 2-4
            position_value(i) = max(0,min(angle * 1024 / 300, 1023));
        end
    end
    
    % Set the motor values
    for i=1:4
        calllib('dynamixel','dxl_write_word',i,GOAL_INDEX,position_value(i));
        pause(0.01);
    end
end

% Terminate
calllib('dynamixel', 'dxl_terminate'); % End communication
unloadlibrary('dynamixel'); % Unload the library
end

