function [ xl, yl, bottom_eylid_line_coords ] = bottom_eyelid_coords( image, lines, bottom_eyelid, iris_rectangle_edges, pupil_coords )
%BOTTOM_EYELID_COORDS Summary of this function goes here
%   Detailed explanation goes here

if size(lines,1) > 0
    [xl, yl] = line_coords(lines, size(bottom_eyelid));
    
    % Get exect coordinates on line points in eye image
    yl = double(yl) + iris_rectangle_edges(1) + pupil_coords(1) + pupil_coords(3) - 2;
    xl = double(xl) + iris_rectangle_edges(3) - 1;
    
    % Indexes for drowing noise rectangle
    yl_min = min(yl);
    yl_from_bottom = round(yl_min:size(image,1));
    
    % Eyelid line points
    bottom_eylid_line_coords = round(sub2ind(size(image),yl,xl));
    
    yl = yl_from_bottom;

else
    xl = [];
    yl = [];
    bottom_eylid_line_coords = [];
end

end

