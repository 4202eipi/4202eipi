function [] = markTarget(x, y, z, angles, motors)
    %moveTo(x, y, z+1, motors);
    angles = moveToNew(x, y, z, angles, motors);
end