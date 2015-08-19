%% SETUP WORKSPACE
COM_CloseNXT('all')
close all
clear all
clc

%% CONNECT TO NXT
h=COM_OpenNXT();
COM_SetDefaultNXT(h);

%% TARGET LOCATION STRUCT
targetLocations = restart();
targetCount = size(targetLocations,1);
%prompt = 'what is the target location? ';
%targetLocations = input(prompt);
%targetLocations = [1 6 1; %%x1 y1 z1
%                   3 1 0; %%x2 y2 z2
%                   7 4 3] %%x3 y3 z3
targetLocations = sortPositions(targetLocations, targetCount);

%% MAIN CODE HERE
NXT_PlayTone(600, 200, h);
pause(0.2)
NXT_PlayTone(440, 200, h);
pause(0.2)

motors = setupMotors(30);

angles = [0 -58 -20];
leftRight = 0;

leftRight = moveMotors(-angles, motors, leftRight);

angles = [0 0 0];

for targetNumber = 1:targetCount
    x = targetLocations(targetNumber, 1);
    y = targetLocations(targetNumber, 2);
    z = targetLocations(targetNumber, 3);
    mHeight = maxHeight(targetLocations, targetNumber, targetCount) + 1;
    
    % Prevent hitting towers
    [angles, leftRight] = moveTo(x,y,mHeight,angles, motors, leftRight);
    
    [angles, leftRight] = moveTo(x,y,z,angles, motors, leftRight);
    
    % Prevent hitting towers
    [angles, leftRight] = moveTo(x,y,mHeight,angles, motors, leftRight);
end

NXT_PlayTone(440, 200, h);
pause(0.2)
NXT_PlayTone(600, 200, h);
pause(0.2)

[angles, leftRight] = moveTo(x,y,maxHeight(targetLocations, 1, targetCount)+1, angles, motors, leftRight);

%resetArms(motors);
moveMotors(-angles, motors, leftRight);


%% CLOSE CONNECTION TO NXT
COM_CloseNXT(COM_GetDefaultNXT());
