function [ Values, Vectors ] = eigen_norm( Values, Vectors, image_number, number_of_vectors )
%EIGEN_NORM Summary of this function goes here
%   Detailed explanation goes here

% Normalise eigenvalues
Values = diag(Values);
Values = Values ./ (image_number - 1);

% Normalize eigenvectors
number_of_good_vectors = 0;
for i = 1:size(Vectors, 2)
    Vectors(:, i) = Vectors(:, i) / norm(Vectors(:, i));
    
    if Values(i) < 0.00001
        Values(i) = 0;
        Vectors(:, i) = zeros(size(Vectors, 1), 1);
    else
        number_of_good_vectors = number_of_good_vectors + 1;
    end
end

if number_of_vectors > number_of_good_vectors
    fprintf(1, '\nWarning: Nuimber of wanted vectors %d and number of good vectors is %d!\n', number_of_vectors, number_of_good_vectors );
    number_of_vectors = number_of_good_vectors;
end

Vectors = Vectors(:, 1:number_of_vectors);

end

