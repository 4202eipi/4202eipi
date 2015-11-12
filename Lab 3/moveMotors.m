function moveMotors( angles )
%MOVEMOTORS Summary of this function goes here
%   Detailed explanation goes here
    SPEED_INDEX = 32;    % Index of speedset in Library
    GOAL_INDEX = 30;     % Index of goalset in Library
    

    position_value = [0 0 0 0]; % Set position values to 0
    % Go through each motor, set the speed to 300
    for i=1:3
        calllib('dynamixel', 'dxl_write_word', i, SPEED_INDEX, 30); % Set speed to 300
        pause(0.05);
        angle = angles(i);
        %angle = mod(angle, 360); % Angles must be 0<=angle<360
        
        % Deal with angle offsets from kinematics
        if i==1
            angle = 180 - angle + 90;
        end
        if i==2
            % 90 = 60
            % 0 = 150
            % then reverse for new kinematics
            angle = angle + 150;
            angle = angle + 12;
        end
        if i==3
            % 90 = 150
            % 180 = 60
            angle = angle + 60;
        end
        if i==4
            angle = angle + 60;
        end
        % Set position value vectors
        if i==1 % Motor 1
            position_value(i) = max(0,min(angle * 4096 / 360, 4095));
        else % Motors 2-4
            position_value(i) = max(0,min(angle * 1024 / 300, 1023));
        end
    end
    
    % Set the motor values
    for i=1:3
        calllib('dynamixel','dxl_write_word',i,GOAL_INDEX,position_value(i));
        pause(0.01);
    end
end

