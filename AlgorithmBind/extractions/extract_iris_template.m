function [ iris_template, iris_mask ] = extract_iris_template( iris_train_eye, iris_cache_image_name )
%EXTRACT_IRIS_TEMPLATE Summary of this function goes here
%   Detailed explanation goes here

global IRIS_COMPONENT_PATH;
global ROOT;
global IRIS_WIDTH;
global IRIS_HEIGHT;

cd(IRIS_COMPONENT_PATH);

% Candidate image of eye
candidate_eye_image = reshape(iris_train_eye, IRIS_WIDTH, IRIS_HEIGHT);

% Extract iris template and mask
[iris_template, iris_mask] = extract_template( candidate_eye_image, iris_cache_image_name );

cd(ROOT);

end

