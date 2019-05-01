function save_segmented_images( iris_image, image_with_noise, iris_coords, pupil_coords, image_name )
%SAVE_SEGMENTED_IMAGES Summary of this function goes here
%   Detailed explanation goes here

global IRIS_DIAG;
global ROOT;

% Draw iris and pupil boundary
iris_image = draw_circle(iris_image, iris_coords);
iris_image = draw_circle(iris_image, pupil_coords);
% imshow(iris_image ./ 255);

% Save image files
cd(IRIS_DIAG);
imwrite(uint8(iris_image), [image_name '_boundaries' '.png']);
imwrite(uint8(image_with_noise), [image_name '_noise' '.png']);
cd(ROOT);

end

