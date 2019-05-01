function [ x, y, r ] = find_circle( iris_image, lower_radius, upper_radius, scale_factor )
%FIND_CIRCLE Summary of this function goes here
%   Detailed explanation goes here

fprintf('Finding circle in image...\n')

% Calculate scaled iris measurements
lower_radius = round(lower_radius * scale_factor);
upper_radius = round(upper_radius * scale_factor);
radius = round(upper_radius * scale_factor - lower_radius * scale_factor);

% Find Hough circles on iris image
circles = hough_circles(iris_image, lower_radius, upper_radius);

% Find best fitting circle in Hough space
[x, y, r ] = best_fitting_circle(circles, radius, scale_factor, lower_radius);

fprintf('Circle is founded.\n')

end

