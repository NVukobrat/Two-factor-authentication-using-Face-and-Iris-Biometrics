function circle = add_circle( circle, cords, radius )
%ADD_CIRCLE Summary of this function goes here
%   Detailed explanation goes here

[circle_row_num, circle_col_num] = size(circle);

x = 0:round(radius / sqrt(2));
cos_theta = sqrt(1 - (x .^ 2 / radius .^ 2));
y = round(radius * cos_theta);

% Fill in the 8-way symmetric points on a circle
px = cords(1) + [x  y  y  x -x -y -y -x];
py = cords(2) + [y  x -x -y -y -x  x  y];

% Cull points that are outside limits
validx = px >= 1 & px <= circle_row_num;
validy = py >= 1 & py <= circle_col_num;
valid = find(validx & validy);

% Leave just points that are valid for x and y
px = px(valid);
py = py(valid);

i = px + (py - 1) * circle_row_num;
circle(i) = circle(i) + 1;

end
