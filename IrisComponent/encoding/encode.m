function [template, mask] = encode( polar_array, polar_noise )
%ENCODE Summary of this function goes here
%   Detailed explanation goes here

% Configuration
num_scales = 1;
wave_length = 18;
mult = 1;
sigma = 0.5;

% Convolve normalised region with Gabor filters
[scale_results, ~] = gabor_filter( polar_array, num_scales, wave_length, mult, sigma );

% Preallocate biometric template and mask
template = zeros(size(polar_array, 1), (size(polar_array, 2) * 2 * num_scales));
mask = zeros(size(template));

polar_row_num_seq = 1:size(polar_array, 1);

% Create an iris template
for i = 1:num_scales
   
    filtered_by_each_scale = scale_results{i};
    
    % Phase quantisation
    real_part = real(filtered_by_each_scale) > 0;
    imag_part = imag(filtered_by_each_scale) > 0;
    
    % Mark off low amplitude values
    low_amplitude_values = abs(filtered_by_each_scale) < 0.0001;
    
    for ii=0:(size(polar_array, 2) - 1)
                
        column_index = double(2 * num_scales * (ii));
        
        % Construct template
        template(polar_row_num_seq, column_index + (2 * i) - 1) = real_part(polar_row_num_seq, ii + 1);
        template(polar_row_num_seq, column_index + (2 * i)) = imag_part(polar_row_num_seq, ii + 1);
        
        % Construct noise mask
        mask(polar_row_num_seq, column_index + (2 * i) - 1) = polar_noise(polar_row_num_seq, ii + 1) | low_amplitude_values(polar_row_num_seq, ii + 1);
        mask(polar_row_num_seq, column_index + (2 * i)) = polar_noise(polar_row_num_seq, ii + 1) | low_amplitude_values(polar_row_num_seq, ii + 1);
        
    end
    
end

end

