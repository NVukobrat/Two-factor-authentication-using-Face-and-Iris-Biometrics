function [ shifted_template ] = shift_bits( template, num_shifts, num_scales )
%SHIFT_BITS Summary of this function goes here
%   Detailed explanation goes here

shifted_template = zeros(size(template));

width = size(template, 2);
s = round(2 * num_scales * abs(num_shifts));
p = round(width - s);

if num_shifts == 0
    shifted_template = template;
elseif num_shifts < 0
    x = 1:p;
    shifted_template(:, x) = template(:, s + x);
    
    x = (p + 1):width;
    shifted_template(:, x) = template(:, x - p);
else
    x=(s + 1):width;
    shifted_template(:, x) = template(:, x - s);
    
    x = 1:s;
    shifted_template(:, x) = template(:, p + x);
end

end

