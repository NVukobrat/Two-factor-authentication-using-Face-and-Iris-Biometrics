function edges = extract_line_edges( image, scale_factor, thresh )
%EXTRACT_LINE_EDGES Summary of this function goes here
%   Detailed explanation goes here

fprintf('Extracting eyelid edges...\n')

% Security, if iris is baddly captured
if size(image, 1) == 0 || size(image, 2) == 0
   edges = [];
else
    
    % Extract horizontal edges using Sobel method.
    image = imresize(image, scale_factor);
    edges = edge(image, 'Sobel', thresh, 'horizontal');
    
end



fprintf('Eyelid edges extracted.\n')

end

