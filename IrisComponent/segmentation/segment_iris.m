function [ iris_coords, pupil_coords, image_with_noise ] = segment_iris( iris_image )
%SEGMENT_IRIS Summary of this function goes here
%   Detailed explanation goes here

% Configuration
iris_scale_factor = 0.4;
pupil_scale_factor = 0.6;
eyelid_scale_factor = 1;

iris_edge_thresh = 5;
pupil_edge_thresh = 11;
eyelid_edge_thresh = 5;

% Find iris boundaries
[ xi, yi, ri ] = find_iris_boundary(iris_image, iris_scale_factor, iris_edge_thresh);
iris_coords = [xi, yi, ri];

% Crop Iris regin from eye image
[croped_iris, iris_rectangle_edges] = crop_iris(iris_coords, iris_image);
% imshow(croped_iris ./ 255);

% Find pupil boundaries
[ xp, yp, rp ] = find_pupil_boundary(croped_iris, iris_rectangle_edges, pupil_scale_factor, pupil_edge_thresh);
pupil_coords = [xp, yp, rp];

% Find top and bottom eyelid
image_with_noise = double(iris_image);

% Find top eyelid
if xp - rp > size(croped_iris, 1)
    top_eyelid = croped_iris(1:1, :);
else
    top_eyelid = croped_iris(1:round(xp - rp), :);
end
% imshow(top_eyelid ./ 255);

% Find top eyelid noise line
lines = find_line(top_eyelid, eyelid_scale_factor, eyelid_edge_thresh);

% Fill top eyelid with noise rectanble
[ xlt, ylt ] = top_eyelid_coords(iris_image, lines, top_eyelid, iris_rectangle_edges);

if (~isempty(xlt) || ~isempty(ylt))
    image_with_noise(ylt, xlt) = NaN;
%     imshow(image_with_noise ./ 255);
end

% Find bottom eyelid
bottom_eyelid = croped_iris(round(xp + rp):size(croped_iris, 1),:);
% imshow(bottom_eyelid ./ 255);

% Find bottom eyelid noise line
lines = find_line(bottom_eyelid, eyelid_scale_factor, eyelid_edge_thresh);

% Fill bottom eyelid with noise rectangle
[xlb, ylb] = bottom_eyelid_coords(iris_image, lines, bottom_eyelid, iris_rectangle_edges, pupil_coords);

if (~isempty(xlb) || ~isempty(ylb))
    image_with_noise(ylb, xlb) = NaN;
%     imshow(image_with_noise ./ 255);
end

% Eliminate eyelashes
image_with_noise = eliminate_eyelashes(iris_image, image_with_noise, 100);
% imshow(image_with_noise ./ 255);

end

