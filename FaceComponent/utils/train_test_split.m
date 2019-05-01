function [ train_data, test_data ] = train_test_split( candidate_data, train_test_scale)
%TRAIN_TEST_SPLIT Summary of this function goes here
%   Detailed explanation goes here

% Config
rng(1);

train_test_scale = size(candidate_data{1}, 2) .* train_test_scale;

for i = 1:length(candidate_data)    
    train_index = randperm(size(candidate_data{i}, 2), train_test_scale);
    train_index = sort(train_index);
    
    test_index = (1:10);
    test_index(train_index) = 0;
    test_index = test_index(test_index ~= 0);
    
    train_data{i} = (candidate_data{i}(:, train_index));
    test_data{i} = candidate_data{i}(:, test_index);
end

end

