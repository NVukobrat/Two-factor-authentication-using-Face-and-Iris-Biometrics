function [Vectors, Values, mean_face] = compute_eigenvectors( images, num_vec )
%COMPUTE_EIGENVECTORS Summary of this function goes here
%   Detailed explanation goes here

% Compute mean face
mean_face = mean(images, 2);

% Compute averge difference between each face and average face
for i = 1:size(images, 2)
    difference_from_mean_face(:, i) = images(:, i) - mean_face;
end

% Calculate covariance matrix
covariance_matrix = difference_from_mean_face' * difference_from_mean_face;

% Calculate eigen vectors and values
[Vectors, Values] = eig(covariance_matrix);

% Sorting Vectors and Values - REWRITE
[Vectors, Values] = sort_eigen(Vectors,Values);

% Compute eigenvectors of covariance matrix
% Vectors = (Vectors' * difference_from_mean_face')';
Vectors = difference_from_mean_face * Vectors;

% Normalization
[ Values, Vectors ] = eigen_norm(Values, Vectors, size(images, 2), num_vec);

end

