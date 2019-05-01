% Analysis
image_width = 280;
image_height = 320;

% Paths
define_globals(pwd);

% Read candidate data
candidates_data = read_data(image_width, image_height);

% Loop over all candidate faces
for i = 1:size(candidates_data, 2)
    
    for ii = 1:size(candidates_data{i})
       
        % Pick candidate eye image
        candidate_eye_image = reshape(candidates_data{i}(ii, :), image_width, image_height);
        image_name = ['candidate_' int2str(i) '_' int2str(ii)];
        
        % Extract iris template
        [template, mask] = extract_template( candidate_eye_image, image_name );
        
    end
    
end
