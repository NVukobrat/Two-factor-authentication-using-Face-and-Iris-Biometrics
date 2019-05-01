function [ polar_array ] = future_encoding_cleaning( polar_array )
%FUTURE_ENCODING_CLEANING Summary of this function goes here
%   Detailed explanation goes here

coords = find(isnan(polar_array));
temp_polar_array = polar_array;
temp_polar_array(coords) = 0.5;
average_pixel_value = sum(sum(temp_polar_array)) / (size(polar_array, 1) * size(polar_array, 2));
polar_array(coords) = average_pixel_value;

end

