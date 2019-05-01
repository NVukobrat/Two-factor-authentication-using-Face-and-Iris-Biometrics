function [ ox, oy ] = displacement_of_centers( iris_coords, pupil_coords )
%DISPLACEMENT_OF_CENTERS Summary of this function goes here
%   Detailed explanation goes here

oy = pupil_coords(1) - iris_coords(1);
ox = pupil_coords(2) - iris_coords(2);

end

