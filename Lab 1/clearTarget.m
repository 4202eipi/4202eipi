function [] = clearTarget(x, y, z, motors)
    moveTo(x-0.5, y, z, motors);
    moveTo(x+0.5, y, z, motors);
end