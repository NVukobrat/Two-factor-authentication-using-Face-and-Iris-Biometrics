function [ xo, yo ] = diagnostic_cleaning( image, xo, yo )
%DIAGNOSTIC_CLEANING Summary of this function goes here
%   Detailed explanation goes here

coords = xo > size(image, 2);
xo(coords) = size(image, 2);
coords = xo < 1;
xo(coords) = 1;
xo = round(xo);

coords = yo > size(image, 1);
yo(coords) = size(image, 1);
coords = yo < 1;
yo(coords) = 1;
yo = round(yo);

end

