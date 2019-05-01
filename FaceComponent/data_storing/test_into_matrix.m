function [ test_faces ] = test_into_matrix( test_data, split_scale )
%TEST_INTO_MATRIX Summary of this function goes here
%   Detailed explanation goes here

for i = 1:size(test_data, 2)
    
    for ii = 1:size(test_data{i}, 2)
       
        test_faces(:, single((i - 1) * (10 * (1 - split_scale)) + ii)) = test_data{i}(:, ii);
        
    end
    
end

end

