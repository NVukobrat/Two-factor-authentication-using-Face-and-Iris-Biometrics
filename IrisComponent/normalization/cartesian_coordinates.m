function [ xo, yo ] = cartesian_coordinates( angular_step, radial_step, radius_mat, pupil_coords )
%CARTESIAN_COORDINATES Summary of this function goes here
%   Detailed explanation goes here

theta = 0:((2*pi)/(angular_step - 1)):2*pi;

x_cos_mat = ones(radial_step ,1) * cos(theta);
y_sin_mat = ones(radial_step ,1) * sin(theta);

xo = radius_mat .* x_cos_mat;    
yo = radius_mat .* y_sin_mat;

xo = pupil_coords(2) + xo;
yo = pupil_coords(1) - yo;

end

