function [ num_data_pints ] = even_points( cols )
%EVEN_POINTS Summary of this function goes here
%   Detailed explanation goes here

num_data_pints = cols;
if mod(num_data_pints, 2) == 1
   num_data_pints = num_data_pints - 1; 
end

end

