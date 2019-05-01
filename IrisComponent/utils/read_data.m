function [ candidates_data ] = read_data(image_width, image_height)
%READ_DATA Summary of this function goes here
%   Detailed explanation goes here

fprintf('Reading candidate data...\n')

% Loop over all folders
for i = 1:length(dir('data/0*'))
    
    % Correctly name candidate folders
    if i < 10
        candidate_dir = strcat('00', num2str(i));
    else
        candidate_dir = strcat('0', num2str(i));
    end

    % Choose left or right eye for data
    if (isempty(dir(strcat('data/', candidate_dir, '/R/S*'))))
        candidate_dir = strcat('data/', candidate_dir, '/L/S*');
    else
        candidate_dir = strcat('data/', candidate_dir, '/R/S*');
    end
    
    % Get struct of candidate directory and number of images inside
    candidate_images_dir = dir(candidate_dir);
    candidate_images_num = length(dir(candidate_dir));
    
    % Restet the path of candidate directory for reading images
    candidate_dir = candidate_dir(1:length(candidate_dir) - 2);
    
    % Reads images vectors of each candidate
    candidate_images = zeros(candidate_images_num, image_width * image_height);
    
    for ii = 1:candidate_images_num
       candidate_image_name = candidate_images_dir(ii).name;
       candidate_image_path = strcat(candidate_dir, candidate_image_name);
       candidate_current_image = imread(candidate_image_path);
       candidate_images(ii, :) = candidate_current_image(:);
    end
    
    % Creates a row vector of all candidates data
    candidates_data{i} = candidate_images;
    
end

fprintf('Finished with reading candidate data.\n')

end
