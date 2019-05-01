function lines = lines_measurements( image, theta, radial_coor )
%LINES_MEASUREMENTS Summary of this function goes here
%   Detailed explanation goes here

lines = [cos(theta) sin(theta) radial_coor];
cx = (size(image, 1) / 2) - 1;
cy = (size(image, 2) / 2) - 1;
lines(:,3) = lines(:,3) - lines(:,1) * cy - lines(:,2) * cx;

end

