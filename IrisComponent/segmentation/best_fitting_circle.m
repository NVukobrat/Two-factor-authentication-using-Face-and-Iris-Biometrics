function [ x, y, r ] = best_fitting_circle( circles, radius, scale_factor, lower_radius )
%BEST_FITTING_CIRCLE Summary of this function goes here
%   Detailed explanation goes here

fprintf('Looking for best fitting Hough circle...\n')

max_total = 0;

% Find the maximum value in the Hough space
for i = 1:radius
   layer =  circles(:, :, i);
   max_layer = max(max(layer));
   
   if max_layer > max_total
       max_total = max_layer;
       
       [x,y] = ( find(layer == max_layer) );
        
       x = (x(1) / scale_factor);
       y = (y(1) / scale_factor); 
       
       r = ((lower_radius + i) / scale_factor);
   end
   
end

fprintf('Best fitting Hough circle is founded.\n')

end

