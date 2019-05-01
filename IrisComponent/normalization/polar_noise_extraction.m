function [ polar_noise ] = polar_noise_extraction( polar_array )
%POLAR_NOISE Summary of this function goes here
%   Detailed explanation goes here

polar_noise = zeros(size(polar_array));
coords = isnan(polar_array);
polar_noise(coords) = 1;

end

