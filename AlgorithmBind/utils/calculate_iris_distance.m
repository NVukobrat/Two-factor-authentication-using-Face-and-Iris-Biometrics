function [ distance ] = calculate_iris_distance( first_template, first_mask, second_template, second_mask )
%CALCULATE_IRIS_DISTANCE Summary of this function goes here
%   Detailed explanation goes here

global ROOT;
global IRIS_COMPONENT_PATH;

cd(IRIS_COMPONENT_PATH);

% Hamming distance
[ distance ] = hamming_distance( first_template, first_mask, second_template, second_mask, 1 );

cd(ROOT);

end

