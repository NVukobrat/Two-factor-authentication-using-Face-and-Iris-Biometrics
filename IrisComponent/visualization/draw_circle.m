function [ image ] = draw_circle( image, iris_coords )
%DRAW_CIRCLE Summary of this function goes here
%   Detailed explanation goes here

[ xc, yc ] = circle_coords(iris_coords(1), iris_coords(2), iris_coords(3), size(image));
indexes = sub2ind(size(image), double(xc), double(yc));
image(indexes) = 255;

end

