function [ theta, radial_coor ] = radon_radian_angle( R, Xp, max_value_indexes )
%RADON_RADIAN_ANGLE Summary of this function goes here
%   Detailed explanation goes here

% Default Radon transformation theta
theta = (0:179)';

% Get radial angle and coresponding coordinates
[x, y] = ind2sub(size(R), max_value_indexes);
theta = -theta(y) * pi/180;
radial_coor = -Xp(x);

end

