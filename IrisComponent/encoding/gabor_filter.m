function [scale_results, filter_sum] = gabor_filter( polar_array, num_scales, wave_length, mult, sigma )
%GABOR_FILTER Summary of this function goes here
%   Detailed explanation goes here

[rows, cols] = size(polar_array);
filter_sum = zeros(1, size(polar_array, 2));

% Preallocation
scale_results = cell(1, num_scales);

% Leave even number of data points
[ num_data_pints ] = even_points( cols );

% Preallocation
result = zeros(rows, num_data_pints);

% Frequenty values from 0 to 0.5
radius =  [0:fix(num_data_pints / 2)] / fix(num_data_pints / 2) / 2;
radius(1) = 1;

for scale = 1:num_scales
   
    % Construct filter
    [ filter ] = construct_filter( wave_length, num_data_pints, radius, sigma );
    filter_sum = filter_sum + filter;
    
    % Do convolution for each row
    for i = 1:rows
        result(i, :) = convolution( polar_array(i, 1:num_data_pints), filter );
    end
    
    % Each scale output
    scale_results{scale} = result;
    
    % Wave length of next filter
    wave_length = wave_length * mult;
    
end

filter_sum = fftshift(filter_sum);

end
