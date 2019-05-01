function [template, mask] = extract_template( iris_image, image_name )
%EXTRACT_TEMPLATE Summary of this function goes here
%   Detailed explanation goes here

% Get candidate segmentated data
global IRIS_DIAG;
condidate_data_path = [IRIS_DIAG image_name '_segmentation_params.mat'];

if exist(condidate_data_path, 'file')
    load(condidate_data_path);
else
    % Segmentation
    [iris_coords, pupil_coords, image_with_noise] = segment_iris(iris_image);
    save(condidate_data_path, 'iris_coords', 'pupil_coords', 'image_with_noise');
    
    % Diagnostics - Segmentation
    save_segmented_images( iris_image, image_with_noise, iris_coords, pupil_coords, image_name );
end

% Normalizaiton
[polar_array, polar_noise, xo, yo] = normalise_iris(image_with_noise, iris_coords, pupil_coords);

% Diagnostics - Normalization
save_normalized_iris( image_with_noise, image_name, polar_array, polar_noise, xo, yo, iris_coords, pupil_coords );

% Encoding
[template, mask] = encode( polar_array, polar_noise );

% Diagnostics - Encoding
save_encoded_iris( template, mask, image_name );

end

