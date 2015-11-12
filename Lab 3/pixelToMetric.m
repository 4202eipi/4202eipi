function [ metric ] = pixelToMetric( pixel )
%METRICTOPIXEL Summary of this function goes here
%   Detailed explanation goes here
%   pixel(1) = delta x; pixel(2) = delta y
%   metric(1) = delta x; metric(2) = delta y
    metric(1) = pixel(1) * 340 / 156;
    metric(2) = pixel(2) * 225 / 100;
    metric(3) = pixel(3); %delta z is already in mm
end

