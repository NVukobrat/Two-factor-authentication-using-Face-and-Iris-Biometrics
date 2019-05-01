function [ signatures ] = train_signatures( train_faces, number_of_vectors, normalized_train_faces, Vectors )
%COMPUTE_SIGNATURES Summary of this function goes here
%   Detailed explanation goes here

signatures = zeros(size(train_faces, 2), number_of_vectors);
for i = 1:size(train_faces, 2)
   
    signatures(i, :) = normalized_train_faces(:, i)' * Vectors;
    
end

end

