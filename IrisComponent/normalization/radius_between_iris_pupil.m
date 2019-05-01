function [ r ] = radius_between_iris_pupil( alpha, beta, iris_coords, pupil_coords )
%RADIUS_BETWEEN_IRIS_PUPIL Summary of this function goes here
%   Detailed explanation goes here

r = (sqrt(alpha).*beta) + ( sqrt( alpha.*(beta.^2) - (alpha - (iris_coords(3)^2))));
r = r - pupil_coords(3);

end

