function [ result ] = convolution( polar_row, filter )
%CONVOLUTION Summary of this function goes here
%   Detailed explanation goes here

image_fourier_transformation = fft(polar_row);
result = ifft(image_fourier_transformation .* filter);

end

