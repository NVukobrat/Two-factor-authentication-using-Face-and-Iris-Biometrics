function [ xl, yl, top_eylid_line_coords ] = top_eyelid_coords( image, lines, top_eyelid, iris_rectangle_edges )
%TOP_EYELID_COORDS Summary of this function goes here
%   Detailed explanation goes here

if size(lines,1) > 0
    [xl, yl] = line_coords(lines, size(top_eyelid));
    
    % Get exect coordinates on line points in eye image
    xl = double(xl) + iris_rectangle_edges(3) - 1;
    yl = double(yl) + iris_rectangle_edges(1) - 1;

    % Indexes for drowing noise rectangle
    yl_max = max(yl);
    yl_from_top = 1:yl_max;
    
    % Eyelid line points
    top_eylid_line_coords = sub2ind(size(image), yl, xl);
    
    yl = yl_from_top;   
else
   xl = [];
   yl = [];
   top_eylid_line_coords = [];
end

end

