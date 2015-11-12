function [ pixel ] = metricToPixel( metric )
%METRICTOPIXEL Summary of this function goes here
%   Detailed explanation goes here
%   pixel(1) = delta x; pixel(2) = delta y
%   metric(1) = delta x; metric(2) = delta y
    pixel(1) = metric(1) * 156 / 340;
    pixel(2) = metric(1) * 100 / 225;
    pixel(3) = metric(3);
end

