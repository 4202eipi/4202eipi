function [ x, y, z ] = getXYZ( ~ )
%GETXYZ Summary of this function goes here
%   Detailed explanation goes here

    for i=1:3
        angle(i) = int32(calllib('dynamixel','dxl_read_word',i,36));
        if i==1
            angle(i) = angle(i) * 360 / 4096;
        else
            angle(i) = angle(i) * 300 / 1024;
        end
        if i==1
            angle(i) = 270 - angle(i);
        elseif i==2
            angle(i) = angle(i) - 150;
        elseif i==3
            angle(i) = angle(i) - 60;
        end
        angle(i)
    end
end

