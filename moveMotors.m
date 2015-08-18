function [ ] = moveMotors( angles, motors )
    for i=1:3
        j = 1;
        if angles(i)<0
            j = 2;
        end
        data = motors(i,j).ReadFromNXT();
        pos = data.Position;
        motors(i,j).TachoLimit = angles(1);
        motors(i,j).SendToNXT();
        motors(i,j).WaitFor();
        motors(i,j).Stop('off');
    end
end

