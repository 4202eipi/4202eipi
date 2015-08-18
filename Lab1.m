%% SETUP WORKSPACE
COM_CloseNXT('all')
close all
clear all
clc

%% CONNECT TO NXT
h=COM_OpenNXT();
COM_SetDefaultNXT(h);

%% TARGET LOCATION STRUCT
targetCount = 1;
targetLocations = restart()
targetLocations 
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

%% SETUP MOTORS
power = 20;

mALeft = NXTMotor('A', 'Power', power);
mBDown = NXTMotor('B', 'Power', -power);
mCDown = NXTMotor('C', 'Power', power);

mARight = NXTMotor('A', 'Power', -power);
mBUp = NXTMotor('B', 'Power', power);
mCUp = NXTMotor('C', 'Power', -power);

motors = [mALeft mBDown mCDown; mARight mBUp mCUp];

mALeft.SpeedRegulation     = false;
mALeft.TachoLimit          = 360;
mALeft.SmoothStart         = true;
mALeft.ResetPosition();

mBDown.SpeedRegulation     = false;
mBDown.TachoLimit          = 360;
mBDown.SmoothStart         = true;
mBDown.ResetPosition();

mCDown.SpeedRegulation     = false;
mCDown.TachoLimit          = 360;
mCDown.SmoothStart         = true;
mCDown.ResetPosition();

mARight.SpeedRegulation     = false;
mARight.TachoLimit          = 360;
mARight.SmoothStart         = true;
mARight.ResetPosition();

mBUp.SpeedRegulation     = false;
mBUp.TachoLimit          = 360;
mBUp.SmoothStart         = true;
mBUp.ResetPosition();

mCUp.SpeedRegulation     = false;
mCUp.TachoLimit          = 360;
mCUp.SmoothStart         = true;
mCUp.ResetPosition();

angles = [0 0 0];

for targetNumber = 1:targetCount
    x = targetLocations(targetNumber, 1);
    y = targetLocations(targetNumber, 2);
    z = targetLocations(targetNumber, 3);
    maxHeight = maxHeight(targetLocations, targetNumber, targetCount) + 1;
    
    % Prevent hitting towers
    %moveTo(x,y,maxHeight,motors);
    
    markTarget(x,y,z, angles, motors);
    
    % Prevent hitting towers
    %moveTo(x,y,maxHeight,motors);
end

NXT_PlayTone(440, 200, h);
pause(0.2)
NXT_PlayTone(600, 200, h);
pause(2)

resetArms(motors);


%% CLOSE CONNECTION TO NXT
mALeft.Stop('off');
mBDown.Stop('off');
mCDown.Stop('off');
COM_CloseNXT(COM_GetDefaultNXT());
