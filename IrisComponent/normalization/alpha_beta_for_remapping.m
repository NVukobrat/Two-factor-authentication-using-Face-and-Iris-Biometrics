function [ alpha, beta ] = alpha_beta_for_remapping( ox, oy, angular_step )
%ALPHA_BETA_FOR_REMAPING Summary of this function goes here
%   Detailed explanation goes here

% Determinate sign based on displacement
[ sgn ] = sign_of_displacement( ox, oy );

% Difference squared sum of iris and pupil center displacement
alpha = ones(1, angular_step) .* (ox.^2 + oy.^2);

% Angles based on displacement points
if ox == 0
    phi = pi/2;
else
    phi = atan(oy/ox);
end

% Angular sequence based on angular step
theta = 0:((2*pi)/(angular_step - 1)):2*pi;

beta = sgn .* cos(pi - phi - theta);

end

