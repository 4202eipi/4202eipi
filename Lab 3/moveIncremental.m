function moveIncremental( startPos, endPos )
%DRAWLINE Summary of this function goes here
%   Detailed explanation goes here
    distance = sqrt((endPos(1)-startPos(1))^2+(endPos(2)-startPos(2))^2+(endPos(3)-startPos(3))^2);
    distance = distance / 2.5;
    distance = ceil(distance)+1;
    
    x = linspace(startPos(1),endPos(1),distance);
    y = linspace(startPos(2),endPos(2),distance);
    z = linspace(startPos(3),endPos(3),distance);
    
    dynamixelSetup();

    for i=1:distance
        %disp([num2str(x(i)), ', ', num2str(y(i)), ', ', num2str(z(i))]);
        moveTo(x(i),y(i),z(i));
        pause(1/20);
    end
    
    dynamixelExit();
end

