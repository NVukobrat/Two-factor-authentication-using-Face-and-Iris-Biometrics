function [ precission ] = calculate_precision( signature_test, split_scale )
%CALCULATE_PRECISION Summary of this function goes here
%   Detailed explanation goes here

TP = 0;
FN = 0;
image_per_candidate = 10;

for i = 1:size(signature_test, 1)
    [~, ii] = min(signature_test(i, :));
    
    % REWORK THIS
    candidate_real_class = ceil((i / (1 - split_scale)) / image_per_candidate);
    candidate_guess_class = ceil((ii / split_scale) / image_per_candidate);
    [i candidate_real_class ii candidate_guess_class]
    
    if candidate_real_class == candidate_guess_class
        TP = TP + 1;
    else
        FN = FN + 1;
    end
    
end

precission = (TP / (TP + FN)) * 100;

end

