function lines = find_line( image, scale_factor, thresh )
%FIND_LINE Summary of this function goes here
%   Detailed explanation goes here

% Extract eylid edges
edges = extract_line_edges(image, scale_factor, thresh);
% imshow(edges);

% Rotates image from 1 to 180 degrees and does Radeon transformation
[R, Xp] = radon(edges);

% Gets the indexes of max Radeon value
max_value = max(max(R));
if max_value > 25
    indexes = find(R == max_value);
else
    lines = [];
    return;
end

% Gets the multiple max Radon values if exists
max_value_indexes = max_radon_index(R, indexes);

% Calculates angle in radians and gets its radial coordinates
[ theta, radial_coor ] = radon_radian_angle( R, Xp, max_value_indexes );

% Calculates lines measurements for given angle
lines = lines_measurements(image, theta, radial_coor);

end

