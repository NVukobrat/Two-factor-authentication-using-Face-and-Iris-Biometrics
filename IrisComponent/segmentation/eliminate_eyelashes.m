function image_with_noise = eliminate_eyelashes( eye_image, image_with_noise, thresh )
%ELIMINATE_EYELASHES Summary of this function goes here
%   Detailed explanation goes here

indexes = eye_image < thresh;
coords = indexes == 1;
image_with_noise(coords) = NaN;

end

