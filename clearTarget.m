function [] = clearTarget(x, y, z, motors)
    moveTo(x-1, y, z, motors);
    moveTo(x+1, y, z, motors);
end