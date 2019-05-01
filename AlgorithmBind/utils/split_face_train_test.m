function [ face_train, face_test ] = split_face_train_test( candidate_faces, face_split_scale )
%SPLIT_FACE_TRAIN_TEST Summary of this function goes here
%   Detailed explanation goes here

global ROOT;
global FACE_COMPONENT_PATH;

cd(FACE_COMPONENT_PATH);

[ face_train, face_test ] = train_test_split( candidate_faces, face_split_scale);

cd(ROOT);

end

