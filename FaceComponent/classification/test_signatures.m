function [ signature_test ] = test_signatures( test_faces, mean_train_face, Vectors, train_faces, signatures_train )
%TEST_SIGNATURES Summary of this function goes here
%   Detailed explanation goes here

for i = 1:size(test_faces, 2)
   
    % Normalize
    sigle_test_face = test_faces(:, i) - mean_train_face;
    
    % Compute signatures
    single_signature = sigle_test_face' * Vectors;
    
    for ii = 1:size(train_faces, 2)
        
        % Signature difference
        signature_test(i, ii) = norm(signatures_train(ii, :) - single_signature, 2);
        
    end
    
end

end

