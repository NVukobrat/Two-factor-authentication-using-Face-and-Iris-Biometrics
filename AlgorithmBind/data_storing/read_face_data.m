function [ candidate_faces ] = read_face_data()
%READ_FACE_DATA Summary of this function goes here
%   Detailed explanation goes here

global ROOT;
global FACE_COMPONENT_PATH;

cd(FACE_COMPONENT_PATH);
candidate_faces = read_candidate_data();
cd(ROOT);

end

