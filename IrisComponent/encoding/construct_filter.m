function [ filter ] = construct_filter( wave_length, num_data_pints, radius, sigma )
%CONSTRUCT_FILTER Summary of this function goes here
%   Detailed explanation goes here

% Prealocation
log_gabor_filters  = zeros(1, num_data_pints);

filter_frequency = 1.0 / wave_length;
normalised_radius = filter_frequency / 0.5;

% Inicialize Log Gabor filter
log_gabor_filters(1:(num_data_pints/2 + 1)) = exp((-(log(radius / normalised_radius)) .^ 2) / (2 * log(sigma) ^ 2));  
log_gabor_filters(1) = 0;

% Calculate filter sum
filter = log_gabor_filters;

end
