function [ face_signatures_train, face_signatures_test ] = extract_face_signatures( candidate_faces )
%EXTRACT_FACE_SIGNATURES Summary of this function goes here
%   Detailed explanation goes here

global ROOT;
global FACE_COMPONENT_PATH;
global EIGEN_VEC_NUM;
global TRAIN_TEST_SPLIT_SCALE;

cd(FACE_COMPONENT_PATH);

% Split data to train and test - PRECISION IS NOT CORRECT AT: 0.8, 0.9
[ train_faces, test_faces ] = train_test_split( candidate_faces, TRAIN_TEST_SPLIT_SCALE);

% Read all train faces in one matrix
[ train_faces_mtx ] = train_into_matrix( train_faces, TRAIN_TEST_SPLIT_SCALE );

% Mean train face
mean_train_face = mean(train_faces_mtx, 2);

% Calculate normalized train faces
normalized_train_faces = train_faces_mtx - mean_train_face;

% Compute eigen vectors and values
[Vectors, ~, ~] = compute_eigenvectors(train_faces_mtx, EIGEN_VEC_NUM);

% Train signatures - each row is signature for one image
[ face_signatures_train ] = train_signatures( train_faces_mtx, EIGEN_VEC_NUM, normalized_train_faces, Vectors );

% Read all test faces in one matrix
[ test_faces_mtx ] = test_into_matrix( test_faces, TRAIN_TEST_SPLIT_SCALE );

% Test signatures
[ face_signatures_test ] = test_signatures( test_faces_mtx, mean_train_face, Vectors, train_faces_mtx, face_signatures_train );

cd(ROOT);

end

