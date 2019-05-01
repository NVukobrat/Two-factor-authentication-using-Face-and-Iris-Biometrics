function save_encoded_iris( template, mask, image_name )
%SAVE_ENCODED_IRIS Summary of this function goes here
%   Detailed explanation goes here

global IRIS_DIAG;
global ROOT;

% Save image files
cd(IRIS_DIAG);
imwrite(template, [image_name '_encoded_template' '.png']);
imwrite(mask, [image_name '_encoded_mask' '.png']);
cd(ROOT);

end

