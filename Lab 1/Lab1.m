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

% %% MAIN CODE HERE
NXT_PlayTone(450, 150, h);
pause(0.2)
NXT_PlayTone(450, 75, h);
pause(0.1)
NXT_PlayTone(450, 75, h);
pause(0.1)
NXT_PlayTone(660, 350, h);
pause(0.4)
% NXT_PlaySoundFile('p', 1);

motors = setupMotors(30);

leftRight = 1;

angles = [0 0 0];

for q = 1:2
    for targetNumber = 1:targetCount
        x = targetLocations(targetNumber, 1)
        y = targetLocations(targetNumber, 2)
        z = targetLocations(targetNumber, 3)
        mHeight = maxHeight(targetLocations, targetNumber, targetCount) + 2

        % Prevent hitting towers
        [angles, leftRight] = moveTo(x+0.5,y,mHeight,angles, motors, leftRight);

        if ((q==1) && (z>0) && (0==1))
            [angles, leftRight] = moveTo(x+0.5,y,z+0.5,angles, motors, leftRight);
            %[angles, leftRight] = moveTo(x-0.5,y,z+0.5,angles, motors, leftRight);
            [angles, leftRight] = moveTo(x,y,z+0.5,angles, motors, leftRight);
        end
        [angles, leftRight] = moveTo(x,y,z,angles, motors, leftRight);


        % Prevent hitting towers
        [angles, leftRight] = moveTo(x,y,mHeight,angles, motors, leftRight);
    end
    [angles, leftRight] = moveTo(x,y,maxHeight(targetLocations, 1, targetCount)+2,angles,motors,leftRight);
end

NXT_PlayTone(440, 200, h);
pause(0.2)
NXT_PlayTone(600, 200, h);
pause(0.2)

moveMotors(-angles, motors, leftRight);

%% CLOSE CONNECTION TO NXT
COM_CloseNXT(COM_GetDefaultNXT());
