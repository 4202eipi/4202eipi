function colourSquare( point, width )
%COLOURSQUARE Summary of this function goes here
%   Detailed explanation goes here

    colourRectangle([point + [-width/2 -width/2 0]; point + [width/2 -width/2 0]; point + [width/2 width/2 0]; point + [-width/2 width/2 0]]);

end

