%%SETUP WORKSPACE
COM_CloseNXT('all')
close all
clear all
clc

%%CONNECT TO NXT
h=COM_OpenNXT();
COM_SetDefaultNXT(h);

%%TARGET LOCATION STRUCT
targetCount = 1;
targetLocations = [1 6 0; %%x1 y1 z1
                   3 1 0; %%x2 y2 z2
                   7 4 3] %%x3 y3 z3
targetLocations = sortPositions(targetLocations, targetCount);

targetBlocked = 0;

%%MAIN CODE HERE
NXT_PlayTone(600, 200, h);
pause(0.2)
NXT_PlayTone(440, 200, h);
pause(0.2)

%%SETUP MOTORS
power = 50;

mA = NXTMotor('A', 'Power', power);
mB = NXTMotor('B', 'Power', -power);
mC = NXTMotor('C', 'Power', power);

motors = [mA mB mC];

mA.SpeedRegulation     = false;
mA.TachoLimit          = 360;
mA.SmoothStart         = true;
mA.ResetPosition();

mB.SpeedRegulation     = false;
mB.TachoLimit          = 360;
mB.SmoothStart         = true;
mB.ResetPosition();

mC.SpeedRegulation     = false;
mC.TachoLimit          = 360;
mC.SmoothStart         = true;
mC.ResetPosition();

for targetNumber = 1:targetCount
    x = targetLocations(targetNumber, 1);
    y = targetLocations(targetNumber, 2);
    z = targetLocations(targetNumber, 3);
    maxHeight = maxHeight(targetLocations, targetNumber, targetCount) + 1;
    
    % Prevent hitting towers
    moveTo(x,y,maxHeight,motors);
    
    % Decide if target is blocked
    if targetBlocked
        clearTarget(x,y,z,motors);
    end
    markTarget(x,y,z,motors);
    
    % Prevent hitting towers
    moveTo(x,y,maxHeight,motors);
end

NXT_PlayTone(440, 200, h);
pause(0.2)
NXT_PlayTone(600, 200, h);
pause(0.2)

%%CLOSE CONNECTION TO NXT
mA.Stop('off');
mB.Stop('off');
mC.Stop('off');
COM_CloseNXT(COM_GetDefaultNXT());
