function [ max ] = maxHeight( locations, number, max_number )
    max = 0;
    for i=number:max_number
        if(locations(i,3)>max)
            max = locations(i,3);
        end
    end
end