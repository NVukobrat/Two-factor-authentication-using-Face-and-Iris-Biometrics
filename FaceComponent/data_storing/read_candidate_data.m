function [ candidates_data ] = read_candidate_data()
% READ_CANDIDATE_DATA Reads all candidate faces into cell array.
%   For each candidate all face images are readed into cell array. After
%   that all cell arrays with candidate faces for each candidate are
%   accommodated into matrix that consists of  matrix of each person face. 
%   Each person face matrix consists of 10 column vectors that represents
%   each face vector of candidate.

% Constants
data_dir = 'data/';
candidates_dir = strcat(data_dir, 's*');

% Read all candidate images
candidates = dir(candidates_dir);
number_of_candidates = length(candidates);

for i = 1:number_of_candidates
    candidate_name = candidates(i).name;
    candidate_image_list = dir(strcat(data_dir, candidate_name, '/*.pgm'));
    candidate_image_number = length(candidate_image_list);
    
    for ii = 1:candidate_image_number
        candidate_image_name = candidate_image_list(ii).name;
        candidate_image_path = strcat(data_dir, candidate_name, '/' ,candidate_image_name);
        candidate_image = imread(candidate_image_path);
        candidate_readed_images(:, ii) = double(candidate_image(:));
    end
    
    candidates_data{i} = candidate_readed_images;
    
end

end