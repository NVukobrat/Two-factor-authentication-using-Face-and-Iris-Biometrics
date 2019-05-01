function [ scaled_candidate_face ] = scale_face_values( candidate_face, new_min, new_max )
%SCALE_FACE_VALUES Summary of this function goes here
%   Detailed explanation goes here

current_max = max(candidate_face(:));
current_min = min(candidate_face(:));

scaled_candidate_face = ((candidate_face - current_min) * (new_max - new_min)) / (current_max - current_min) + new_min;

end

