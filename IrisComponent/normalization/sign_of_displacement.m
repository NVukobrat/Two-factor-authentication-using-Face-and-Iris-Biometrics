function [ sgn ] = sign_of_displacement( ox, oy )
%SIGN_OF_DISPLACEMENT Summary of this function goes here
%   Detailed explanation goes here

if ox <= 0
    sgn = -1;
elseif ox > 0
    sgn = 1;
end

if ox == 0 && oy > 0
    sgn = 1;
end

end

