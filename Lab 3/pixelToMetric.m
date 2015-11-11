function [ metric ] = pixelToMetric( pixel )
%METRICTOPIXEL Summary of this function goes here
%   Detailed explanation goes here
    metric(1) = pixel(1) * 350 / 149;
    metric(2) = pixel(1) * 350 / 149;
    metric(2) = 136 - metric(2);
    metric(3) = pixel(3);
end

