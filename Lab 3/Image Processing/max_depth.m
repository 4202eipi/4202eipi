function [depth, x, y, avg] = max_depth(depthImage)
% finds the maximum depth of the workspace and returns the depth and
% the coordinates in pixels corresponding to that depth
Ds = depthImage;
sz = size(Ds);
depth = Ds(1,1);
for i=1:sz(1) %rows
    for j=1:sz(2) %columns
        if Ds(i,j) > depth
            depth = Ds(i,j);
            x = i;
            y = j;
        end
        
    end
    
end
avg = ceil(mean(mean(Ds)));



end





