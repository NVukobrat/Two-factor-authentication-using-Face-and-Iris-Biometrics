function [ xp, yp, rp ] = find_pupil_boundary( croped_iris, iris_rectangle_edges, pupil_scale_factor, pupil_edge_thresh )
%FIND_PUPIL_BOUNDARY Summary of this function goes here
%   Detailed explanation goes here

% Analysis data
lower_pupil_radius = 28;
upper_pupil_radius = 75;

% Extract pupil edges
pupil_edges = extract_circle_edges(croped_iris, pupil_scale_factor, pupil_edge_thresh);
% imshow(pupil_edges);

% Find Pupil outher boundary
[ xp, yp, rp ] = find_circle(pupil_edges, lower_pupil_radius, upper_pupil_radius, pupil_scale_factor);

% Calculate pupil coordinates in eye image
xp = iris_rectangle_edges(1) + xp;
yp = iris_rectangle_edges(3) + yp;

end

