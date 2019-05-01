function [ distance ] = hamming_distance( first_template, first_mask, second_template, second_mask, num_scales )
%HAMMING Summary of this function goes here
%   Detailed explanation goes here

first_template = logical(first_template);
second_template = logical(second_template);

distance = NaN;

for num_shifts = -8:8
   
    % Shift template and mask
    shifted_template = shift_bits( first_template, num_shifts, num_scales );
    shifted_mask =  shift_bits( first_mask, num_shifts, num_scales );
    
    mask = shifted_mask | second_mask;
    
    mask_bits_num = sum(sum(mask == 1));
    total_bits = (size(shifted_template, 1) * size(second_template, 2)) - mask_bits_num;
    
    % Calculate template difference without counting bits in both masks
    template_diff = xor(shifted_template, second_template);
    template_diff = template_diff & ~mask;

    % Distance in percents
    temp_distance = sum(sum(template_diff == 1));
    temp_distance = temp_distance / total_bits;
    
    if temp_distance < distance || isnan(distance)
        distance = temp_distance;
    end
    
end

end
