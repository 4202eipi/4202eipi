function [ positions_out ] = sort_positions( positions_in, num_positions )
    n = num_positions;
    swapped = true;
    while swapped==true
        swapped = false;
        for i=2:n
            if(get_pan_degree(positions_in(i,:)) < get_pan_degree(positions_in(i-1,:)))
                temp = positions_in(i,:);
                positions_in(i,:) = positions_in(i-1,:);
                positions_in(i-1,:) = temp;
                swapped = true;
            end
        end
        n = n-1;
    end
    positions_out = positions_in;
end