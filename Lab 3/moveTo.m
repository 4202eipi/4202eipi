function moveTo(x, y, z)
%MOVETO Summary of this function goes here
%   Detailed explanation goes here
    %new_y = x;
    %new_x = 192 - y;
    %x = new_x;
    %y = new_y;

    angles = angleCalculations(x,y,z);
    display(['Moving to [', sprintf('%06.2f',x), ', ', sprintf('%06.2f',y), ', ', sprintf('%06.2f',z), '] Angles (', sprintf('%06.2f',angles(1)), ',', sprintf('%06.2f',angles(2)), ',', sprintf('%06.2f',angles(3)), ')']);% ',', sprintf('%06.2f',angles(4)), ')']);
    if isreal(angles)==0
        display('Unreal angle.');
    end
    if angles(1)<20 || angles(1)>160
        %display('Angle 1 problem.');
    end
    if angles(2)<-90 || angles(2)>-45
        display('Angle 2 problem.');
    end
    if angles(3)<45 || angles(3)>180+90+45
        display('Angle 3 problem.');
    end
    %if angles(4)<90 || angles(4)>180+90
    %    display('Angle 4 problem.');
    %end
    moveMotors(angles);

end

