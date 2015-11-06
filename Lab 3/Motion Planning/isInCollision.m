function inCollision = isInCollision(obstacleMap, x, y, xPadding, yPadding)
%isInCollision checks if point (x, y) is in collision within obstacleMap.


[yMax, xMax] = size(obstacleMap);
inCollision = 0;
i = x;
j = y;
 for i = x-xPadding:x+xPadding
     for j = y-yPadding:y+yPadding
        if i>0 && i<xMax && j>0 && j<yMax 
            if obstacleMap(j, i) == 1
                inCollision = 1;
                return
            end
        end
     end
 end

end

