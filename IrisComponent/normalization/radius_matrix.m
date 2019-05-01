function [ radius_mat ] = radius_matrix( r, radial_step, angular_step, pupil_coords )
%RADIUS_MATRIX Summary of this function goes here
%   Detailed explanation goes here

radius_mat = ones(1, radial_step + 2)' * r;
radius_mat = radius_mat .* (ones(angular_step, 1) * [0:1/((radial_step + 1)):1])';
radius_mat = radius_mat + pupil_coords(3);

% Exclude values on boundaries of pupil and iris, they can introduce noise.
radius_mat  = radius_mat(2:(radial_step + 1), :);

end

