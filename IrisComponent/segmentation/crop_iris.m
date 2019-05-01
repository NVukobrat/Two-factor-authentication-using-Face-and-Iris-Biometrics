function [ croped_iris, iris_rectangle_edges ] = crop_iris( iris_coords, iris_of_one_candidate )
%CROP_IRIS Summary of this function goes here
%   Detailed explanation goes here

% Calculate iris rectangle edges
iris_left = round(iris_coords(1) - iris_coords(3));
iris_right = round(iris_coords(1) + iris_coords(3));
iris_down = round(iris_coords(2) - iris_coords(3));
iris_up = round(iris_coords(2) + iris_coords(3));

% Security, if boundaries goes beyond image
image_size = size(iris_of_one_candidate);
if iris_left < 1
    iris_left = 1;
end

if iris_down < 1
    iris_down = 1;
end

if iris_right > image_size(1)
    iris_right = image_size(1);
end

if iris_up > image_size(2)
    iris_up = image_size(2);
end

iris_rectangle_edges = [iris_left iris_right iris_down iris_up];

croped_iris = iris_of_one_candidate(iris_left:iris_right, iris_down:iris_up);

end

