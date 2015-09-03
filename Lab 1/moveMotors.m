function [leftRight] = moveMotors( angles, motors, leftRight )
    motorAGive = 5;
    gr1 = 7; %gear ratio motorA:arm1
    gr2 = 4.5; %gear ratio motorB:arm2
    gr3 = 20/12; %gear ratio motorC:arm3
    angles(1) = round(gr1*angles(1));
    angles(2) = round(gr2*angles(2));
    angles(3) = round(gr3*angles(3));
    
    % Motor A
    i = 1;
    if angles(1)<0
        i = 2;
        if (leftRight)
            angles(1) = angles(1) - motorAGive;
            leftRight = 0;
        end
    elseif ((leftRight == 0) && angles(1)>0)
            angles(1) = angles(1) + motorAGive;
            leftRight = 1;
    end

    data = motors(i,1).ReadFromNXT();
    pos = data.Position;
    if(angles(1)~=0) 
        motors(i,1).TachoLimit = abs(angles(1));
        motors(i,1).SendToNXT();
        motors(i,1).WaitFor();
        motors(i,1).Stop('off');
    end
    
    % Motor B and C
    i = 1;
    j = 1;
    if angles(2)<0
        i = 2;
    end
    if angles(3)<0
        j = 2;
    end     
    if(angles(2)~=0) 
        motors(i,2).TachoLimit = abs(angles(2));
        motors(i,2).SendToNXT();
    end
    if(angles(3)~=0)
        motors(j,3).TachoLimit = abs(angles(3));
        motors(j,3).SendToNXT();
    end
    if(angles(2)~=0)
        motors(i,2).WaitFor();
        motors(i,2).Stop('off');
    end
    if(angles(3)~=0)
        motors(j,3).WaitFor();
        motors(j,3).Stop('off');
    end
end

