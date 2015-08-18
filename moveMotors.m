function [ ] = moveMotors( angles, motors )
    for j=[1,3,2]
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

