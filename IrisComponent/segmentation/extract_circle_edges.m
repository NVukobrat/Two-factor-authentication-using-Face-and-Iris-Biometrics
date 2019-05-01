function edges = extract_circle_edges( image, scale_factor, thresh )
%EXTRACT_EDGES Summary of this function goes here
%   Detailed explanation goes here

fprintf('Extracting edges from iris...\n')

% Extract vertical edges using Sobel method.
image = imresize(image, scale_factor);
edges = edge(image, 'Sobel', thresh, 'vertical');

fprintf('Egdes extracted.\n')

end

