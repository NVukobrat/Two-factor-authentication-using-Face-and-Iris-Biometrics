function [ circles ] = hough_circles( iris_image, lower_radius, upper_radius )
%HOUGH_CIRCLES Summary of this function goes here
%   Detailed explanation goes here

fprintf('Calculating Hough circles of image...\n')

% Define circle radius storage space
[image_width, image_height] = size(iris_image);
radius_circle_number = upper_radius - lower_radius + 1;
circles = zeros(image_width, image_height, radius_circle_number);

% Get indexes of extracted edge points
[row, col] = find(iris_image ~= 0);

% For each edge point draw circle of different radius
for i = 1:size(row)
    
    cx = row(i);
    cy = col(i);
   
    for ii = 1:radius_circle_number
        circles(:, :, ii) = add_circle( circles(:, :, ii), [cx, cy], ii + lower_radius);
    end
    
end

fprintf('Hough circles of image are calculated.\n')

end

