function [ ] = moveMotors( angles, motors )
    gr1 = 7.2; %gear ratio motorA:arm1
    gr2 = 4.5; %gear ratio motorB:arm2
    gr3 = 1; %gear ratio motorC:arm3
    angles(1) = round(gr1*angles(1));
    angles(2) = round(gr2*angles(2));
    angles(3) = round(gr3*angles(3));
    order = [1,3,2];
    if (angles(2)<0) || (angles(3)<0)
        order = [2,3,1];
    end
    for j=order
        i = 1;
        if angles(j)<0
            i = 2;
        end
        
        data = motors(i,j).ReadFromNXT();
        pos = data.Position;
        if(angles(j)~=0) 
            motors(i,j).TachoLimit = abs(angles(j));
            motors(i,j).SendToNXT();
            motors(i,j).WaitFor();
            motors(i,j).Stop('off');
        end
    end
end

