function [ degree ] = getPanDegree(point)
    x = point(1) - 5.625;
    y = point(2) + 3;
    degree = atand(y/x);
    if degree<0
        degree = degree + 180;
    end
end