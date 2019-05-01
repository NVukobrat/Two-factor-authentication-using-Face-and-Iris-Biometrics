function [ xc, yc ] = circle_coords( x, y, r, image_size )
%CIRCLE_COORDS Summary of this function goes here
%   Detailed explanation goes here

% Calculate iris coordinates in polar space
steps_num = 600;
theta = 0:pi/steps_num:2 * pi;

xc = double(x) + (double(r) * cos(theta));
yc = double(y) + (double(r) * sin(theta));

xc = round(xc);
yc = round(yc);

% Security, if some dots go beyond eye image.
xcc = xc;
coords = xc > image_size(1);
xcc(coords) = image_size(1);
coords = xc <= 0;
xcc(coords) = 1;

ycc = yc;
coords = yc > image_size(2);
ycc(coords) = image_size(2);
coords = yc <= 0;
ycc(coords) = 1;

xc = int32(xcc);
yc = int32(ycc);

end

