function [ x, y ] = line_coords( lines, image_size )
%LINE_COORDS Summary of this function goes here
%   Detailed explanation goes here

% Calculate coordinates of line based on founded lines
x = 1:image_size(2);
y = (-lines(3) - lines(1) * x ) / lines(2);

% Security corrections of boundaries
coords = y > image_size(1);
y(coords) = image_size(1);
coords = y < 1;
y(coords) = 1;

% Rounds values for indexing
x = round(x);
y = round(y);   

end
