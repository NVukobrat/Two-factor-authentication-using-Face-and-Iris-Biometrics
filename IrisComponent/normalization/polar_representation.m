function [ polar_array ] = polar_representation( image, xo, yo )
%POLAR_REPRESENTATION Summary of this function goes here
%   Detailed explanation goes here

[x, y] = meshgrid(1:size(image,2), 1:size(image,1));  
polar_array = interp2(x, y, image, xo, yo);
polar_array = double(polar_array) ./ 255;

end

