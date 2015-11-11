function [ pixel ] = metricToPixel( metric )
%METRICTOPIXEL Summary of this function goes here
%   Detailed explanation goes here
    pixel(1) = metric(1) * 149 / 350;
    pixel(2) = metric(1) * 149 / 350;
    pixel(2) = 136 - pixel(2);
    pixel(3) = metric(3);
end

