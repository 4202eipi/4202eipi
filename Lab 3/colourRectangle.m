function colourRectangle( points )
%COLOURRECTANGLE Summary of this function goes here
%   Detailed explanation goes here
    i = 0;
    while(points(1,2)+i<points(4,2))
        drawLine(points(1)+[0 i 0],points(2)+[0 i 0]);
        drawLine(points(2)+[0 i 0],points(2)+[0 i+1 0]);
        drawLine(points(2)+[0 i+1 0],points(1)+[0 i+1 0]);
        drawLine(points(1)+[0 i+1 0],points(1)+[0 i+2 0]);
        i = i+2;
    end

end

