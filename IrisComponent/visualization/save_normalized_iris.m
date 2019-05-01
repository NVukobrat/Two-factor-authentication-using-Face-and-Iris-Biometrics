function save_normalized_iris( image_with_noise, image_name, polar_array, polar_noise, xo, yo, iris_coords, pupil_coords )
%SAVE_NORMALIZED_IRIS Summary of this function goes here
%   Detailed explanation goes here

global ROOT;
global IRIS_DIAG;

% Drow outlining points on image
index = sub2ind(size(image_with_noise),double(yo),double(xo));
image_with_noise(index) = 255;

% Drow pupil and iris boundaries
image_with_noise = draw_circle(image_with_noise, iris_coords);
image_with_noise = draw_circle(image_with_noise, pupil_coords);

% Save image
cd(IRIS_DIAG);
imwrite(uint8(image_with_noise), [image_name '_normalized' '.png']);
imwrite(polar_array, [image_name '_polar' '.png']);
imwrite(polar_noise, [image_name '_polar_noise' '.png']);
cd(ROOT);

end

