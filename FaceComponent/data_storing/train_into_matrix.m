function [ train_faces ] = train_into_matrix( train_data, split_scale )
%TRAIN_INTO_MATRIX Summary of this function goes here
%   Detailed explanation goes here

for i = 1:size(train_data, 2)
    
    for ii = 1:size(train_data{i}, 2)
       
        train_faces(:, (i - 1) * (10 * split_scale) + ii) = train_data{i}(:, ii);
        
    end
    
end

end

