function [ xi, yi, ri ] = find_iris_boundary( iris_of_one_candidate, iris_scale_factor, iris_edge_thresh )
%FIND_IRIS_BOUNDARY Summary of this function goes here
%   Detailed explanation goes here

% Analysis data
lower_iris_radius = 80;
upper_iris_radius = 150;

% Extract iris edges
iris_edges = extract_circle_edges(iris_of_one_candidate, iris_scale_factor, iris_edge_thresh);
% imshow(iris_edges);

% Finding Iris outher boundary
[ xi, yi, ri ] = find_circle(iris_edges, lower_iris_radius, upper_iris_radius, iris_scale_factor);

end

