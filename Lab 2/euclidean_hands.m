function out = euclidean_hands(boxes)
    
    numHands = size(boxes, 1);
    out = [];
    
    for i = 1:numHands
        
       mid_x = boxes(i,1) + boxes(i,3)/2;
       mid_y = boxes(i,2) + boxes(i,4)/2;
       out(end+1) = [mid_x, mid_y];
       
    end
end